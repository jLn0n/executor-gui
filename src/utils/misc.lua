-- services
local inputService = game:GetService("UserInputService")
local textService = game:GetService("TextService")
-- variables
local stringList = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890!@#$%^&*()"
-- main
local miscLib = {}

-- ui utilities
function miscLib.Draggify(frame: Frame, button)
	button = button or frame
	local dragToggle = false
	local dragInput, dragStart, startPos

	button.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragStart, startPos = input.Position, frame.Position
			dragToggle = true

			local connection;
			connection = input:GetPropertyChangedSignal("UserInputState"):Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
					connection:Disconnect()
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
			local delta = (input.Position - dragStart)
			local pos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)

			frame.Position = pos
		end
	end)
end

function miscLib.ButtonClickEvent(button: GuiButton, mouseClickType: Enum.UserInputType, callback)
	return button.Activated:Connect(function(inputObj)
		if inputObj.UserInputState ~= Enum.UserInputState.End then return end
		if (inputObj.UserInputType == mouseClickType or inputObj.UserInputType == Enum.UserInputType.Touch) then
			task.spawn(callback)
		end
	end)
end

function miscLib.GetTextSize(textObj): Vector2
	local params = Instance.new("GetTextBoundsParams")
	params.Text = textObj.Text
	params.Font = textObj.FontFace
	params.Size = textObj.TextSize
	params.Width = 1e6

	local succ, textSize = pcall(textService.GetTextBoundsAsync, textService, params)
	return (
		if succ then
			textSize
		else error(textSize)
	)
end

-- literally misc
function miscLib.GenerateRandomString(lenght: number, indexLenght: number?): string
	local result = ""

	for _ = 1, lenght do
		local randNumber = math.random(1, (indexLenght or #stringList))
		result ..= string.sub(stringList, randNumber, randNumber)
	end
	return result
end

function miscLib.BindFunction(func, ...)
	local args = table.pack(...)
	return function() return task.spawn(func, unpack(args)) end
end

function miscLib.WaitUntil(waitTime: number, condition)
	local startTime = os.clock()
	repeat task.wait() until condition() or (os.clock() - startTime) > waitTime
end

return miscLib
