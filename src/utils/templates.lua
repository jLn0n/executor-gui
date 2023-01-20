local I2L = {};

-- Templates
I2L["1"] = Instance.new("Folder");
I2L["1"]["Name"] = [[Templates]];

-- Templates.TabTemplate
I2L["2"] = Instance.new("Frame", I2L["1"]);
I2L["2"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["2"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["2"]["Size"] = UDim2.new(0, 80, 0, 30);
I2L["2"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2"]["Name"] = [[TabTemplate]];

-- Templates.TabTemplate.Close
I2L["3"] = Instance.new("TextButton", I2L["2"]);
I2L["3"]["BorderSizePixel"] = 0;
I2L["3"]["TextSize"] = 20;
I2L["3"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["3"]["TextColor3"] = Color3.fromRGB(196, 28, 20);
I2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["3"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["3"]["Size"] = UDim2.new(0, 20, 1, 0);
I2L["3"]["Name"] = [[Close]];
I2L["3"]["Text"] = [[X]];
I2L["3"]["Font"] = Enum.Font.Unknown;
I2L["3"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Templates.TabTemplate.Data
I2L["4"] = Instance.new("StringValue", I2L["2"]);
I2L["4"]["Name"] = [[Data]];

-- Templates.TabTemplate.Label
I2L["5"] = Instance.new("TextButton", I2L["2"]);
I2L["5"]["Active"] = false;
I2L["5"]["BorderSizePixel"] = 0;
I2L["5"]["TextSize"] = 20;
I2L["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["5"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["5"]["Selectable"] = false;
I2L["5"]["Size"] = UDim2.new(0, 55, 1, 0);
I2L["5"]["Name"] = [[Label]];
I2L["5"]["Text"] = [[Tab 1]];
I2L["5"]["Font"] = Enum.Font.Unknown;
I2L["5"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["5"]["BackgroundTransparency"] = 1;

-- Templates.ScriptTemplate
I2L["6"] = Instance.new("TextButton", I2L["1"]);
I2L["6"]["TextSize"] = 16;
I2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["6"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["6"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
I2L["6"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["6"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["6"]["Name"] = [[ScriptTemplate]];
I2L["6"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["6"]["Text"] = [[]];
I2L["6"]["Font"] = Enum.Font.Unknown;

-- Templates.ScriptTemplate.Label
I2L["7"] = Instance.new("TextLabel", I2L["6"]);
I2L["7"]["LineHeight"] = 1.2000000476837158;
I2L["7"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
I2L["7"]["BorderSizePixel"] = 0;
I2L["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["7"]["TextSize"] = 16;
I2L["7"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["7"]["Size"] = UDim2.new(1, -10, 0, 25);
I2L["7"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
I2L["7"]["Text"] = [[Hello World]];
I2L["7"]["Name"] = [[Label]];
I2L["7"]["Font"] = Enum.Font.Unknown;
I2L["7"]["BackgroundTransparency"] = 1;
I2L["7"]["Position"] = UDim2.new(0, 5, 0, 0);

-- Templates.OutputTemplate
I2L["8"] = Instance.new("TextLabel", I2L["1"]);
I2L["8"]["BorderSizePixel"] = 0;
I2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
I2L["8"]["TextSize"] = 16;
I2L["8"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["8"]["Size"] = UDim2.new(1, -10, 0, 20);
I2L["8"]["Name"] = [[OutputTemplate]];
I2L["8"]["Font"] = Enum.Font.Unknown;
I2L["8"]["BackgroundTransparency"] = 1;

return I2L["1"]
