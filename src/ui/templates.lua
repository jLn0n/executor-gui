local I2L = {};

-- Templates
I2L["1"] = Instance.new("Folder");
I2L["1"]["Name"] = [[Templates]];

-- Templates.OutputTemplate
I2L["2"] = Instance.new("TextLabel", I2L["1"]);
I2L["2"]["BorderSizePixel"] = 0;
I2L["2"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["2"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
I2L["2"]["TextSize"] = 16;
I2L["2"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["2"]["Size"] = UDim2.new(1, -10, 0, 20);
I2L["2"]["Name"] = [[OutputTemplate]];
I2L["2"]["Font"] = Enum.Font.Unknown;
I2L["2"]["BackgroundTransparency"] = 1;

-- Templates.FileTemplate
I2L["3"] = Instance.new("Frame", I2L["1"]);
I2L["3"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["3"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["3"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["3"]["Name"] = [[FileTemplate]];

-- Templates.FileTemplate.Label
I2L["4"] = Instance.new("TextBox", I2L["3"]);
I2L["4"]["LineHeight"] = 1.2000000476837158;
I2L["4"]["Active"] = false;
I2L["4"]["BorderSizePixel"] = 0;
I2L["4"]["TextEditable"] = false;
I2L["4"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["4"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["4"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
I2L["4"]["TextSize"] = 16;
I2L["4"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["4"]["ShowNativeInput"] = false;
I2L["4"]["BackgroundTransparency"] = 1;
I2L["4"]["Size"] = UDim2.new(1, -5, 1, -5);
I2L["4"]["Selectable"] = false;
I2L["4"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["4"]["Text"] = [[Hello World]];
I2L["4"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["4"]["Font"] = Enum.Font.RobotoMono;
I2L["4"]["Name"] = [[Label]];
I2L["4"]["ClearTextOnFocus"] = false;

-- Templates.FileTemplate.Button
I2L["5"] = Instance.new("TextButton", I2L["3"]);
I2L["5"]["BorderSizePixel"] = 0;
I2L["5"]["TextSize"] = 14;
I2L["5"]["TextTransparency"] = 1;
I2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["5"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
I2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["5"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["5"]["Name"] = [[Button]];
I2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["5"]["Font"] = Enum.Font.SourceSans;
I2L["5"]["BackgroundTransparency"] = 1;

-- Templates.MessageBox
I2L["6"] = Instance.new("Folder", I2L["1"]);
I2L["6"]["Name"] = [[MessageBox]];

-- Templates.MessageBox.Default
I2L["7"] = Instance.new("Frame", I2L["6"]);
I2L["7"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["7"]["Size"] = UDim2.new(0, 350, 0, 150);
I2L["7"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["7"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
I2L["7"]["Name"] = [[Default]];

-- Templates.MessageBox.Default.Topbar
I2L["8"] = Instance.new("Frame", I2L["7"]);
I2L["8"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["8"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["8"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["8"]["Name"] = [[Topbar]];

-- Templates.MessageBox.Default.Topbar.Label
I2L["9"] = Instance.new("TextLabel", I2L["8"]);
I2L["9"]["BorderSizePixel"] = 0;
I2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["9"]["TextSize"] = 17;
I2L["9"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0);
I2L["9"]["Size"] = UDim2.new(0, 95, 1, 0);
I2L["9"]["Text"] = [[Message Box]];
I2L["9"]["Name"] = [[Label]];
I2L["9"]["Font"] = Enum.Font.RobotoMono;
I2L["9"]["BackgroundTransparency"] = 1;
I2L["9"]["Position"] = UDim2.new(0.5, 0, 0, 0);

-- Templates.MessageBox.Default.Label
I2L["a"] = Instance.new("TextLabel", I2L["7"]);
I2L["a"]["TextWrapped"] = true;
I2L["a"]["BorderSizePixel"] = 0;
I2L["a"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["a"]["TextYAlignment"] = Enum.TextYAlignment.Top;
I2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["a"]["TextSize"] = 17;
I2L["a"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["a"]["Size"] = UDim2.new(1, -10, 0, 85);
I2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["a"]["Name"] = [[Label]];
I2L["a"]["Font"] = Enum.Font.RobotoMono;
I2L["a"]["BackgroundTransparency"] = 1;
I2L["a"]["Position"] = UDim2.new(0, 5, 0, 30);

-- Templates.MessageBox.Default.Buttons
I2L["b"] = Instance.new("Frame", I2L["7"]);
I2L["b"]["BorderSizePixel"] = 0;
I2L["b"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["b"]["AnchorPoint"] = Vector2.new(0, 1);
I2L["b"]["BackgroundTransparency"] = 1;
I2L["b"]["Size"] = UDim2.new(1, -10, 0, 25);
I2L["b"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["b"]["Position"] = UDim2.new(0, 5, 1, -5);
I2L["b"]["Name"] = [[Buttons]];

-- Templates.MessageBox.Default.Buttons.UIListLayout
I2L["c"] = Instance.new("UIListLayout", I2L["b"]);
I2L["c"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
I2L["c"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
I2L["c"]["Padding"] = UDim.new(0, 5);
I2L["c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Templates.MessageBox.Default.Buttons.Button2
I2L["d"] = Instance.new("TextButton", I2L["b"]);
I2L["d"]["TextSize"] = 16;
I2L["d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["d"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["d"]["Size"] = UDim2.new(0, 60, 1, 0);
I2L["d"]["LayoutOrder"] = 2;
I2L["d"]["Name"] = [[Button2]];
I2L["d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["d"]["Text"] = [[Cancel]];
I2L["d"]["Font"] = Enum.Font.RobotoMono;
I2L["d"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Templates.MessageBox.Default.Buttons.Button1
I2L["e"] = Instance.new("TextButton", I2L["b"]);
I2L["e"]["TextSize"] = 16;
I2L["e"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["e"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["e"]["Size"] = UDim2.new(0, 60, 1, 0);
I2L["e"]["LayoutOrder"] = 1;
I2L["e"]["Name"] = [[Button1]];
I2L["e"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["e"]["Text"] = [[No]];
I2L["e"]["Font"] = Enum.Font.RobotoMono;
I2L["e"]["Position"] = UDim2.new(0, 65, 0, 0);

-- Templates.MessageBox.Default.Buttons.Button0
I2L["f"] = Instance.new("TextButton", I2L["b"]);
I2L["f"]["TextSize"] = 16;
I2L["f"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["f"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["f"]["Size"] = UDim2.new(0, 60, 1, 0);
I2L["f"]["Name"] = [[Button0]];
I2L["f"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["f"]["Text"] = [[Yes]];
I2L["f"]["Font"] = Enum.Font.RobotoMono;

-- Templates.MessageBox.TextInput
I2L["10"] = Instance.new("Frame", I2L["6"]);
I2L["10"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["10"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["10"]["Size"] = UDim2.new(0, 350, 0, 150);
I2L["10"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["10"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
I2L["10"]["Name"] = [[TextInput]];

-- Templates.MessageBox.TextInput.Topbar
I2L["11"] = Instance.new("Frame", I2L["10"]);
I2L["11"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["11"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["11"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["11"]["Name"] = [[Topbar]];

-- Templates.MessageBox.TextInput.Topbar.Label
I2L["12"] = Instance.new("TextLabel", I2L["11"]);
I2L["12"]["BorderSizePixel"] = 0;
I2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["12"]["TextSize"] = 17;
I2L["12"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["12"]["AnchorPoint"] = Vector2.new(0.5, 0);
I2L["12"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["12"]["Name"] = [[Label]];
I2L["12"]["Font"] = Enum.Font.RobotoMono;
I2L["12"]["BackgroundTransparency"] = 1;
I2L["12"]["Position"] = UDim2.new(0.5, 0, 0, 0);

-- Templates.MessageBox.TextInput.Buttons
I2L["13"] = Instance.new("Frame", I2L["10"]);
I2L["13"]["BorderSizePixel"] = 0;
I2L["13"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["13"]["AnchorPoint"] = Vector2.new(0, 1);
I2L["13"]["BackgroundTransparency"] = 1;
I2L["13"]["Size"] = UDim2.new(1, -10, 0, 25);
I2L["13"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["13"]["Position"] = UDim2.new(0, 5, 1, -5);
I2L["13"]["Name"] = [[Buttons]];

-- Templates.MessageBox.TextInput.Buttons.Button1
I2L["14"] = Instance.new("TextButton", I2L["13"]);
I2L["14"]["TextSize"] = 16;
I2L["14"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["14"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["14"]["Size"] = UDim2.new(0, 60, 1, 0);
I2L["14"]["LayoutOrder"] = 1;
I2L["14"]["Name"] = [[Button1]];
I2L["14"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["14"]["Text"] = [[Cancel]];
I2L["14"]["Font"] = Enum.Font.RobotoMono;
I2L["14"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Templates.MessageBox.TextInput.Buttons.Button0
I2L["15"] = Instance.new("TextButton", I2L["13"]);
I2L["15"]["TextSize"] = 16;
I2L["15"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["15"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["15"]["Size"] = UDim2.new(0, 60, 1, 0);
I2L["15"]["Name"] = [[Button0]];
I2L["15"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["15"]["Text"] = [[Confirm]];
I2L["15"]["Font"] = Enum.Font.RobotoMono;
I2L["15"]["Position"] = UDim2.new(1, -65, 0, 0);

-- Templates.MessageBox.TextInput.Buttons.UIListLayout
I2L["16"] = Instance.new("UIListLayout", I2L["13"]);
I2L["16"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
I2L["16"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["16"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
I2L["16"]["Padding"] = UDim.new(0, 5);
I2L["16"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Templates.MessageBox.TextInput.TextboxHolder
I2L["17"] = Instance.new("Frame", I2L["10"]);
I2L["17"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["17"]["Size"] = UDim2.new(1, -10, 0, 30);
I2L["17"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["17"]["Position"] = UDim2.new(0, 5, 0, 70);
I2L["17"]["Name"] = [[TextboxHolder]];

-- Templates.MessageBox.TextInput.TextboxHolder.Label
I2L["18"] = Instance.new("TextLabel", I2L["17"]);
I2L["18"]["BorderSizePixel"] = 0;
I2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["18"]["TextSize"] = 18;
I2L["18"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["18"]["AnchorPoint"] = Vector2.new(0, 1);
I2L["18"]["Size"] = UDim2.new(1, 0, 0, 20);
I2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["18"]["Text"] = [[Label:]];
I2L["18"]["Name"] = [[Label]];
I2L["18"]["Font"] = Enum.Font.RobotoMono;
I2L["18"]["BackgroundTransparency"] = 1;
I2L["18"]["Position"] = UDim2.new(0, 0, 0, -5);

-- Templates.MessageBox.TextInput.TextboxHolder.Textbox
I2L["19"] = Instance.new("TextBox", I2L["17"]);
I2L["19"]["BorderSizePixel"] = 0;
I2L["19"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["19"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["19"]["TextSize"] = 18;
I2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["19"]["BackgroundTransparency"] = 1;
I2L["19"]["Size"] = UDim2.new(1, -10, 1, 0);
I2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["19"]["Text"] = [[]];
I2L["19"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["19"]["Font"] = Enum.Font.RobotoMono;
I2L["19"]["Name"] = [[Textbox]];

-- Templates.HoverTemplate
I2L["1a"] = Instance.new("Frame", I2L["1"]);
I2L["1a"]["BorderSizePixel"] = 0;
I2L["1a"]["BackgroundColor3"] = Color3.fromRGB(25, 24, 27);
I2L["1a"]["BackgroundTransparency"] = 1;
I2L["1a"]["Size"] = UDim2.new(0, 100, 0, 25);
I2L["1a"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1a"]["Name"] = [[HoverTemplate]];

-- Templates.HoverTemplate.Arrow
I2L["1b"] = Instance.new("Frame", I2L["1a"]);
I2L["1b"]["ZIndex"] = 0;
I2L["1b"]["BackgroundColor3"] = Color3.fromRGB(25, 24, 27);
I2L["1b"]["AnchorPoint"] = Vector2.new(0, 0.5);
I2L["1b"]["Size"] = UDim2.new(0, 16, 0, 16);
I2L["1b"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1b"]["Position"] = UDim2.new(0, -8, 0.5, 0);
I2L["1b"]["Rotation"] = 45;
I2L["1b"]["Name"] = [[Arrow]];

-- Templates.HoverTemplate.Label
I2L["1c"] = Instance.new("TextLabel", I2L["1a"]);
I2L["1c"]["BackgroundColor3"] = Color3.fromRGB(25, 24, 27);
I2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["1c"]["TextSize"] = 16;
I2L["1c"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["1c"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["1c"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1c"]["Name"] = [[Label]];
I2L["1c"]["Font"] = Enum.Font.RobotoMono;

-- Templates.TabTemplate
I2L["1d"] = Instance.new("Frame", I2L["1"]);
I2L["1d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["1d"]["Size"] = UDim2.new(0, 75, 1, 0);
I2L["1d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1d"]["Name"] = [[TabTemplate]];

-- Templates.TabTemplate.Close
I2L["1e"] = Instance.new("TextButton", I2L["1d"]);
I2L["1e"]["LineHeight"] = 1.100000023841858;
I2L["1e"]["TextSize"] = 15;
I2L["1e"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1e"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
I2L["1e"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["1e"]["Size"] = UDim2.new(0, 15, 0, 15);
I2L["1e"]["Name"] = [[Close]];
I2L["1e"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1e"]["Text"] = [[X]];
I2L["1e"]["Font"] = Enum.Font.Unknown;
I2L["1e"]["Position"] = UDim2.new(1, -5, 0, 5);

-- Templates.TabTemplate.Data
I2L["1f"] = Instance.new("StringValue", I2L["1d"]);
I2L["1f"]["Name"] = [[Data]];

-- Templates.TabTemplate.Label
I2L["20"] = Instance.new("TextButton", I2L["1d"]);
I2L["20"]["Active"] = false;
I2L["20"]["BorderSizePixel"] = 0;
I2L["20"]["TextSize"] = 16;
I2L["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["20"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["20"]["Selectable"] = false;
I2L["20"]["Size"] = UDim2.new(0, 45, 1, 0);
I2L["20"]["Name"] = [[Label]];
I2L["20"]["Text"] = [[Tab 1]];
I2L["20"]["Font"] = Enum.Font.RobotoMono;
I2L["20"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["20"]["BackgroundTransparency"] = 1;

return I2L["1"];
