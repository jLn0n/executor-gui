-- init
if not import then return error("not using loader.lua") end
local scriptVersion = "v0.0.4"
local config do
	local loadedConfig = select(1, ...) or table.create(0)

	loadedConfig.customMainTabText = (if typeof(loadedConfig.customMainTabText) ~= "string" then [[print("jLn0n's executor on top!")]] else loadedConfig.customMainTabText)
	loadedConfig.customExecution = (if typeof(loadedConfig.customExecution) ~= "boolean" then false else loadedConfig.customExecution)
	loadedConfig.executeFunc = (if typeof(loadedConfig.executeFunc) ~= "function" then loadstring else loadedConfig.executeFunc)

	config = loadedConfig
end
-- services
local inputService = game:GetService("UserInputService")
local logService = game:GetService("LogService")
local textService = game:GetService("TextService")
local tweenService = game:GetService("TweenService")
-- imports
local lexer = import("src/utils/lexer.lua")()
-- objects
-- ui objects
local GUI = import("src/utils/ui.lua")()
local Templates = import("src/utils/templates.lua")()

local MainUI = GUI.MainUI

-- (Topbar)
local Topbar = MainUI.Topbar
local Buttons = Topbar.Buttons
local CloseBtn = Buttons.Close
local HideBtn = Buttons.Hide
local SidebarToggleBtn = Buttons.SidebarToggle

-- (Containers)
local Container = MainUI.Container
local Executor = Container.Executor
local Console = Container.Console
local Sidebar = Container.Sidebar

-- (Executor)
local ExecButtons = Executor.Buttons
local ExecuteBtn = ExecButtons.Execute
local ClearBtn = ExecButtons.Clear
local HideTextBtn = ExecButtons.HideText
local RFScriptsBtn = ExecButtons.RefreshScripts

local ScriptList = Executor.Scripts
local ScriptScroller = ScriptList.List
local SSListLayout = ScriptScroller.UIListLayout
local SSearchUI = ScriptList.Search
local SSearchInput = SSearchUI.Input

local Tabs = Executor.Tabs
local TabScroller = Tabs.List
local TSListLayout = TabScroller.UIListLayout
local AddTabBtn = Tabs.AddTab

local TextIDE = Executor.TextIDE
local TextLines = TextIDE.Lines
local TLRender = TextLines.Render
local TextboxScroller = TextIDE.Textbox
local LineHighlight = TextboxScroller.LineHighlight
local TextboxInput = TextboxScroller.Input

-- (Console)
local ConsoleBG = Console.Background
local ConsoleScroller = ConsoleBG.List
local CSListLayout = ConsoleScroller.UIListLayout
local ConButtons = Console.Buttons
local ClearConsoleBtn = ConButtons.ClearConsole

-- (Sidebar)
local SdButtons = Sidebar.Buttons
local SdFadeEffect = Sidebar.FadeEffect
local VersionLabel = Sidebar.VersionLabel

-- variables
local stringList = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890!@#$%^&*()"

local scriptListPath = "executor-gui/script-list"

local executorLoaded = false
local uiToggleDebounce = true

local textIDENotHidden = true
local currentTab, defaultTab = "", "Main Tab"
local tabCreateCount = 0

local oldCurrentHighlightedLine = 1

local currentOpenUI = "Executor"
local sidebarOpen = false
local sidebarBtnDebounce = true

local totalConsoleOutputs = 0

