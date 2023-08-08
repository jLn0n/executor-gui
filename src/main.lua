-- init
if not USING_JALON_LOADER then return error("[executor-gui]: not using loader.lua!") end
local scriptVersion = "v0.1.1"
local config do
	local loadedConfig = select(1, ...) or table.create(0)

	loadedConfig.mainTabText = (if typeof(loadedConfig.mainTabText) ~= "string" then [[print("Hello World!")]] else loadedConfig.mainTabText)
	loadedConfig.customExecution = (if typeof(loadedConfig.customExecution) ~= "boolean" then false else loadedConfig.customExecution)
	loadedConfig.executeFunc = (if typeof(loadedConfig.executeFunc) ~= "function" then loadstring else loadedConfig.executeFunc)

	config = loadedConfig
end

local _JALON_EXECUTOR_INTERNAL do
	_JALON_EXECUTOR_INTERNAL = {}
	getfenv()._JALON_EXECUTOR_INTERNAL = _JALON_EXECUTOR_INTERNAL
end

-- services
local inputService = game:GetService("UserInputService")
local logService = game:GetService("LogService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")

-- imports
local msgboxParams = import("src/utils/msgbox-params.lua")()
local miscLib = import("src/utils/misc.lua")()
local highlighterLib = import("src/utils/syntax-highlight.lua")()
-- objects
-- ui objects
local GUI = import("src/ui/executor.lua")()
_JALON_EXECUTOR_INTERNAL.Executor = GUI

local MainUI = GUI.MainUI

local Templates = import("src/ui/templates.lua")()
_JALON_EXECUTOR_INTERNAL.Templates = Templates

local TabObjectLib = import("src/utils/tab-object.lua")()
local MsgBoxTemplates = Templates.MessageBox

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
local PopupBackground = Container.PopupBackground

-- (Executor)
local ExecutorBtns = Executor.Buttons
local ExecuteBtn = ExecutorBtns.Execute
local ClearBtn = ExecutorBtns.Clear
local HideTextBtn = ExecutorBtns.HideText
local SaveFileBtn = ExecutorBtns.SaveFile

local ScriptList = Executor.Scripts
local ScriptScroller = ScriptList.ListHolder.List
local ScriptListLayout = ScriptScroller.UIListLayout
local SLTopbar = ScriptList.Topbar
local SLTopbarBtns = SLTopbar.Buttons
local CreateFileBtn = SLTopbarBtns.Create
local RenameFileBtn = SLTopbarBtns.Rename
local DeleteFileBtn = SLTopbarBtns.Delete
local SearchBtn = SLTopbarBtns.Search
local SLSearch = SLTopbar.Search
local SLSearchInput = SLSearch.Input

local Tabs = Executor.Tabs
local TabScroller = Tabs.ListHolder.List
local TSListLayout = TabScroller.UIListLayout
local AddTabBtn = Tabs.AddTab

local TextIDE = Executor.TextIDE
local TextLines = TextIDE.Lines
local TLRender = TextLines.Render
local TextboxScroller = TextIDE.Textbox
local LineHighlight = TextboxScroller.LineHighlight
local TextboxInput = TextboxScroller.Input

-- (Console)
local ConsoleOutput = Console.Output
local OutputScroller = ConsoleOutput.List
local OutputListLayout = OutputScroller.UIListLayout
local ConsoleBtnsHolder = Console.ButtonsHolder
local ConsoleBtns = ConsoleBtnsHolder.Buttons
local ClearConsoleBtn = ConsoleBtns.Clear

-- (Sidebar)
local SdButtons = Sidebar.Buttons
local SdFadeEffect = Sidebar.FadeEffect
local VersionLabel = Sidebar.VersionLabel

-- variables
local executorStates = {
	["Loaded"] = false,
	["UIToggleDebounce"] = true,
	["UIToggled"] = true
}

local activeContainers = {}
local sidebarStates = {
	["CurrentOpenUI"] = "Executor",
	["SidebarOpened"] = false,
	["SidebarBtnDebounce"] = true
}

local tabObjsList = {}
local tabsState = {
	["CurrentTab"] = "",
	["DefaultTab"] = "Main Tab",
	["TabCreationDebounce"] = true,
	["CreatedTabCount"] = 0,
}

local textboxEditorInfo = {
	["EditorHidden"] = false,
	["OldHighlightedLine"] = 1,
	["CurrentSyntaxRenderThread"] = nil
}

