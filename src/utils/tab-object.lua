-- imports
local miscLib = import("src/utils/misc.lua")()
local Templates = _JALON_EXECUTOR_INTERNAL.Templates
-- objects
-- main
local TabObject = {}
TabObject.__index = TabObject

function TabObject.new(source: string?, clickHandler, closeBtnHandler)
	local self = {}
	self.Name = ""
	self.ContentSource = source or ""
	self.CloseBtnHandler = closeBtnHandler
	self.ClickHandler = clickHandler

	return setmetatable(self, TabObject)
end

function TabObject:Init()
	local tabObj = Templates.TabTemplate:Clone()
	local TabLabel = tabObj.Label
	local TabCloseBtn = tabObj.Close

	self._TabObj = tabObj
	TabLabel.MouseButton1Click:Connect(self.ClickHandler)

	if not self.CloseBtnHandler then
		TabLabel.Size = UDim2.fromScale(1, 1)
		TabCloseBtn:Destroy()
	else
		TabCloseBtn.MouseButton1Click:Connect(self.CloseBtnHandler)
	end
end

function TabObject:SetName(newTabName: string)
	self.Name = newTabName
	local TabLabel = self._TabObj.Label
	TabLabel.Text = self.Name

	local textSize = miscLib.GetTextSize(TabLabel)
	local textSizeX = (textSize.X + 10) + (if self.CloseBtnHandler then 20 else 0)

	self._TabObj.Size = UDim2.new(0, textSizeX, 0, 25)
	TabLabel.Size = (
		if not self.CloseBtnHandler then
			UDim2.fromScale(1, 1)
		else UDim2.new(0, textSizeX - 25, 1, 0)
	)
end

function TabObject:Select(value: boolean)
	self._TabObj.BorderColor3 = (
		if value then
			Color3.fromRGB(61, 64, 62)
		else Color3.fromRGB(38, 40, 39)
	)
end

function TabObject:Destroy()
	self._TabObj:Destroy()

	table.clear(self)
	return setmetatable(self, nil)
end

return TabObject