local scriptsList = table.create(0)
local textboxTabs = table.create(0)
local lastHighlightUpdate = table.create(0)
local colorFormatters = table.create(8)
local tokenColors = {
	["background"] = Color3.fromRGB(21, 20, 23),
	["iden"] = Color3.fromRGB(211, 211, 211),
	["keyword"] = Color3.fromRGB(215, 174, 255),
	["builtin"] = Color3.fromRGB(131, 206, 255),
	["string"] = Color3.fromRGB(196, 255, 193),
	["number"] = Color3.fromRGB(255, 125, 125),
	["comment"] = Color3.fromRGB(140, 140, 155),
	["operator"] = Color3.fromRGB(255, 239, 148),
}
local consoleColorTypes = {
	[Enum.MessageType.MessageOutput] = Color3.fromRGB(213, 213, 213),
	[Enum.MessageType.MessageInfo] = Color3.fromRGB(5, 145, 245),
	[Enum.MessageType.MessageWarning] = Color3.fromRGB(255, 230, 85),
	[Enum.MessageType.MessageError] = Color3.fromRGB(215, 5, 10)
}
-- functions
local function generateRandomString(lenght, seed)
	local random = Random.new(seed or math.random(10000, 10000000))
	local result = ""

	for _ = 1, lenght do
		local randNumber = random:NextInteger(1, #stringList)
		result ..= string.sub(stringList, randNumber, randNumber)
	end
	return result
end

local function draggify(frame: Frame, button: Frame?)
	local dragToggle = false
	local dragInput, dragStart, startPos

	button.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragStart, startPos = input.Position, frame.Position
			dragToggle = true

			input:GetPropertyChangedSignal("UserInputState"):Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	button.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	inputService.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			local delta = input.Position - dragStart
			local pos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			frame.Position = pos
		end
	end)
end

local function toggleUI(toggleBool: boolean)
	local tweenObj = tweenService:Create(
		MainUI,
		TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Size = (toggleBool and UDim2.new(0, 575, 0, 350) or UDim2.new()), BorderSizePixel = (toggleBool and 1 or 0)}
	)

	Topbar.Visible, Container.Visible = false, false
	MainUI.Position = UDim2.fromScale(.5, .5)
	if toggleBool then
		MainUI.Visible = true
		MainUI.Size, MainUI.BorderSizePixel = UDim2.new(), 0

		tweenObj.Completed:Connect(function()
			Topbar.Visible, Container.Visible = true, true
			tweenObj:Destroy()
		end)
	else
		tweenObj.Completed:Connect(function()
			MainUI.Visible = false
			tweenObj:Destroy()
		end)
	end

	tweenObj:Play()
	return tweenObj
end