local scriptListPath = "executor-gui/script-list"
local scriptFilesList = {}
local scriptFileStates = {
	["IsRenaming"] = false,
	["IsDeleting"] = false,
	["SearchInputOpen"] = false,
}

local consoleColorTypes = {
	[Enum.MessageType.MessageOutput] = Color3.fromRGB(213, 213, 213),
	[Enum.MessageType.MessageInfo] = Color3.fromRGB(5, 145, 245),
	[Enum.MessageType.MessageWarning] = Color3.fromRGB(255, 230, 85),
	[Enum.MessageType.MessageError] = Color3.fromRGB(215, 5, 10)
}

-- functions
-- crappy hack to make buttons or something similar not interactable
local function _canModifyActiveProperty(object: Instance): boolean
	if not object:IsA("GuiObject") then return false end
	if not (
		object:IsA("GuiButton") or
		object:IsA("ScrollingFrame") or
		object:IsA("TextBox")
	) then return false end
	return true
end

local function setContainerUIActive(uiName: string, value: boolean)
	local containerUI = Container[uiName]
	if not containerUI then return end
	activeContainers[uiName] = value

	for _, object in containerUI:GetDescendants() do
		if not _canModifyActiveProperty(object) then continue end

		object.Active = value

		-- workarounds >:(
		if object:IsA("TextBox") and not object.Active then
			task.spawn(function()
				while not object.Active do task.wait()
					object:ReleaseFocus(false)
				end
			end)
		elseif object:IsA("GuiButton") then
			object.AutoButtonColor = value
		end
	end
end
-- crappy hack end

local function toggleUI(toggleBool: boolean): Tween
	local tweenObj = tweenService:Create(
		MainUI,
		TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Size = (toggleBool and UDim2.fromOffset(625, 375) or UDim2.new()), BorderSizePixel = (toggleBool and 1 or 0)}
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

	setContainerUIActive(sidebarStates.CurrentOpenUI, true)
	tweenObj:Play()
	return tweenObj
end

local function setSdBtnRot(rotation: number): Tween
	local tweenInfo = TweenInfo.new(.25, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut)
	local tweenObj = tweenService:Create(SidebarToggleBtn, tweenInfo, {
		Rotation = rotation
	})

	return tweenObj
end

local function setSidebarVisible(visible: boolean): (Tween, Tween)
	local sidebarTween, fadeTween = tweenService:Create(
		Sidebar,
		TweenInfo.new(.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{Position = (if visible then UDim2.fromOffset(0, 0) else UDim2.fromOffset(-150, 0))}
	), tweenService:Create(
		SdFadeEffect,
		TweenInfo.new(.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{Size = (if visible then UDim2.new(0, (MainUI.AbsoluteSize.X - 150), 1, 355) else UDim2.fromOffset(0, 355))}
	)

	SdFadeEffect.Visible = visible
	return sidebarTween, fadeTween
end

local function setContainerUI(uiName: string)
	local sidebarTween, fadeTween = setSidebarVisible(false)
	local sidebarBtnTween = setSdBtnRot(0)

	sidebarStates.SidebarOpened = false
	sidebarBtnTween:Play()
	sidebarTween:Play()
	fadeTween:Play()

	if uiName ~= sidebarStates.CurrentOpenUI then
		setContainerUIActive(uiName, true)
		Container[sidebarStates.CurrentOpenUI].Visible = false
		Container[uiName].Visible = true
		sidebarStates.CurrentOpenUI = uiName
	end
end

local function addHoverDesc(button: TextButton | ImageButton, descText: string)
	local hoverDescObj = Templates.HoverTemplate:Clone()
	local hoverLabel = hoverDescObj.Label

	hoverLabel.Text = descText
	local textSize = miscLib.GetTextSize(hoverLabel)
	hoverDescObj.Size = UDim2.fromOffset(textSize.X + 10, 25)

	local isInsideButton;

	local connection = runService.RenderStepped:Connect(function()
		local mousePos = inputService:GetMouseLocation()

		if isInsideButton and (executorStates.UIToggled and (button.Active and button.Visible)) then
			hoverDescObj.Parent = GUI
			hoverDescObj.Position = UDim2.fromOffset(mousePos.X + 30, mousePos.Y)
		else
			hoverDescObj.Parent = nil
		end
	end)

	button.MouseEnter:Connect(function()
		isInsideButton = true
	end)

	button.MouseLeave:Connect(function()
		isInsideButton = false
	end)

	button.Destroying:Once(function()
		connection:Disconnect()
	end)
end

local function newMessageBox(msgBoxType: string, params)
	local msgBoxObj = MsgBoxTemplates:FindFirstChild(msgBoxType)
	if not msgBoxObj then return end
	msgBoxObj = msgBoxObj:Clone()

	local msgBoxBtnsContainer = msgBoxObj.Buttons
	local msgBoxTopbar = msgBoxObj.Topbar
	local topbarLabel = msgBoxTopbar.Label

	local thread = coroutine.running()
	local result = {}
	local _connections = {}
	local msgBoxBtnsList = msgBoxBtnsContainer:GetChildren()

	topbarLabel.Text = params.Title

	local function onButtonClicked(buttonObj)
		result.ClickedButton = buttonObj.LayoutOrder
		PopupBackground.Visible = false

		for _, connection in _connections do
			connection:Disconnect()
		end
		msgBoxObj:Destroy()
		setContainerUIActive(sidebarStates.CurrentOpenUI, not sidebarStates.SidebarOpened)
		table.clear(_connections)
		task.spawn(thread, result)
	end

	if ( msgBoxType == "Default") then
		local textContent = msgBoxObj.Label
		textContent.Text = params.TextContent
	elseif msgBoxType == "TextInput" then
		local textboxHolder = msgBoxObj.TextboxHolder
		local contentLabel = textboxHolder.Label
		local textboxInput = textboxHolder.Textbox

		contentLabel.Text = params.TextContent
		table.insert(_connections, textboxInput:GetPropertyChangedSignal("Text"):Connect(function()
			result.InputContent = textboxInput.Text
		end))
	end

	for _, msgBoxBtn in msgBoxBtnsList do
		if not msgBoxBtn:IsA("GuiObject") then continue end
		if (msgBoxBtn.LayoutOrder + 1) > (params.ButtonCount or #msgBoxBtnsList) then
			msgBoxBtn:Destroy()
			continue
		end

		msgBoxBtn.Text = params[msgBoxBtn.Name .. "Text"] or msgBoxBtn.Text
		local buttonTextSize = miscLib.GetTextSize(msgBoxBtn)
		local buttonSizeX = (if buttonTextSize.X > 60 then buttonTextSize.X + 5 else 60)
		msgBoxBtn.Size = UDim2.new(0, buttonSizeX, 1, 0)

		table.insert(_connections, miscLib.ButtonClickEvent(
			msgBoxBtn,
			Enum.UserInputType.MouseButton1,
			miscLib.BindFunction(onButtonClicked, msgBoxBtn)
		))
	end

	PopupBackground.Visible = true
	msgBoxObj.Parent = PopupBackground
	setContainerUIActive(sidebarStates.CurrentOpenUI, false)

	return coroutine.yield()
end

local function getLinesRender(text: string)
	local result = ""
	local lines = select(2, string.gsub(text, "\n", ""))

	for line = 1, lines + 1 do
		result ..= tostring(line) .. "\n"
	end
	return result
end

local function getCurrentLinePosition(inputBox: TextBox)
	if not inputBox then return end
	if inputBox.CursorPosition == -1 then return textboxEditorInfo.OldHighlightedLine end
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
	local currentLine = customLine or (if TextboxInput:IsFocused() then getCurrentLinePosition(TextboxInput) else textboxEditorInfo.OldHighlightedLine)
	textboxEditorInfo.OldHighlightedLine = (if customLine then textboxEditorInfo.OldHighlightedLine else currentLine)

	LineHighlight.Position = UDim2.fromOffset(
		0,
		(TextboxInput.TextSize * currentLine) - TextboxInput.TextSize
	)
end

local function updateEditor()
	if (
		textboxEditorInfo.CurrentSyntaxRenderThread and
		coroutine.status(textboxEditorInfo.CurrentSyntaxRenderThread) ~= "dead"
	) then
		task.cancel(textboxEditorInfo.CurrentSyntaxRenderThread)
	end
	textboxEditorInfo.CurrentSyntaxRenderThread = task.defer(highlighterLib.Render, TextboxInput)

	local linesRender = getLinesRender(TextboxInput.Text)
	TLRender.Text = linesRender

	local TextboxSize, LinesSize = miscLib.GetTextSize(TextboxInput), miscLib.GetTextSize(TLRender)
	TextLines.Size = UDim2.new(0, (LinesSize.X + 10), 1, 0)
	TextLines.CanvasSize = UDim2.new(0, 0, 0, (LinesSize.Y + 7))

	TextboxScroller.Position = UDim2.new(0, TextLines.Size.X.Offset, 0, 0)
	TextboxScroller.Size = UDim2.new(1, -TextLines.Size.X.Offset, 1, 0)
	TextboxScroller.CanvasSize = UDim2.fromOffset((TextboxSize.X + 7), (TextboxSize.Y + 7))
end

local function updateScroll()
	updateLineHighlight()
	TextLines.CanvasPosition = (Vector2.yAxis * TextboxScroller.CanvasPosition.Y)
end

local function onTextboxInputChanged(inputObj: InputObject)
	if inputService:GetFocusedTextBox() ~= TextboxInput then return end
	if (inputObj.UserInputType == Enum.UserInputType.MouseWheel) then
		TextboxInput:ReleaseFocus()
	elseif (inputObj.UserInputType == Enum.UserInputType.TextInput) then
		-- TODO: add cursor follow in scroller when typing
	end
end

local function findTabObj(tabName: string)
	for tabIndex, tabObj in tabObjsList do
		if tabObj.Name ~= tabName then continue end
		return tabObj, tabIndex
	end
	return nil
end

local function selectTab(tabName: string)
	if tabName == tabsState.CurrentTab then return end -- no recursive thing

	local selectedTabObj = findTabObj(tabName)
	local currentTabObj = findTabObj(tabsState.CurrentTab)
	if not selectedTabObj then return end

	tabsState.CurrentTab = tabName
	TextboxInput.Text = selectedTabObj.ContentSource

	if currentTabObj then
		currentTabObj:Select(false)
	end
	selectedTabObj:Select(true)

	task.defer(updateEditor)
	task.defer(updateLineHighlight, 1)
end

local function createTab(tabName: string, source: string?, removeCloseBtn: boolean?)
	local tabObj, tabIndex

	local function onTabClicked()
		selectTab(tabObj.Name)
	end

	tabObj = TabObjectLib.new(
		source,
		onTabClicked,
		if not removeCloseBtn then
		function()
			local msgBoxResult = newMessageBox("Default", {
				Title = `Close tab '{tabObj.Name}'`,
				TextContent = "Do you really want to close this tab?.",
				ButtonCount = 2,
			})

			if msgBoxResult.ClickedButton == 0 then
				selectTab(tabsState.DefaultTab)
				tabObj:Destroy()
				table.remove(tabObjsList, tabIndex)
			end
		end
		else nil
	)

	table.insert(tabObjsList, tabObj)
	tabIndex = table.find(tabObjsList, tabObj)

	tabObj:Init()
	tabObj._TabObj.Parent = TabScroller

	tabObj:SetName(tabName)
	selectTab(tabName)
	return tabObj
end

local function updateTabData()
	local tabObj = findTabObj(tabsState.CurrentTab)
	if not tabObj then return end

	tabObj.ContentSource = TextboxInput.Text
end

local function updateTabCanvasSize()
	TabScroller.CanvasSize = UDim2.fromOffset(TSListLayout.AbsoluteContentSize.X, 0)
end

local function sanitizeScriptFileName(fileName: string): string
	if #fileName < 1 then
		return
	end

	-- TODO: improve sanitization (maybe in v0.1.1)
	fileName = string.gsub(fileName, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
	fileName = string.gsub(fileName, ".", function(value)
		return (if string.byte(value) > 126 then "" else value)
	end)

	local fileSplits = string.split(fileName, ".")
	local fileIndexes = #fileSplits
	local fileExtension = fileSplits[fileIndexes]

	if fileIndexes < 3 and #fileSplits[1] < 1 then
		return
	end

	-- checks if no file extension provided
	if fileExtension == fileName then
		fileName ..= ".lua"
	end
	return fileName
end

local onScriptFileClicked, refreshScriptList
local function deleteScriptFile(scriptFileName: string, exemptOpenedTab: boolean?)
	local fileNamePath = `{scriptListPath}/{scriptFileName}`
	if not isfile(fileNamePath) then return end

	local scriptObj = ScriptScroller:FindFirstChild(scriptFileName)
	if scriptObj then
		scriptObj:Destroy()
	end

	if not exemptOpenedTab then
		local scriptTabObj, tabIndex = findTabObj(scriptFileName)
		if scriptTabObj then
			scriptTabObj:Destroy()
			table.remove(tabObjsList, tabIndex)
		end
	end

	delfile(fileNamePath)
	scriptFilesList[scriptFileName] = nil

	miscLib.WaitUntil(1, function() return not isfile(fileNamePath) end)
	task.spawn(refreshScriptList)
end

function onScriptFileClicked(scriptFileName: string)
	local tabObj = findTabObj(scriptFileName)

	if scriptFileStates.IsRenaming then
		local renameFileParams = table.clone(msgboxParams.RenameFile)
		renameFileParams.Title = string.format(renameFileParams.Title, scriptFileName)
		local msgBoxResult = newMessageBox("TextInput", renameFileParams)

		if msgBoxResult.ClickedButton == 0 then
			local fileDataContent = scriptFilesList[scriptFileName]
			local sanitizedFileName = sanitizeScriptFileName(msgBoxResult.InputContent)

			if not sanitizedFileName then
				local currentParams = table.clone(msgboxParams.RenameFileFailed)
				currentParams.TextContent = string.format(currentParams.TextContent, scriptFileName)
				newMessageBox("TextInput", currentParams)
				return
			end
			writefile(`{scriptListPath}/{sanitizedFileName}`, fileDataContent)
			deleteScriptFile(scriptFileName, true)

			if not tabObj then return end
			tabObj:SetName(sanitizedFileName)
		end
	elseif scriptFileStates.IsDeleting then
		local deleteFileParams = table.clone(msgboxParams.DeleteFile)
		deleteFileParams.Title = string.format(deleteFileParams.Title, scriptFileName)
		local msgBoxResult = newMessageBox("Default", deleteFileParams)

		if msgBoxResult.ClickedButton == 0 then
			deleteScriptFile(scriptFileName)
		end
	else
		if tabObj then
			selectTab(scriptFileName)
			return
		end

		createTab(scriptFileName, scriptFilesList[scriptFileName])
	end
end

function refreshScriptList(dontReloadScriptsFolder: boolean)
	if not dontReloadScriptsFolder then
		for _, filePath in listfiles(scriptListPath) do
			if isfolder(filePath) then continue end
			local fileDataContent = readfile(filePath)
			local fileName = string.split(filePath, "\\")
			fileName = fileName[#fileName]

			scriptFilesList[fileName] = fileDataContent
		end
	end

	for scriptFileName, scriptDataContent in scriptFilesList do
		if ScriptScroller:FindFirstChild(scriptFileName) then
			continue
		end

		if typeof(scriptDataContent) == "nil" then
			local scriptObj = ScriptScroller:FindFirstChild(scriptFileName)
			if not scriptObj then continue end

			scriptObj:Destroy()
			continue
		end

		local newScriptObj = Templates.FileTemplate:Clone()
		local scriptLabel = newScriptObj.Label
		local scriptButton = newScriptObj.Button

		newScriptObj.Name, scriptLabel.Text = scriptFileName, scriptFileName
		miscLib.ButtonClickEvent(scriptButton, Enum.UserInputType.MouseButton1, miscLib.BindFunction(onScriptFileClicked, scriptFileName))

		newScriptObj.Parent = ScriptScroller
	end
	ScriptScroller.CanvasSize = UDim2.fromOffset(0, ScriptListLayout.AbsoluteContentSize.Y)
end

local function searchScriptListFromName(scriptFileName)
	scriptFileName = string.lower(scriptFileName)

	for _, scriptObj in ScriptScroller:GetChildren() do
		if not scriptObj:IsA("GuiObject") then continue end

		scriptObj.Visible = (string.sub(string.lower(scriptObj.Name), 0, #scriptFileName) == scriptFileName)
	end
	ScriptScroller.CanvasSize = UDim2.fromOffset(0, ScriptListLayout.AbsoluteContentSize.Y)
end

local function createConsoleOutputLabel(outputColor, ...)
	outputColor = outputColor or consoleColorTypes[Enum.MessageType.MessageOutput]
	local message = table.concat({...}, " ")

	local outputMsg = Templates.OutputTemplate:Clone()
	outputMsg.Name = #OutputScroller:GetChildren()
	outputMsg.Text = message
	outputMsg.TextColor3 = consoleColorTypes[outputColor] or outputColor

	local textSize = miscLib.GetTextSize(outputMsg)
	outputMsg.Size = UDim2.fromOffset(textSize.X, textSize.Y)

	outputMsg.Parent = OutputScroller
end

local function updateOutputCanvasSize()
	OutputScroller.CanvasSize = UDim2.fromOffset(OutputListLayout.AbsoluteContentSize.X + 5, OutputListLayout.AbsoluteContentSize.Y + 5)
	ConsoleBtnsHolder.Position = (
		if OutputListLayout.AbsoluteContentSize.Y > OutputScroller.AbsoluteSize.X then
			UDim2.new(1, -10, 0, 0)
		else UDim2.new(1, 0, 0, 0)
	)
end

local function onMessageLog(message, msgType, timestamp)
	timestamp = timestamp or os.clock()
	message = string.format("%s | %s", os.date("%X", timestamp), message)

	task.spawn(createConsoleOutputLabel, msgType, message)
end

-- main
-- (PRE-INIT)
local protectGui = (
	if syn then
		syn.protect_gui
	elseif fluxus then
		fluxus.protect_gui
	else nil
)
if protectGui then protectGui(GUI) end

GUI.Name = miscLib.GenerateRandomString(128)
GUI.Parent = (if gethui then gethui() else game:GetService("CoreGui").RobloxGui)
miscLib.Draggify(MainUI, Topbar)

VersionLabel.Text = scriptVersion
-- (Topbar)
addHoverDesc(CloseBtn, "Closes executor.")
miscLib.ButtonClickEvent(CloseBtn, Enum.UserInputType.MouseButton1, function()
	local msgBoxResult = newMessageBox("Default", msgboxParams.CloseUI)

	if msgBoxResult.ClickedButton == 0 then
		toggleUI(false).Completed:Wait()
		GUI:Destroy()
	end
end)

addHoverDesc(HideBtn, "Hides executor. (Alternatively, press F1.)")
miscLib.ButtonClickEvent(HideBtn, Enum.UserInputType.MouseButton1, function()
	executorStates.UIToggled = false
	toggleUI(executorStates.UIToggled)
end)

addHoverDesc(SidebarToggleBtn, "Toggles sidebar.")
miscLib.ButtonClickEvent(SidebarToggleBtn, Enum.UserInputType.MouseButton1, function()
	if not sidebarStates.SidebarBtnDebounce then return end
	local sidebarTween, fadeTween = setSidebarVisible(not sidebarStates.SidebarOpened)
	local sidebarBtnTween = setSdBtnRot(if sidebarStates.SidebarOpened then 0 else 90)

	sidebarStates.SidebarBtnDebounce = false
	sidebarStates.SidebarOpened = not sidebarStates.SidebarOpened
	setContainerUIActive(sidebarStates.CurrentOpenUI, not sidebarStates.SidebarOpened)
	sidebarTween:Play()
	sidebarBtnTween:Play()
	fadeTween:Play()

	sidebarTween.Completed:Connect(function()
		sidebarTween:Destroy()
		sidebarBtnTween:Destroy()
		fadeTween:Destroy()

		task.wait(.025)
		sidebarStates.SidebarBtnDebounce = true
	end)
end)

-- (Sidebar - Container)
for _, buttonObj in SdButtons:GetChildren() do
	miscLib.ButtonClickEvent(buttonObj, Enum.UserInputType.MouseButton1, miscLib.BindFunction(setContainerUI, buttonObj.Name))
end

-- (Executor - Container)
-- (Buttons)
addHoverDesc(ExecuteBtn, "Runs the script.")
miscLib.ButtonClickEvent(ExecuteBtn, Enum.UserInputType.MouseButton1, function()
	if (config.customExecution and config.executeFunc) then
		local executeFunc = config.executeFunc
		task.spawn(executeFunc, TextboxInput.Text, string.format("@Executor - %s", tabsState.CurrentTab))
	else
		loadstring(TextboxInput.Text, string.format("@Executor - %s", tabsState.CurrentTab))()
	end
end)

addHoverDesc(ClearBtn, "Clears the selected tab.")
miscLib.ButtonClickEvent(ClearBtn, Enum.UserInputType.MouseButton1, function()
	local msgBoxResult = newMessageBox("Default", msgboxParams.ClearCurrentTab)

	if msgBoxResult.ClickedButton == 0 then
		TextboxInput.Text = ""
	end
end)

addHoverDesc(HideTextBtn, "Toggles text editor visibility.")
miscLib.ButtonClickEvent(HideTextBtn, Enum.UserInputType.MouseButton1, function()
	textboxEditorInfo.EditorHidden = textboxEditorInfo.EditorHidden
	TextboxInput.Visible = not textboxEditorInfo.EditorHidden
	HideTextBtn.ImageColor3 = (
		if textboxEditorInfo.EditorHidden then
			Color3.fromRGB(170, 170, 170)
		else Color3.fromRGB(213, 213, 213)
	)
end)

addHoverDesc(SaveFileBtn, "Saves current tab.")
miscLib.ButtonClickEvent(SaveFileBtn, Enum.UserInputType.MouseButton1, function()
	local tabObj = scriptFilesList[tabsState.CurrentTab]

	if tabObj then
		local saveFileParams = table.clone(msgboxParams.SaveExistingFile)
		saveFileParams.Title = string.format(saveFileParams.Title, tabsState.CurrentTab)
		local msgBoxResult = newMessageBox("Default", saveFileParams)

		if msgBoxResult.ClickedButton == 0 then
			writefile(`{scriptListPath}/{tabsState.CurrentTab}`, TextboxInput.Text)
		end
	else
		local saveFileParams = table.clone(msgboxParams.SaveNewFile)
		saveFileParams.Title = string.format(saveFileParams.Title, tabsState.CurrentTab)
		local msgBoxResult = newMessageBox("TextInput", saveFileParams)

		if msgBoxResult.ClickedButton == 0 then
			local sanitizedFileName = sanitizeScriptFileName(msgBoxResult.InputContent)
			if not sanitizedFileName then
				local currentParams = table.clone(msgboxParams.SaveNewFileFailed)
				currentParams.TextContent = string.format(currentParams.TextContent, msgBoxResult.InputContent)
				newMessageBox("TextInput", currentParams)
				return
			end
			tabObj = findTabObj(tabsState.CurrentTab)

			tabObj:SetName(sanitizedFileName)
			writefile(`{scriptListPath}/{sanitizedFileName}`, TextboxInput.Text)
		end
	end
	task.defer(refreshScriptList)
end)

-- (Textbox Editor init)
highlighterLib:Init()
TextboxInput:GetPropertyChangedSignal("Text"):Connect(updateEditor)
TextboxInput:GetPropertyChangedSignal("CursorPosition"):Connect(updateLineHighlight)
TextboxInput.InputChanged:Connect(onTextboxInputChanged)
TextboxScroller:GetPropertyChangedSignal("CanvasPosition"):Connect(updateScroll)
task.defer(updateEditor)

-- (Tabs)
addHoverDesc(AddTabBtn, "Creates new tab.")
miscLib.ButtonClickEvent(AddTabBtn, Enum.UserInputType.MouseButton1, function()
	tabsState.CreatedTabCount += 1
	createTab("Tab " .. tabsState.CreatedTabCount)
end)

TextboxInput:GetPropertyChangedSignal("Text"):Connect(updateTabData)
TSListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateTabCanvasSize)

-- (Script List - Buttons)
addHoverDesc(CreateFileBtn, "Creates a new file.")
miscLib.ButtonClickEvent(CreateFileBtn, Enum.UserInputType.MouseButton1, function()
	local msgBoxResult = newMessageBox("TextInput", msgboxParams.CreateNewFile)

	if msgBoxResult.ClickedButton == 0 then
		local sanitizedFileName = sanitizeScriptFileName(msgBoxResult.InputContent)

		if not sanitizedFileName then
			local currentParams = table.clone(msgboxParams.CreateNewFileFailed)
			currentParams.TextContent = string.format(currentParams.TextContent, msgBoxResult.InputContent)
			newMessageBox("TextInput", currentParams)
			return
		end
		writefile(`{scriptListPath}/{sanitizedFileName}`, "")
	end
	task.defer(refreshScriptList)
end)

addHoverDesc(RenameFileBtn, "Renames selected file.")
miscLib.ButtonClickEvent(RenameFileBtn, Enum.UserInputType.MouseButton1, function()
	if scriptFileStates.IsDeleting then return end
	scriptFileStates.IsRenaming = not scriptFileStates.IsRenaming
	RenameFileBtn.ImageColor3 = (
		if scriptFileStates.IsRenaming then
			Color3.fromRGB(40, 130, 245)
		else Color3.fromRGB(213, 213, 213)
	)
end)

addHoverDesc(DeleteFileBtn, "Deletes selected file.")
miscLib.ButtonClickEvent(DeleteFileBtn, Enum.UserInputType.MouseButton1, function()
	if scriptFileStates.IsRenaming then return end
	scriptFileStates.IsDeleting = not scriptFileStates.IsDeleting
	DeleteFileBtn.ImageColor3 = (
		if scriptFileStates.IsDeleting then
			Color3.fromRGB(210, 55, 55)
		else Color3.fromRGB(213, 213, 213)
	)
end)

addHoverDesc(SearchBtn, "Toggles search box.")
miscLib.ButtonClickEvent(SearchBtn, Enum.UserInputType.MouseButton1, function()
	scriptFileStates.SearchInputOpen = not scriptFileStates.SearchInputOpen

	for _, button in SLTopbarBtns:GetChildren() do
		if button == SearchBtn then continue end
		button.Visible = not scriptFileStates.SearchInputOpen
	end
	SLSearch.Visible = scriptFileStates.SearchInputOpen
end)

-- (Script List - Search)
SLSearchInput.FocusLost:Connect(function()
	if not scriptFileStates.SearchInputOpen then return end
	searchScriptListFromName(SLSearchInput.Text)
end)

ScriptScroller:GetPropertyChangedSignal("CanvasSize"):Connect(function()
	local currentCanvasSize = ScriptListLayout.AbsoluteContentSize
	for _, scriptObj in ScriptScroller:GetChildren() do
		if not scriptObj:IsA("GuiObject") then continue end

		scriptObj.Size = (
			if currentCanvasSize.Y > ScriptScroller.AbsoluteSize.Y then
				UDim2.new(1, -5, 0, 25)
			else UDim2.new(1, 0, 0, 25)
		)
	end
end)

-- (Console - Container)
ConsoleBtns.MouseMoved:Connect(function()
	if not activeContainers.Console then return end
	ConsoleBtnsHolder.GroupTransparency = 0
end)

ConsoleBtns.MouseLeave:Connect(function()
	ConsoleBtnsHolder.GroupTransparency = .75
end)

addHoverDesc(ClearConsoleBtn, "Clears console output.")
miscLib.ButtonClickEvent(ClearConsoleBtn, Enum.UserInputType.MouseButton1, function()
	local msgBoxResult = newMessageBox("Default", msgboxParams.ClearOutput)

	if msgBoxResult.ClickedButton == 0 then
		for _, outputMsg in OutputScroller:GetChildren() do
			if not outputMsg:IsA("TextLabel") then continue end
			outputMsg:Destroy()
		end
	end
end)

OutputListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateOutputCanvasSize)
logService.MessageOut:Connect(onMessageLog)
logService.ServerMessageOut:Connect(onMessageLog)

-- (POST-INIT)
Topbar.Visible, Container.Visible = false, false
MainUI.Size, MainUI.BorderSizePixel = UDim2.new(), 0

inputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F1 and not inputService:GetFocusedTextBox() then
		if (not executorStates.UIToggleDebounce or not executorStates.Loaded) then return end

		local toggleTween = toggleUI(not MainUI.Visible)
		executorStates.UIToggleDebounce = false
		executorStates.UIToggled = not executorStates.UIToggled

		toggleTween.Completed:Connect(function()
			sidebarStates.SidebarOpened = false
			Sidebar.Position = UDim2.fromOffset(-150, 0)
			SdFadeEffect.Visible, SdFadeEffect.Size = false, UDim2.fromOffset(0, 320)
			SidebarToggleBtn.Rotation = 0

			task.wait(.25)
			executorStates.UIToggleDebounce = true
			toggleTween:Destroy()
		end)
	end
end)

task.defer(function()
	do -- script-list initializer
		if not isfolder(scriptListPath) then
			makefolder(scriptListPath)
		end

		task.defer(refreshScriptList)
	end

	createTab(tabsState.DefaultTab, config.mainTabText, true)
	toggleUI(executorStates.UIToggled).Completed:Wait()
	executorStates.Loaded = true
end)

local executorAPI = {}
executorAPI._VERSION = scriptVersion

-- executor category
executorAPI.executor = {}
executorAPI.executor.newTab = createTab
executorAPI.executor.setTokenColors = highlighterLib.SetTokenColors

-- console category
executorAPI.console = {}
executorAPI.console.createOutput = onMessageLog

-- misc
executorAPI.misc = {}
executorAPI.misc.newMessageBox = newMessageBox

return executorAPI
