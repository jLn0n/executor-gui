local I2L = {};

-- Executor
I2L["1"] = Instance.new("ScreenGui");
I2L["1"]["ResetOnSpawn"] = false;
I2L["1"]["IgnoreGuiInset"] = true;
I2L["1"]["Name"] = [[Executor]];
I2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Executor.MainUI
I2L["2"] = Instance.new("Frame", I2L["1"]);
I2L["2"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["2"]["Size"] = UDim2.new();
I2L["2"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
I2L["2"]["Visible"] = false;
I2L["2"]["Name"] = [[MainUI]];

-- Executor.MainUI.Topbar
I2L["3"] = Instance.new("Frame", I2L["2"]);
I2L["3"]["BorderSizePixel"] = 0;
I2L["3"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["3"]["Size"] = UDim2.new(1, 0, 0, 30);
I2L["3"]["Name"] = [[Topbar]];

-- Executor.MainUI.Topbar.Label
I2L["4"] = Instance.new("TextLabel", I2L["3"]);
I2L["4"]["BorderSizePixel"] = 0;
I2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["4"]["TextSize"] = 19;
I2L["4"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0);
I2L["4"]["Size"] = UDim2.new(0, 155, 1, 0);
I2L["4"]["Text"] = [[jLn0n's Executor]];
I2L["4"]["Name"] = [[Label]];
I2L["4"]["Font"] = Enum.Font.Unknown;
I2L["4"]["BackgroundTransparency"] = 1;
I2L["4"]["Position"] = UDim2.new(0.5, 0, 0, 0);

-- Executor.MainUI.Topbar.Buttons
I2L["5"] = Instance.new("Folder", I2L["3"]);
I2L["5"]["Name"] = [[Buttons]];

-- Executor.MainUI.Topbar.Buttons.Close
I2L["6"] = Instance.new("TextButton", I2L["5"]);
I2L["6"]["BorderSizePixel"] = 0;
I2L["6"]["TextSize"] = 22;
I2L["6"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["6"]["TextColor3"] = Color3.fromRGB(196, 28, 20);
I2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["6"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["6"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["6"]["Name"] = [[Close]];
I2L["6"]["Text"] = [[X]];
I2L["6"]["Font"] = Enum.Font.Unknown;
I2L["6"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Executor.MainUI.Topbar.Buttons.Hide
I2L["7"] = Instance.new("TextButton", I2L["5"]);
I2L["7"]["LineHeight"] = 1.7374999523162842;
I2L["7"]["BorderSizePixel"] = 0;
I2L["7"]["TextSize"] = 30;
I2L["7"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["7"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["7"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["7"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["7"]["Name"] = [[Hide]];
I2L["7"]["Text"] = [[_]];
I2L["7"]["Font"] = Enum.Font.Unknown;
I2L["7"]["Position"] = UDim2.new(1, -30, 0, 0);

-- Executor.MainUI.Topbar.Buttons.SidebarToggle
I2L["8"] = Instance.new("TextButton", I2L["5"]);
I2L["8"]["BorderSizePixel"] = 0;
I2L["8"]["TextSize"] = 22;
I2L["8"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["8"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["8"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["8"]["Name"] = [[SidebarToggle]];
I2L["8"]["Text"] = [[]];
I2L["8"]["Font"] = Enum.Font.Unknown;
I2L["8"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Topbar.Buttons.SidebarToggle.1
I2L["9"] = Instance.new("Frame", I2L["8"]);
I2L["9"]["BorderSizePixel"] = 0;
I2L["9"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["9"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["9"]["Size"] = UDim2.new(0, 25, 0, 5);
I2L["9"]["Position"] = UDim2.new(0.5, 0, 0, 6);
I2L["9"]["Name"] = [[1]];

-- Executor.MainUI.Topbar.Buttons.SidebarToggle.2
I2L["a"] = Instance.new("Frame", I2L["8"]);
I2L["a"]["BorderSizePixel"] = 0;
I2L["a"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["a"]["Size"] = UDim2.new(0, 25, 0, 5);
I2L["a"]["Position"] = UDim2.new(0.5, 0, 0, 15);
I2L["a"]["Name"] = [[2]];

-- Executor.MainUI.Topbar.Buttons.SidebarToggle.3
I2L["b"] = Instance.new("Frame", I2L["8"]);
I2L["b"]["BorderSizePixel"] = 0;
I2L["b"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["b"]["Size"] = UDim2.new(0, 25, 0, 5);
I2L["b"]["Position"] = UDim2.new(0.5, 0, 0, 24);
I2L["b"]["Name"] = [[3]];

-- Executor.MainUI.Container
I2L["c"] = Instance.new("Frame", I2L["2"]);
I2L["c"]["BorderSizePixel"] = 0;
I2L["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["c"]["BackgroundTransparency"] = 1;
I2L["c"]["Size"] = UDim2.new(1, 0, 1, -30);
I2L["c"]["ClipsDescendants"] = true;
I2L["c"]["Position"] = UDim2.new(0, 0, 0, 30);
I2L["c"]["Name"] = [[Container]];

-- Executor.MainUI.Container.Executor
I2L["d"] = Instance.new("Frame", I2L["c"]);
I2L["d"]["BorderSizePixel"] = 0;
I2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["d"]["BackgroundTransparency"] = 1;
I2L["d"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["d"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["d"]["Name"] = [[Executor]];

-- Executor.MainUI.Container.Executor.TextIDE
I2L["e"] = Instance.new("Frame", I2L["d"]);
I2L["e"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["e"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["e"]["Size"] = UDim2.new(0, 425, 0, 240);
I2L["e"]["ClipsDescendants"] = true;
I2L["e"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["e"]["Position"] = UDim2.new(0, 0, 0, 35);
I2L["e"]["Name"] = [[TextIDE]];

-- Executor.MainUI.Container.Executor.TextIDE.Textbox
I2L["f"] = Instance.new("ScrollingFrame", I2L["e"]);
I2L["f"]["Active"] = true;
I2L["f"]["BorderSizePixel"] = 0;
I2L["f"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["f"]["MidImage"] = [[rbxassetid://71274893]];
I2L["f"]["TopImage"] = [[rbxassetid://71274893]];
I2L["f"]["BackgroundColor3"] = Color3.fromRGB(38, 40, 39);
I2L["f"]["BackgroundTransparency"] = 1;
I2L["f"]["Size"] = UDim2.new(0, 409, 1, 0);
I2L["f"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["f"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["f"]["ScrollBarThickness"] = 5;
I2L["f"]["Position"] = UDim2.new(0, 18, 0, 0);
I2L["f"]["Name"] = [[Textbox]];
I2L["f"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Executor.TextIDE.Textbox.Input
I2L["10"] = Instance.new("TextBox", I2L["f"]);
I2L["10"]["BorderSizePixel"] = 0;
I2L["10"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["10"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["10"]["TextSize"] = 16;
I2L["10"]["TextYAlignment"] = Enum.TextYAlignment.Top;
I2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
I2L["10"]["MultiLine"] = true;
I2L["10"]["BackgroundTransparency"] = 1;
I2L["10"]["Size"] = UDim2.new(1, -5, 1, 0);
I2L["10"]["ClipsDescendants"] = true;
I2L["10"]["Text"] = [[]];
I2L["10"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["10"]["Font"] = Enum.Font.Unknown;
I2L["10"]["Name"] = [[Input]];
I2L["10"]["ClearTextOnFocus"] = false;

-- Executor.MainUI.Container.Executor.TextIDE.Textbox.LineHighlight
I2L["11"] = Instance.new("Frame", I2L["f"]);
I2L["11"]["BorderSizePixel"] = 0;
I2L["11"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["11"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["11"]["BackgroundTransparency"] = 0.925000011920929;
I2L["11"]["Size"] = UDim2.new(1, 0, 0, 16);
I2L["11"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["11"]["Name"] = [[LineHighlight]];

-- Executor.MainUI.Container.Executor.TextIDE.Lines
I2L["12"] = Instance.new("ScrollingFrame", I2L["e"]);
I2L["12"]["Active"] = true;
I2L["12"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
I2L["12"]["BorderSizePixel"] = 0;
I2L["12"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["12"]["MidImage"] = [[rbxassetid://71274893]];
I2L["12"]["TopImage"] = [[rbxassetid://71274893]];
I2L["12"]["BackgroundColor3"] = Color3.fromRGB(38, 40, 39);
I2L["12"]["ScrollingEnabled"] = false;
I2L["12"]["BackgroundTransparency"] = 1;
I2L["12"]["Size"] = UDim2.new(0, 18, 1, 0);
I2L["12"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["12"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["12"]["ScrollBarThickness"] = 0;
I2L["12"]["Name"] = [[Lines]];
I2L["12"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Executor.TextIDE.Lines.Render
I2L["13"] = Instance.new("TextLabel", I2L["12"]);
I2L["13"]["BorderSizePixel"] = 0;
I2L["13"]["TextXAlignment"] = Enum.TextXAlignment.Right;
I2L["13"]["TextYAlignment"] = Enum.TextYAlignment.Top;
I2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
I2L["13"]["TextSize"] = 16;
I2L["13"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["13"]["Size"] = UDim2.new(1, -5, 1, 0);
I2L["13"]["Text"] = [[1]];
I2L["13"]["Name"] = [[Render]];
I2L["13"]["Font"] = Enum.Font.Unknown;
I2L["13"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Executor.TextIDE.Lines.|
I2L["14"] = Instance.new("Frame", I2L["12"]);
I2L["14"]["BorderSizePixel"] = 0;
I2L["14"]["BackgroundColor3"] = Color3.fromRGB(38, 40, 39);
I2L["14"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["14"]["Size"] = UDim2.new(0, 1, 1, 1);
I2L["14"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["14"]["Name"] = [[|]];

-- Executor.MainUI.Container.Executor.Buttons
I2L["15"] = Instance.new("Frame", I2L["d"]);
I2L["15"]["BorderSizePixel"] = 0;
I2L["15"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["15"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["15"]["AnchorPoint"] = Vector2.new(0, 1);
I2L["15"]["BackgroundTransparency"] = 1;
I2L["15"]["Size"] = UDim2.new(1, 0, 0, 30);
I2L["15"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["15"]["Position"] = UDim2.new(0, 0, 1, 0);
I2L["15"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Executor.Buttons.Execute
I2L["16"] = Instance.new("TextButton", I2L["15"]);
I2L["16"]["TextSize"] = 20;
I2L["16"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["16"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["16"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["16"]["Size"] = UDim2.new(0, 90, 1, 0);
I2L["16"]["Name"] = [[Execute]];
I2L["16"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["16"]["Text"] = [[Execute]];
I2L["16"]["Font"] = Enum.Font.Unknown;

-- Executor.MainUI.Container.Executor.Buttons.Clear
I2L["17"] = Instance.new("TextButton", I2L["15"]);
I2L["17"]["TextSize"] = 20;
I2L["17"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["17"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["17"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["17"]["Size"] = UDim2.new(0, 90, 1, 0);
I2L["17"]["Name"] = [[Clear]];
I2L["17"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["17"]["Text"] = [[Clear]];
I2L["17"]["Font"] = Enum.Font.Unknown;
I2L["17"]["Position"] = UDim2.new(0, 95, 0, 0);

-- Executor.MainUI.Container.Executor.Buttons.HideText
I2L["18"] = Instance.new("TextButton", I2L["15"]);
I2L["18"]["TextSize"] = 20;
I2L["18"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["18"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["18"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["18"]["Size"] = UDim2.new(0, 90, 1, 0);
I2L["18"]["Name"] = [[HideText]];
I2L["18"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["18"]["Text"] = [[HideTxt]];
I2L["18"]["Font"] = Enum.Font.Unknown;
I2L["18"]["Position"] = UDim2.new(0, 190, 0, 0);

-- Executor.MainUI.Container.Executor.Buttons.RefreshScripts
I2L["19"] = Instance.new("TextButton", I2L["15"]);
I2L["19"]["TextSize"] = 20;
I2L["19"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["19"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["19"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["19"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["19"]["Size"] = UDim2.new(0, 135, 1, 0);
I2L["19"]["Name"] = [[RefreshScripts]];
I2L["19"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["19"]["Text"] = [[RF Scripts]];
I2L["19"]["Font"] = Enum.Font.Unknown;
I2L["19"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Executor.MainUI.Container.Executor.Scripts
I2L["1a"] = Instance.new("Frame", I2L["d"]);
I2L["1a"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["1a"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["1a"]["Size"] = UDim2.new(0, 135, 0, 275);
I2L["1a"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1a"]["Position"] = UDim2.new(0, 430, 0, 0);
I2L["1a"]["Name"] = [[Scripts]];

-- Executor.MainUI.Container.Executor.Scripts.Search
I2L["1b"] = Instance.new("Frame", I2L["1a"]);
I2L["1b"]["Active"] = true;
I2L["1b"]["BorderSizePixel"] = 0;
I2L["1b"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1b"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["1b"]["Size"] = UDim2.new(0, 125, 0, 30);
I2L["1b"]["Selectable"] = true;
I2L["1b"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1b"]["Position"] = UDim2.new(0, 4, 0, 5);
I2L["1b"]["Name"] = [[Search]];

-- Executor.MainUI.Container.Executor.Scripts.Search.Input
I2L["1c"] = Instance.new("TextBox", I2L["1b"]);
I2L["1c"]["PlaceholderColor3"] = Color3.fromRGB(220, 220, 220);
I2L["1c"]["BorderSizePixel"] = 0;
I2L["1c"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["1c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["1c"]["TextSize"] = 16;
I2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["1c"]["BackgroundTransparency"] = 1;
I2L["1c"]["PlaceholderText"] = [[Search...]];
I2L["1c"]["Size"] = UDim2.new(0, 115, 1, 0);
I2L["1c"]["Text"] = [[]];
I2L["1c"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["1c"]["Font"] = Enum.Font.Unknown;
I2L["1c"]["Name"] = [[Input]];
I2L["1c"]["ClearTextOnFocus"] = false;

-- Executor.MainUI.Container.Executor.Scripts.List
I2L["1d"] = Instance.new("ScrollingFrame", I2L["1a"]);
I2L["1d"]["Active"] = true;
I2L["1d"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
I2L["1d"]["BorderSizePixel"] = 0;
I2L["1d"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["1d"]["MidImage"] = [[rbxassetid://71274893]];
I2L["1d"]["TopImage"] = [[rbxassetid://71274893]];
I2L["1d"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1d"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["1d"]["Size"] = UDim2.new(0, 125, 0, 230);
I2L["1d"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1d"]["ScrollBarThickness"] = 5;
I2L["1d"]["Position"] = UDim2.new(0, 4, 0, 40);
I2L["1d"]["Name"] = [[List]];
I2L["1d"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Executor.Scripts.List.UIListLayout
I2L["1e"] = Instance.new("UIListLayout", I2L["1d"]);
I2L["1e"]["Padding"] = UDim.new(0, 5);

-- Executor.MainUI.Container.Executor.Tabs
I2L["1f"] = Instance.new("Frame", I2L["d"]);
I2L["1f"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
I2L["1f"]["BorderSizePixel"] = 0;
I2L["1f"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1f"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["1f"]["BackgroundTransparency"] = 1;
I2L["1f"]["Size"] = UDim2.new(0, 425, 0, 30);
I2L["1f"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1f"]["Name"] = [[Tabs]];

-- Executor.MainUI.Container.Executor.Tabs.List
I2L["20"] = Instance.new("ScrollingFrame", I2L["1f"]);
I2L["20"]["Active"] = true;
I2L["20"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
I2L["20"]["BorderSizePixel"] = 0;
I2L["20"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["20"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
I2L["20"]["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop;
I2L["20"]["BackgroundTransparency"] = 1;
I2L["20"]["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop;
I2L["20"]["Size"] = UDim2.new(0, 395, 1, 0);
I2L["20"]["ScrollBarImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["20"]["ScrollBarThickness"] = 0;
I2L["20"]["Name"] = [[List]];

-- Executor.MainUI.Container.Executor.Tabs.List.UIListLayout
I2L["21"] = Instance.new("UIListLayout", I2L["20"]);
I2L["21"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["21"]["Padding"] = UDim.new(0, 5);
I2L["21"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Executor.Tabs.AddTab
I2L["22"] = Instance.new("TextButton", I2L["1f"]);
I2L["22"]["TextSize"] = 30;
I2L["22"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["22"]["TextColor3"] = Color3.fromRGB(220, 220, 220);
I2L["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
I2L["22"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["22"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["22"]["Size"] = UDim2.new(0, 25, 1, 0);
I2L["22"]["Name"] = [[AddTab]];
I2L["22"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["22"]["Text"] = [[+]];
I2L["22"]["Font"] = Enum.Font.Unknown;
I2L["22"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Executor.MainUI.Container.Console
I2L["23"] = Instance.new("Frame", I2L["c"]);
I2L["23"]["BorderSizePixel"] = 0;
I2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["23"]["BackgroundTransparency"] = 1;
I2L["23"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["23"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["23"]["Visible"] = false;
I2L["23"]["Name"] = [[Console]];

-- Executor.MainUI.Container.Console.Buttons
I2L["24"] = Instance.new("Frame", I2L["23"]);
I2L["24"]["BorderSizePixel"] = 0;
I2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["24"]["BackgroundTransparency"] = 1;
I2L["24"]["Size"] = UDim2.new(1, 0, 0, 30);
I2L["24"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Console.Buttons.ClearConsole
I2L["25"] = Instance.new("TextButton", I2L["24"]);
I2L["25"]["TextSize"] = 18;
I2L["25"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["25"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["25"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["25"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["25"]["Size"] = UDim2.new(0, 115, 1, 0);
I2L["25"]["Name"] = [[ClearConsole]];
I2L["25"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["25"]["Text"] = [[Clear Console]];
I2L["25"]["Font"] = Enum.Font.Unknown;
I2L["25"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Executor.MainUI.Container.Console.Background
I2L["26"] = Instance.new("Frame", I2L["23"]);
I2L["26"]["Active"] = true;
I2L["26"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["26"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["26"]["Size"] = UDim2.new(1, 0, 0, 275);
I2L["26"]["Selectable"] = true;
I2L["26"]["ClipsDescendants"] = true;
I2L["26"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["26"]["Position"] = UDim2.new(0, 0, 0, 35);
I2L["26"]["Name"] = [[Background]];
I2L["26"]["SelectionGroup"] = true;

-- Executor.MainUI.Container.Console.Background.List
I2L["27"] = Instance.new("ScrollingFrame", I2L["26"]);
I2L["27"]["Active"] = true;
I2L["27"]["BorderSizePixel"] = 0;
I2L["27"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["27"]["MidImage"] = [[rbxassetid://71274893]];
I2L["27"]["TopImage"] = [[rbxassetid://71274893]];
I2L["27"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["27"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["27"]["BackgroundTransparency"] = 1;
I2L["27"]["Size"] = UDim2.new(0, 555, 0, 265);
I2L["27"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["27"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["27"]["ScrollBarThickness"] = 5;
I2L["27"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["27"]["Name"] = [[List]];
I2L["27"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Console.Background.List.UIListLayout
I2L["28"] = Instance.new("UIListLayout", I2L["27"]);
I2L["28"]["Padding"] = UDim.new(0, 5);
I2L["28"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Sidebar
I2L["29"] = Instance.new("Frame", I2L["c"]);
I2L["29"]["ZIndex"] = 3;
I2L["29"]["BorderSizePixel"] = 0;
I2L["29"]["BackgroundColor3"] = Color3.fromRGB(24, 22, 26);
I2L["29"]["Size"] = UDim2.new(0, 150, 1, 0);
I2L["29"]["Position"] = UDim2.new(0, -150, 0, 0);
I2L["29"]["Name"] = [[Sidebar]];

-- Executor.MainUI.Container.Sidebar.VersionLabel
I2L["2a"] = Instance.new("TextLabel", I2L["29"]);
I2L["2a"]["BorderSizePixel"] = 0;
I2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["2a"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["2a"]["TextSize"] = 19;
I2L["2a"]["TextColor3"] = Color3.fromRGB(187, 190, 188);
I2L["2a"]["AnchorPoint"] = Vector2.new(1, 1);
I2L["2a"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["2a"]["Text"] = [[${version}]];
I2L["2a"]["Name"] = [[VersionLabel]];
I2L["2a"]["Font"] = Enum.Font.Unknown;
I2L["2a"]["BackgroundTransparency"] = 1;
I2L["2a"]["Position"] = UDim2.new(1, 0, 1, 0);

-- Executor.MainUI.Container.Sidebar.Buttons
I2L["2b"] = Instance.new("Frame", I2L["29"]);
I2L["2b"]["BorderSizePixel"] = 0;
I2L["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["2b"]["BackgroundTransparency"] = 1;
I2L["2b"]["Size"] = UDim2.new(1, 0, 0, 270);
I2L["2b"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Sidebar.Buttons.Console
I2L["2c"] = Instance.new("TextButton", I2L["2b"]);
I2L["2c"]["TextSize"] = 20;
I2L["2c"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["2c"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["2c"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["2c"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["2c"]["Size"] = UDim2.new(1, -10, 0, 30);
I2L["2c"]["Name"] = [[Console]];
I2L["2c"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2c"]["Text"] = [[Console]];
I2L["2c"]["Font"] = Enum.Font.Unknown;
I2L["2c"]["Position"] = UDim2.new(0, 5, 0, 40);

-- Executor.MainUI.Container.Sidebar.Buttons.Executor
I2L["2d"] = Instance.new("TextButton", I2L["2b"]);
I2L["2d"]["TextSize"] = 20;
I2L["2d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["2d"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["2d"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["2d"]["Size"] = UDim2.new(1, -10, 0, 30);
I2L["2d"]["Name"] = [[Executor]];
I2L["2d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2d"]["Text"] = [[Executor]];
I2L["2d"]["Font"] = Enum.Font.Unknown;
I2L["2d"]["Position"] = UDim2.new(0, 5, 0, 5);

-- Executor.MainUI.Container.Sidebar.FadeEffect
I2L["2e"] = Instance.new("Frame", I2L["29"]);
I2L["2e"]["BorderSizePixel"] = 0;
I2L["2e"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
I2L["2e"]["BackgroundTransparency"] = 0.44999998807907104;
I2L["2e"]["Size"] = UDim2.new(0, 425, 0, 320);
I2L["2e"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["2e"]["Visible"] = false;
I2L["2e"]["Name"] = [[FadeEffect]];

return I2L["1"]
