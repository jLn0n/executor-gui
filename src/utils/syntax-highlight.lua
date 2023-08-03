-- fork of https://github.com/boatbomber/Highlighter/blob/main/src/init.lua
-- services
local runService = game:GetService("RunService")
-- imports
local lexer = import("src/utils/lexer.lua")()
-- variables
local colorFormatters = table.create(8)
local lastHighlightUpdate = {}

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
-- functions
local function sanitizeText(text: string, ...)
	for _, value in {...} do
		if value == "richtext" then
			text = string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(text, "&", "&amp;"), "<", "&lt;"), ">", "&gt;"), '"', "&quot;"), "'", "&apos;")
		elseif value == "tabs" then
			text = string.gsub(text, "\t", "    ")
		elseif value == "control" then
			text = string.gsub(text, "[\0\1\2\3\4\5\6\7\8\11\12\13\14\15\16\17\18\19\20\21\22\23\24\25\26\27\28\29\30\31]+", "")
		end
	end

	return text
end

local function getTextBounds(textObject)
	if textObject.ContentText == "" then
		return Vector2.zero
	end

	local textBounds = textObject.TextBounds

	-- Wait for TextBounds to be non-NaN and non-zero because Roblox
	while (textBounds.Y ~= textBounds.Y) or (textBounds.Y < 1) do
		runService.PreRender:Wait()
		textBounds = textObject.TextBounds
	end
	return textBounds
end

local function renderSyntaxHighlight(textObject, params: {any})
	params = params or table.create(0)
	local source = sanitizeText(params.textSrc or textObject.Text, "tabs", "control")

	local data = lastHighlightUpdate[textObject]
	if not data then
		data = {
			textSrc = "",
			textLines = table.create(10000),
			highlightRenders = table.create(10000),
		}
		lastHighlightUpdate[textObject] = data
	elseif (not params.forceUpdate and data.textSrc == textObject.Text) then
		return
	end

	local lineLabels = data.highlightRenders

	data.textSrc = source
	data.textLines = string.split(source, "\n")

	local lineFolder = textObject:FindFirstChild("RenderContainer")
	if not lineFolder then
		local newLineFolder = Instance.new("Folder")
		newLineFolder.Name = "RenderContainer"
		newLineFolder.Parent = textObject

		lineFolder = newLineFolder
	end

	if data.textSrc == "" then
		for lineIndex = 1, #lineLabels do
			if lineLabels[lineIndex].Text == "" then continue end
			lineLabels[lineIndex].Text = ""
		end

		return
	end

	local textBounds = getTextBounds(textObject)
	local numLines = #data.textLines
	local textHeight = (textBounds.Y / (numLines * textObject.LineHeight))

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
				lineLabel.FontFace = textObject.FontFace
				lineLabel.TextSize = textObject.TextSize
				lineLabel.Parent = lineFolder
				lineLabels[lineNumber] = lineLabel
			end

			lineLabel.Size = UDim2.new(1, 0, 0, math.ceil(textHeight))
			lineLabel.Position = UDim2.fromScale(0, textHeight * (lineNumber - 1) / textObject.AbsoluteSize.Y)

			if lineIndex > 1 then
				-- Set line
				lineLabels[lineNumber].Text = table.concat(richText)
				-- Move to next line
				lineNumber += 1
				index = 0
				table.clear(richText)
			end

			-- Only add RichText tags when the color is non-default and the characters are non-whitespace
			index += 1

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

		renderSyntaxHighlight(textObject, {
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

-- main
local SyntaxHighlight = {
	Render = renderSyntaxHighlight,
	SetTokenColors = setTokenColors
}

function SyntaxHighlight:Init()
	setTokenColors(tokenColors)
end

return SyntaxHighlight