local function setSdBtnRot(rotation: number)
	local tweenInfo = TweenInfo.new(.25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	local tweenObj = tweenService:Create(SidebarToggleBtn, tweenInfo, {
		Rotation = rotation
	})

	return tweenObj
end

local function setSidebarVisible(visible: boolean)
	local sidebarTween, fadeTween = tweenService:Create(
		Sidebar,
		TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{Position = (if visible then UDim2.fromOffset(0, 0) else UDim2.fromOffset(-150, 0))}
	), tweenService:Create(
		SdFadeEffect,
		TweenInfo.new(.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{Size = (if visible then UDim2.fromOffset(425, 320) else UDim2.fromOffset(0, 320))}
	)

	SdFadeEffect.Visible = visible
	return sidebarTween, fadeTween
end

local function setContainerUI(uiName)
	local sidebarTween, fadeTween = setSidebarVisible(false)
	local sidebarBtnTween = setSdBtnRot(0)

	sidebarOpen = false
	sidebarBtnTween:Play()
	sidebarTween:Play()
	fadeTween:Play()

	if uiName ~= currentOpenUI then
		Container[currentOpenUI].Visible = false
		Container[uiName].Visible = true
		currentOpenUI = uiName
	end
end

local function getTextSize(inputBox: TextBox)
	local params = Instance.new("GetTextBoundsParams")
	params.Text = inputBox.Text
	params.Font = inputBox.FontFace
	params.Size = inputBox.TextSize
	params.Width = 1e6

	local succ, textSize = pcall(textService.GetTextBoundsAsync, textService, params)

	return (
		if succ then
			textSize
		else
			error(textSize)
	)
end

local function getLinesRender(text: string)
	local result = ""
	local _, lines = string.gsub(text, "\n", "")
	lines += 1

	for line = 1, lines do
		result ..= tostring(line) .. "\n"
	end
	return result
end

local function sanitizeText(text: string, ...)
	local args = {...}

	for _, arg in args do
		if arg == "richtext" then
			text = string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(text, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), '"', "&quot;"), "'", "&apos;")
		elseif arg == "tabs" then
			text = string.gsub(text, "\t", "    ")
		elseif arg == "control" then
			text = string.gsub(text, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
		end
	end

	return text
end

local function IDESyntaxHighlight(inputBox: TextBox, params: {any}) -- https://github.com/boatbomber/Highlighter/blob/main/src/init.lua
	params = params or table.create(0)
	local source = sanitizeText(params.textSrc or inputBox.Text, "control", "tabs")

	local data = lastHighlightUpdate[inputBox]
	if data == nil then
		data = {
			textSrc = "",
			textLines = table.create(10000),
			highlightRenders = table.create(10000),
		}
		lastHighlightUpdate[inputBox] = data
	elseif (not params.forceUpdate and data.textSrc == inputBox.Text) then
		return
	end

	data.textSrc = source
	data.textLines = string.split(source, "\n")

	local lineFolder = inputBox:FindFirstChild("RenderContainer")
	if not lineFolder then
		local newLineFolder = Instance.new("Folder")
		newLineFolder.Name = "RenderContainer"
		newLineFolder.Parent = inputBox

		lineFolder = newLineFolder
	end

	local lineLabels = data.highlightRenders

	if data.textSrc == "" then
		for lineIndex = 1, #lineLabels do
			if lineLabels[lineIndex].Text == "" then continue end
			lineLabels[lineIndex].Text = ""
		end

		return
	end

	local textBounds = inputBox.TextBounds
	while (textBounds.Y ~= textBounds.Y) or (textBounds.Y < 1) do
		task.wait()
		textBounds = inputBox.TextBounds
	end

	local numLines = #data.textLines
	local textHeight = textBounds.Y / numLines * inputBox.LineHeight

	local richText, index, lineNumber = table.create(5), 0, 1
	for token, content in lexer.scan(source) do
		local tokenColor = tokenColors[token] or tokenColors.iden
		local lines = string.split(sanitizeText(content, "richtext"), "\n")

		for lineIndex, lineSrc in lines do
			local lineLabel = lineLabels[lineNumber]
			if not lineLabel then
				lineLabel = Instance.new("TextLabel")
				lineLabel.Name = lineNumber
				lineLabel.RichText = true
				lineLabel.BackgroundTransparency = 1
				lineLabel.Text = ""
				lineLabel.TextXAlignment = Enum.TextXAlignment.Left
				lineLabel.TextYAlignment = Enum.TextYAlignment.Top
				lineLabel.TextColor3 = tokenColors.iden
				lineLabel.Font = inputBox.Font
				lineLabel.FontFace = inputBox.FontFace
				lineLabel.TextSize = inputBox.TextSize
				lineLabel.Parent = lineFolder
				lineLabels[lineNumber] = lineLabel
			end

			lineLabel.Size = UDim2.new(1, 0, 0, math.ceil(textHeight))
			lineLabel.Position = UDim2.fromScale(0, textHeight * (lineNumber - 1) / inputBox.AbsoluteSize.Y)

			if lineIndex > 1 then
				-- Set line
				lineLabels[lineNumber].Text = table.concat(richText)
				-- Move to next line
				lineNumber += 1
				index = 0
				table.clear(richText)
			end
			index += 1

			-- Only add RichText tags when the color is non-default and the characters are non-whitespace
			if tokenColors ~= tokenColors.iden and string.find(lineSrc, "[%S%C]") then
				richText[index] = string.format(colorFormatters[tokenColor], lineSrc)
			else
				richText[index] = lineSrc
			end
		end
	end

	-- Set final line
	if richText[1] and lineLabels[lineNumber] then
		lineLabels[lineNumber].Text = table.concat(richText)
	end

	-- Clear unused line labels
	for lineIndex = lineNumber + 1, #lineLabels do
		if lineLabels[lineIndex].Text == "" then continue end
		lineLabels[lineIndex].Text = ""
	end
end

local function refreshSyntaxHighlight()
	for textObject, data in lastHighlightUpdate do
		for _, lineLabel in ipairs(data.Lines) do
			lineLabel.TextColor3 = tokenColors["iden"]
		end

		IDESyntaxHighlight(textObject, {
			textSrc = data.Text,
			forceUpdate = true,
		})
	end
end

local function setTokenColors(newTokenColors)
	for token, color in newTokenColors do
		tokenColors[token] = color
		colorFormatters[color] = string.format("<font color=\"#%.2x%.2x%.2x\">", color.R * 255, color.G * 255, color.B * 255) .. "%s</font>"
	end

	refreshSyntaxHighlight()
end

local function getCurrentLinePosition(inputBox: TextBox)
	if not inputBox then return end
	if inputBox.CursorPosition == -1 then return oldCurrentHighlightedLine end
	local findIndex, currentLine = 0, 0

	while true do
		currentLine += 1
		findIndex = string.find(inputBox.Text, "\n", findIndex + 1)

		if not findIndex then break end
		if findIndex > (inputBox.CursorPosition - 1) then
			return currentLine
		end
	end
	return currentLine
end

local function updateLineHighlight(customLine: number?)
	local currentLine = customLine or (if TextboxInput:IsFocused() then getCurrentLinePosition(TextboxInput) else oldCurrentHighlightedLine)
	oldCurrentHighlightedLine = (if customLine then oldCurrentHighlightedLine else currentLine)

	LineHighlight.Position = UDim2.fromOffset(
		0,
		(TextboxInput.TextSize * currentLine) - TextboxInput.TextSize
	)
end

local function updateIDE()
	task.defer(IDESyntaxHighlight, TextboxInput)
	task.defer(updateLineHighlight)
	TextboxInput.Text = sanitizeText(TextboxInput.Text, "tabs") -- sanitize cringe \t (but it doesn't really sanitize it :sad:)

	local linesRender = getLinesRender(TextboxInput.Text)
	TLRender.Text = linesRender

	local TextboxSize, LinesSize = getTextSize(TextboxInput), getTextSize(TLRender)
	TextLines.Size = UDim2.new(0, (LinesSize.X + 10), 1, 0)
	TextLines.CanvasSize = UDim2.new(0, 0, 0, (LinesSize.Y + 7))

	TextboxScroller.Position = UDim2.new(0, TextLines.Size.X.Offset, 0, 0)
	TextboxScroller.Size = UDim2.new(0, (425 - TextLines.Size.X.Offset), 1, 0)
	TextboxScroller.CanvasSize = UDim2.fromOffset((TextboxSize.X + 7), (TextboxSize.Y + 7))
end

local function updateScroll()
	updateLineHighlight()
	TextLines.CanvasPosition = (Vector2.yAxis * TextboxScroller.CanvasPosition.Y)
end

local function onMouseScroll(inputObj)
	if (inputObj.UserInputType == Enum.UserInputType.MouseWheel) then
		TextboxInput:ReleaseFocus()
	end
end

local function selectTab(tabName: string)
	if tabName == currentTab then return end -- no recursive thing

	local selectedTab = textboxTabs[tabName]
	local currentTabObj = textboxTabs[currentTab]
	if not selectedTab then return end

	currentTab = tabName
	if currentTabObj then currentTabObj.BorderColor3 = selectedTab.BorderColor3 end
	selectedTab.BorderColor3 = Color3.fromRGB(61, 64, 62)
	TextboxInput.Text = selectedTab.Data.Value
	task.defer(updateLineHighlight, 1)
end

local function createTab(tabName: string, source: string?, removeCloseBtn: boolean?)
	local newTab = Templates.TabTemplate:Clone()
	local TabLabel = newTab.Label
	local TabCloseBtn = newTab.Close

	newTab.Name, TabLabel.Text = tabName, tabName
	local textSize = getTextSize(TabLabel)
	local textSizeX = (textSize.X + 10) + (if not removeCloseBtn then 20 else 0)

	newTab.Size = UDim2.new(0, textSizeX, 0, 30)
	if removeCloseBtn then
		TabLabel.Size = UDim2.fromScale(1, 1)

		TabCloseBtn:Destroy()
	else
		TabLabel.Size = UDim2.new(0, textSizeX - 20, 1, 0)

		TabCloseBtn.MouseButton1Click:Connect(function()
			selectTab(defaultTab)
			newTab:Destroy()
			textboxTabs[tabName] = nil
		end)
	end

	TabLabel.MouseButton1Click:Connect(function()
		selectTab(tabName)
	end)

	textboxTabs[tabName] = newTab
	newTab.Data.Value = (source or newTab.Data.Value)
	newTab.Parent = TabScroller
	selectTab(tabName)
end

local function updateTabData()
	local tabObj = textboxTabs[currentTab]
	if not tabObj then return end

	tabObj.Data.Value = TextboxInput.Text
end

local function updateTabCanvasSize()
	TabScroller.CanvasSize = UDim2.fromOffset(TSListLayout.AbsoluteContentSize.X, 0)
end

local function refreshScriptList(dontReloadScriptsFolder: boolean)
	if not dontReloadScriptsFolder then
		for _, filePath in listfiles(scriptListPath) do
			if (isfolder(filePath) or scriptsList[filePath]) then continue end
			local fileData = readfile(filePath)
			local fileName = string.split(filePath, "\\")
			fileName = fileName[#fileName]

			scriptsList[fileName] = fileData
		end
	end

	for scriptName, scriptSource in scriptsList do
		if ScriptScroller:FindFirstChild(scriptName) then continue end
		local newScript = Templates.ScriptTemplate:Clone()
		local ScriptLabel = newScript.Label

		newScript.Name, ScriptLabel.Text = scriptName, scriptName
		newScript.MouseButton1Click:Connect(function()
			if textboxTabs[scriptName] then return end
			createTab(scriptName, scriptSource)
		end)

		newScript.Parent = ScriptScroller
	end

	ScriptScroller.CanvasSize = UDim2.fromOffset(0, SSListLayout.AbsoluteContentSize.Y)
end

local function searchScriptListFromName(scriptName)
	scriptName = string.lower(scriptName)

	for _, scriptBtn in ScriptScroller:GetChildren() do
		if not scriptBtn:IsA("TextButton") then continue end
		scriptBtn.Visible = (string.sub(string.lower(scriptBtn.Name), 0, string.len(scriptName)) == scriptName)
	end

	ScriptScroller.CanvasSize = UDim2.fromOffset(0, SSListLayout.AbsoluteContentSize.Y)
end

local function onScriptScrollerCanvasResize()
	local currentCanvasSize = SSListLayout.AbsoluteContentSize
	for _, scriptBtn in ScriptScroller:GetChildren() do
		if not scriptBtn:IsA("TextButton") then continue end
		scriptBtn.Size = (
			if currentCanvasSize.Y >= ScriptScroller.AbsoluteSize.Y then
				UDim2.new(1, -6, 0, 25)
			else
				UDim2.new(1, 0, 0, 25)
		)
	end
end

local function createConsoleOutputLabel(outputColor, ...)
	outputColor = outputColor or consoleColorTypes[Enum.MessageType.MessageOutput]
	local message = table.concat({...}, " ")

	totalConsoleOutputs += 1
	local outputMsg = Templates.OutputTemplate:Clone()
	outputMsg.Name = totalConsoleOutputs
	outputMsg.Text = message
	outputMsg.Parent = ConsoleScroller
	outputMsg.TextColor3 = consoleColorTypes[outputColor] or outputColor

	local textSize = getTextSize(outputMsg)
	outputMsg.Size = UDim2.fromOffset(textSize.X, textSize.Y)

	ConsoleScroller.CanvasSize = UDim2.fromOffset(CSListLayout.AbsoluteContentSize.X + 5, CSListLayout.AbsoluteContentSize.Y + 5)
end

local function onMessageLog(message, msgType, timestamp)
	timestamp = timestamp or os.clock()
	message = string.format("%s | %s", os.date("%X", timestamp), message)

	task.spawn(createConsoleOutputLabel, msgType, message)
end
-- main
-- (PRE-INIT)
GUI.Name = generateRandomString(128)
GUI.Parent = (gethui and gethui() or game:GetService("CoreGui").RobloxGui)
draggify(MainUI, Topbar)

VersionLabel.Text = scriptVersion
-- (Topbar)
CloseBtn.MouseButton1Click:Connect(function()
	toggleUI(false).Completed:Wait()
	GUI:Destroy()
end)

HideBtn.MouseButton1Click:Connect(function()
	toggleUI(false)
end)

SidebarToggleBtn.MouseButton1Click:Connect(function()
	if not sidebarBtnDebounce then return end
	local sidebarTween, fadeTween = setSidebarVisible(not sidebarOpen)
	local sidebarBtnTween = setSdBtnRot(if sidebarOpen then 0 else 90)

	sidebarBtnDebounce = false
	sidebarTween:Play()
	sidebarBtnTween:Play()
	fadeTween:Play()

	sidebarTween.Completed:Connect(function()
		sidebarOpen = not sidebarOpen
		sidebarTween:Destroy()
		sidebarBtnTween:Destroy()
		fadeTween:Destroy()

		task.wait(.025)
		sidebarBtnDebounce = true
	end)
end)

-- (Sidebar - Container)
for _, objBtn in SdButtons:GetChildren() do
	objBtn.MouseButton1Click:Connect(function()
		setContainerUI(objBtn.Name)
	end)
end

-- (Executor - Container)
-- (Buttons)
ExecuteBtn.MouseButton1Click:Connect(function()
	if (config.customExecution and config.executeFunc) then
		local executeFunc = config.executeFunc
		task.spawn(executeFunc, TextboxInput.Text, string.format("@Executor - %s", currentTab))
	else
		loadstring(TextboxInput.Text, string.format("@Executor - %s", currentTab))()
	end
end)

ClearBtn.MouseButton1Click:Connect(function()
	TextboxInput.Text = ""
end)

HideTextBtn.MouseButton1Click:Connect(function()
	textIDENotHidden = not textIDENotHidden
	TextboxInput.Visible = textIDENotHidden
end)

RFScriptsBtn.MouseButton1Click:Connect(refreshScriptList)

-- (TextboxIDE init)
TextboxInput:GetPropertyChangedSignal("Text"):Connect(updateIDE)
TextboxInput:GetPropertyChangedSignal("CursorPosition"):Connect(updateLineHighlight)
TextboxInput.InputChanged:Connect(onMouseScroll)
TextboxScroller:GetPropertyChangedSignal("CanvasPosition"):Connect(updateScroll)
setTokenColors(tokenColors)
task.defer(updateIDE)

-- (Tabs)
AddTabBtn.MouseButton1Click:Connect(function()
	tabCreateCount += 1
	createTab("Tab " .. tabCreateCount)
end)

TextboxInput:GetPropertyChangedSignal("Text"):Connect(updateTabData)
TSListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateTabCanvasSize)

-- (Search)
SSearchInput.FocusLost:Connect(function()
	searchScriptListFromName(SSearchInput.Text)
end)

ScriptScroller:GetPropertyChangedSignal("CanvasSize"):Connect(onScriptScrollerCanvasResize)

-- (Console - Container)
logService.MessageOut:Connect(onMessageLog)
logService.ServerMessageOut:Connect(onMessageLog)

ClearConsoleBtn.MouseButton1Click:Connect(function()
	for _, outputMsg in ConsoleScroller:GetChildren() do
		if not outputMsg:IsA("TextLabel") then continue end
		outputMsg:Destroy()
	end

	totalConsoleOutputs = 0
end)

-- (POST-INIT)
Topbar.Visible, Container.Visible = false, false
MainUI.Size, MainUI.BorderSizePixel = UDim2.new(), 0

inputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.RightControl and not inputService:GetFocusedTextBox() then
		if (not uiToggleDebounce or not executorLoaded) then return end

		local toggleTween = toggleUI(not MainUI.Visible)
		uiToggleDebounce = false

		toggleTween.Completed:Connect(function()
			sidebarOpen = false
			Sidebar.Position = UDim2.fromOffset(-150, 0)
			SdFadeEffect.Visible, SdFadeEffect.Size = false, UDim2.fromOffset(0, 320)
			SidebarToggleBtn.Rotation = 0

			task.wait(.25)
			uiToggleDebounce = true
			toggleTween:Destroy()
		end)
	end
end)

game.Close:Connect(function()
	-- TODO: make a file saving system
	-- well it does save but what's the point of this if u can't modify the file inside the executor
	for fileName, fileData in scriptsList do
		writefile(scriptListPath .. "/" .. fileName, fileData)
	end
end)

task.defer(function()
	do -- script-list initializer
		if not isfolder(scriptListPath) then
			makefolder(scriptListPath)
		end
	end

	createTab(defaultTab, config.customMainTabText, true)
	refreshScriptList()
	toggleUI(true).Completed:Wait()
	executorLoaded = true
end)

local execGuiAPI = {}
execGuiAPI._VERSION = scriptVersion

execGuiAPI.executor = {}
execGuiAPI.executor.newTab = createTab
execGuiAPI.executor.setIDETokenColors = setTokenColors

execGuiAPI.console = {}
execGuiAPI.console.createOutput = onMessageLog

return execGuiAPI
