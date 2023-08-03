local I2L = {};

-- Executor
I2L["1"] = Instance.new("ScreenGui");
I2L["1"]["ResetOnSpawn"] = false;
I2L["1"]["IgnoreGuiInset"] = true;
I2L["1"]["DisplayOrder"] = 999999999;
I2L["1"]["Name"] = [[Executor]];
I2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- Executor.MainUI
I2L["2"] = Instance.new("Frame", I2L["1"]);
I2L["2"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["2"]["Size"] = UDim2.new(0, 625, 0, 375);
I2L["2"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
I2L["2"]["Visible"] = false;
I2L["2"]["Name"] = [[MainUI]];

-- Executor.MainUI.Topbar
I2L["3"] = Instance.new("Frame", I2L["2"]);
I2L["3"]["BorderSizePixel"] = 0;
I2L["3"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["3"]["Size"] = UDim2.new(1, 0, 0, 30);
I2L["3"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["3"]["Name"] = [[Topbar]];

-- Executor.MainUI.Topbar.Label
I2L["4"] = Instance.new("TextLabel", I2L["3"]);
I2L["4"]["BorderSizePixel"] = 0;
I2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
I2L["4"]["TextSize"] = 19;
I2L["4"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0);
I2L["4"]["Size"] = UDim2.new(0, 150, 1, 0);
I2L["4"]["Text"] = [[jLn0n's Executor]];
I2L["4"]["Name"] = [[Label]];
I2L["4"]["Font"] = Enum.Font.RobotoMono;
I2L["4"]["BackgroundTransparency"] = 1;
I2L["4"]["Position"] = UDim2.new(0.5, 0, 0, 0);

-- Executor.MainUI.Topbar.Buttons
I2L["5"] = Instance.new("Folder", I2L["3"]);
I2L["5"]["Name"] = [[Buttons]];

-- Executor.MainUI.Topbar.Buttons.Close
I2L["6"] = Instance.new("TextButton", I2L["5"]);
I2L["6"]["LineHeight"] = 1.100000023841858;
I2L["6"]["BorderSizePixel"] = 0;
I2L["6"]["TextSize"] = 23;
I2L["6"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["6"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
I2L["6"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["6"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["6"]["Name"] = [[Close]];
I2L["6"]["Text"] = [[X]];
I2L["6"]["Font"] = Enum.Font.Unknown;
I2L["6"]["Position"] = UDim2.new(1, 0, 0, 0);

-- Executor.MainUI.Topbar.Buttons.Hide
I2L["7"] = Instance.new("TextButton", I2L["5"]);
I2L["7"]["LineHeight"] = 1.625;
I2L["7"]["BorderSizePixel"] = 0;
I2L["7"]["TextSize"] = 36;
I2L["7"]["BackgroundColor3"] = Color3.fromRGB(23, 24, 25);
I2L["7"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
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
I2L["9"]["Size"] = UDim2.new(0, 26, 0, 4);
I2L["9"]["Position"] = UDim2.new(0.5, 0, 0, 5);
I2L["9"]["Name"] = [[1]];

-- Executor.MainUI.Topbar.Buttons.SidebarToggle.2
I2L["a"] = Instance.new("Frame", I2L["8"]);
I2L["a"]["BorderSizePixel"] = 0;
I2L["a"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["a"]["Size"] = UDim2.new(0, 26, 0, 4);
I2L["a"]["Position"] = UDim2.new(0.5, 0, 0, 15);
I2L["a"]["Name"] = [[2]];

-- Executor.MainUI.Topbar.Buttons.SidebarToggle.3
I2L["b"] = Instance.new("Frame", I2L["8"]);
I2L["b"]["BorderSizePixel"] = 0;
I2L["b"]["BackgroundColor3"] = Color3.fromRGB(214, 214, 214);
I2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
I2L["b"]["Size"] = UDim2.new(0, 26, 0, 4);
I2L["b"]["Position"] = UDim2.new(0.5, 0, 0, 25);
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
I2L["e"]["Size"] = UDim2.new(0, 460, 0, 270);
I2L["e"]["ClipsDescendants"] = true;
I2L["e"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["e"]["Position"] = UDim2.new(0, 0, 0, 30);
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
I2L["f"]["Size"] = UDim2.new(1, -18, 1, 0);
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

-- Executor.MainUI.Container.Executor.TextIDE.Lines.LineSeperator
I2L["14"] = Instance.new("Frame", I2L["12"]);
I2L["14"]["BorderSizePixel"] = 0;
I2L["14"]["BackgroundColor3"] = Color3.fromRGB(38, 40, 39);
I2L["14"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["14"]["Size"] = UDim2.new(0, 1, 1, 1);
I2L["14"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["14"]["Name"] = [[LineSeperator]];

-- Executor.MainUI.Container.Executor.Buttons
I2L["15"] = Instance.new("Frame", I2L["d"]);
I2L["15"]["BorderSizePixel"] = 0;
I2L["15"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["15"]["AnchorPoint"] = Vector2.new(0, 1);
I2L["15"]["BackgroundTransparency"] = 1;
I2L["15"]["Size"] = UDim2.new(0, 460, 0, 30);
I2L["15"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["15"]["Position"] = UDim2.new(0, 0, 1, 0);
I2L["15"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Executor.Buttons.Execute
I2L["16"] = Instance.new("ImageButton", I2L["15"]);
I2L["16"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["16"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["16"]["Image"] = [[rbxassetid://14283492016]];
I2L["16"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["16"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["16"]["Name"] = [[Execute]];
I2L["16"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);

-- Executor.MainUI.Container.Executor.Buttons.Clear
I2L["17"] = Instance.new("ImageButton", I2L["15"]);
I2L["17"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["17"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["17"]["LayoutOrder"] = 1;
I2L["17"]["Image"] = [[rbxassetid://14283492016]];
I2L["17"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["17"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["17"]["Name"] = [[Clear]];
I2L["17"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["17"]["ImageRectOffset"] = Vector2.new(64, 0);
I2L["17"]["Position"] = UDim2.new(0, 35, 0, 0);

-- Executor.MainUI.Container.Executor.Buttons.HideText
I2L["18"] = Instance.new("ImageButton", I2L["15"]);
I2L["18"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["18"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["18"]["LayoutOrder"] = 2;
I2L["18"]["Image"] = [[rbxassetid://14283492016]];
I2L["18"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["18"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["18"]["Name"] = [[HideText]];
I2L["18"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["18"]["ImageRectOffset"] = Vector2.new(128, 0);
I2L["18"]["Position"] = UDim2.new(0, 70, 0, 0);

-- Executor.MainUI.Container.Executor.Buttons.SaveFile
I2L["19"] = Instance.new("ImageButton", I2L["15"]);
I2L["19"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["19"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["19"]["LayoutOrder"] = 3;
I2L["19"]["Image"] = [[rbxassetid://14283492016]];
I2L["19"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["19"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["19"]["Name"] = [[SaveFile]];
I2L["19"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["19"]["ImageRectOffset"] = Vector2.new(192, 0);
I2L["19"]["Position"] = UDim2.new(0, 105, 0, 0);

-- Executor.MainUI.Container.Executor.Buttons.UIListLayout
I2L["1a"] = Instance.new("UIListLayout", I2L["15"]);
I2L["1a"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["1a"]["Padding"] = UDim.new(0, 5);
I2L["1a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Executor.Scripts
I2L["1b"] = Instance.new("Frame", I2L["d"]);
I2L["1b"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["1b"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["1b"]["Size"] = UDim2.new(0, 150, 0, 335);
I2L["1b"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1b"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["1b"]["Name"] = [[Scripts]];

-- Executor.MainUI.Container.Executor.Scripts.Topbar
I2L["1c"] = Instance.new("Frame", I2L["1b"]);
I2L["1c"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1c"]["Size"] = UDim2.new(0, 140, 0, 30);
I2L["1c"]["Selectable"] = true;
I2L["1c"]["ClipsDescendants"] = true;
I2L["1c"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1c"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["1c"]["Name"] = [[Topbar]];

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Search
I2L["1d"] = Instance.new("Frame", I2L["1c"]);
I2L["1d"]["BorderSizePixel"] = 0;
I2L["1d"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["1d"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["1d"]["Size"] = UDim2.new(1, -30, 0, 30);
I2L["1d"]["Selectable"] = true;
I2L["1d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["1d"]["Position"] = UDim2.new(0, 30, 0, 0);
I2L["1d"]["Visible"] = false;
I2L["1d"]["Name"] = [[Search]];

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Search.Input
I2L["1e"] = Instance.new("TextBox", I2L["1d"]);
I2L["1e"]["PlaceholderColor3"] = Color3.fromRGB(214, 214, 214);
I2L["1e"]["BorderSizePixel"] = 0;
I2L["1e"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
I2L["1e"]["TextSize"] = 16;
I2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
I2L["1e"]["BackgroundTransparency"] = 1;
I2L["1e"]["PlaceholderText"] = [[Search...]];
I2L["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["1e"]["Text"] = [[]];
I2L["1e"]["Position"] = UDim2.new(0, 5, 0, 0);
I2L["1e"]["Font"] = Enum.Font.Unknown;
I2L["1e"]["Name"] = [[Input]];
I2L["1e"]["ClearTextOnFocus"] = false;

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Buttons
I2L["1f"] = Instance.new("Folder", I2L["1c"]);
I2L["1f"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Buttons.Rename
I2L["20"] = Instance.new("ImageButton", I2L["1f"]);
I2L["20"]["BorderSizePixel"] = 0;
I2L["20"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["20"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["20"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["20"]["Image"] = [[rbxassetid://14283492016]];
I2L["20"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["20"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["20"]["Name"] = [[Rename]];
I2L["20"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["20"]["ImageRectOffset"] = Vector2.new(128, 64);
I2L["20"]["Position"] = UDim2.new(1, -35, 0, 0);
I2L["20"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Buttons.Search
I2L["21"] = Instance.new("ImageButton", I2L["1f"]);
I2L["21"]["BorderSizePixel"] = 0;
I2L["21"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["21"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["21"]["Image"] = [[rbxassetid://14283492016]];
I2L["21"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["21"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["21"]["Name"] = [[Search]];
I2L["21"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["21"]["ImageRectOffset"] = Vector2.new(64, 64);
I2L["21"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Buttons.Create
I2L["22"] = Instance.new("ImageButton", I2L["1f"]);
I2L["22"]["BorderSizePixel"] = 0;
I2L["22"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["22"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["22"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["22"]["Image"] = [[rbxassetid://14283492016]];
I2L["22"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["22"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["22"]["Name"] = [[Create]];
I2L["22"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["22"]["ImageRectOffset"] = Vector2.new(0, 64);
I2L["22"]["Position"] = UDim2.new(1, -70, 0, 0);
I2L["22"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Executor.Scripts.Topbar.Buttons.Delete
I2L["23"] = Instance.new("ImageButton", I2L["1f"]);
I2L["23"]["BorderSizePixel"] = 0;
I2L["23"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["23"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["23"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["23"]["Image"] = [[rbxassetid://14283492016]];
I2L["23"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["23"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["23"]["Name"] = [[Delete]];
I2L["23"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["23"]["ImageRectOffset"] = Vector2.new(192, 64);
I2L["23"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["23"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Executor.Scripts.ListHolder
I2L["24"] = Instance.new("Frame", I2L["1b"]);
I2L["24"]["BorderSizePixel"] = 0;
I2L["24"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["24"]["BackgroundTransparency"] = 1;
I2L["24"]["Size"] = UDim2.new(1, 0, 0, 290);
I2L["24"]["ClipsDescendants"] = true;
I2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["24"]["Position"] = UDim2.new(0, 0, 0, 40);
I2L["24"]["Name"] = [[ListHolder]];

-- Executor.MainUI.Container.Executor.Scripts.ListHolder.List
I2L["25"] = Instance.new("ScrollingFrame", I2L["24"]);
I2L["25"]["Active"] = true;
I2L["25"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;
I2L["25"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["25"]["MidImage"] = [[rbxassetid://71274893]];
I2L["25"]["TopImage"] = [[rbxassetid://71274893]];
I2L["25"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["25"]["Size"] = UDim2.new(1, -10, 1, -2);
I2L["25"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["25"]["ClipsDescendants"] = false;
I2L["25"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["25"]["ScrollBarThickness"] = 5;
I2L["25"]["Position"] = UDim2.new(0, 5, 0, 1);
I2L["25"]["Name"] = [[List]];
I2L["25"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Executor.Scripts.ListHolder.List.UIListLayout
I2L["26"] = Instance.new("UIListLayout", I2L["25"]);
I2L["26"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Left;
I2L["26"]["Padding"] = UDim.new(0, 5);

-- Executor.MainUI.Container.Executor.Tabs
I2L["27"] = Instance.new("Frame", I2L["d"]);
I2L["27"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
I2L["27"]["BorderSizePixel"] = 0;
I2L["27"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["27"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["27"]["BackgroundTransparency"] = 1;
I2L["27"]["Size"] = UDim2.new(0, 460, 0, 25);
I2L["27"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["27"]["Name"] = [[Tabs]];

-- Executor.MainUI.Container.Executor.Tabs.AddTab
I2L["28"] = Instance.new("TextButton", I2L["27"]);
I2L["28"]["LineHeight"] = 1.1349999904632568;
I2L["28"]["TextSize"] = 22;
I2L["28"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["28"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
I2L["28"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["28"]["Size"] = UDim2.new(0, 15, 0, 15);
I2L["28"]["Name"] = [[AddTab]];
I2L["28"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["28"]["Text"] = [[+]];
I2L["28"]["Font"] = Enum.Font.Unknown;
I2L["28"]["Position"] = UDim2.new(1, 0, 0, 5);

-- Executor.MainUI.Container.Executor.Tabs.ListHolder
I2L["29"] = Instance.new("Frame", I2L["27"]);
I2L["29"]["BorderSizePixel"] = 0;
I2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["29"]["BackgroundTransparency"] = 1;
I2L["29"]["Size"] = UDim2.new(0, 450, 1, 10);
I2L["29"]["ClipsDescendants"] = true;
I2L["29"]["Position"] = UDim2.new(0, -5, 0, -5);
I2L["29"]["Name"] = [[ListHolder]];

-- Executor.MainUI.Container.Executor.Tabs.ListHolder.List
I2L["2a"] = Instance.new("ScrollingFrame", I2L["29"]);
I2L["2a"]["Active"] = true;
I2L["2a"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
I2L["2a"]["BorderSizePixel"] = 0;
I2L["2a"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["2a"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
I2L["2a"]["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop;
I2L["2a"]["BackgroundTransparency"] = 1;
I2L["2a"]["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop;
I2L["2a"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["2a"]["ScrollBarImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["2a"]["ClipsDescendants"] = false;
I2L["2a"]["ScrollBarThickness"] = 0;
I2L["2a"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["2a"]["Name"] = [[List]];

-- Executor.MainUI.Container.Executor.Tabs.ListHolder.List.UIListLayout
I2L["2b"] = Instance.new("UIListLayout", I2L["2a"]);
I2L["2b"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["2b"]["Padding"] = UDim.new(0, 5);
I2L["2b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Console
I2L["2c"] = Instance.new("Frame", I2L["c"]);
I2L["2c"]["BorderSizePixel"] = 0;
I2L["2c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["2c"]["BackgroundTransparency"] = 1;
I2L["2c"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["2c"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["2c"]["Visible"] = false;
I2L["2c"]["Name"] = [[Console]];

-- Executor.MainUI.Container.Console.Output
I2L["2d"] = Instance.new("Frame", I2L["2c"]);
I2L["2d"]["Active"] = true;
I2L["2d"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["2d"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["2d"]["Selectable"] = true;
I2L["2d"]["ClipsDescendants"] = true;
I2L["2d"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2d"]["Name"] = [[Output]];
I2L["2d"]["SelectionGroup"] = true;

-- Executor.MainUI.Container.Console.Output.List
I2L["2e"] = Instance.new("ScrollingFrame", I2L["2d"]);
I2L["2e"]["Active"] = true;
I2L["2e"]["BorderSizePixel"] = 0;
I2L["2e"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
I2L["2e"]["MidImage"] = [[rbxassetid://71274893]];
I2L["2e"]["TopImage"] = [[rbxassetid://71274893]];
I2L["2e"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["2e"]["BorderMode"] = Enum.BorderMode.Inset;
I2L["2e"]["BackgroundTransparency"] = 1;
I2L["2e"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["2e"]["ScrollBarImageColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2e"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["2e"]["ScrollBarThickness"] = 5;
I2L["2e"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["2e"]["Name"] = [[List]];
I2L["2e"]["BottomImage"] = [[rbxassetid://71274893]];

-- Executor.MainUI.Container.Console.Output.List.UIListLayout
I2L["2f"] = Instance.new("UIListLayout", I2L["2e"]);
I2L["2f"]["Padding"] = UDim.new(0, 5);
I2L["2f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Console.ButtonsHolder
I2L["30"] = Instance.new("CanvasGroup", I2L["2c"]);
I2L["30"]["GroupTransparency"] = 0.75;
I2L["30"]["ZIndex"] = 2;
I2L["30"]["BorderSizePixel"] = 0;
I2L["30"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["30"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["30"]["BackgroundTransparency"] = 1;
I2L["30"]["Size"] = UDim2.new(0, 115, 0, 40);
I2L["30"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["30"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["30"]["Name"] = [[ButtonsHolder]];

-- Executor.MainUI.Container.Console.ButtonsHolder.Buttons
I2L["31"] = Instance.new("Frame", I2L["30"]);
I2L["31"]["ZIndex"] = 2;
I2L["31"]["BorderSizePixel"] = 0;
I2L["31"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["31"]["BackgroundTransparency"] = 1;
I2L["31"]["Size"] = UDim2.new(1, -10, 1, -10);
I2L["31"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["31"]["Position"] = UDim2.new(0, 5, 0, 5);
I2L["31"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Console.ButtonsHolder.Buttons.UIListLayout
I2L["32"] = Instance.new("UIListLayout", I2L["31"]);
I2L["32"]["FillDirection"] = Enum.FillDirection.Horizontal;
I2L["32"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right;
I2L["32"]["Padding"] = UDim.new(0, 5);
I2L["32"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- Executor.MainUI.Container.Console.ButtonsHolder.Buttons.Clear
I2L["33"] = Instance.new("ImageButton", I2L["31"]);
I2L["33"]["BackgroundColor3"] = Color3.fromRGB(18, 17, 19);
I2L["33"]["ImageColor3"] = Color3.fromRGB(214, 214, 214);
I2L["33"]["AnchorPoint"] = Vector2.new(1, 0);
I2L["33"]["Image"] = [[rbxassetid://14283492016]];
I2L["33"]["ImageRectSize"] = Vector2.new(64, 64);
I2L["33"]["Size"] = UDim2.new(0, 30, 0, 30);
I2L["33"]["Name"] = [[Clear]];
I2L["33"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["33"]["ImageRectOffset"] = Vector2.new(64, 0);
I2L["33"]["Position"] = UDim2.new(1, -5, 0, 5);

-- Executor.MainUI.Container.Sidebar
I2L["34"] = Instance.new("Frame", I2L["c"]);
I2L["34"]["ZIndex"] = 3;
I2L["34"]["BorderSizePixel"] = 0;
I2L["34"]["BackgroundColor3"] = Color3.fromRGB(24, 22, 26);
I2L["34"]["Size"] = UDim2.new(0, 150, 1, 0);
I2L["34"]["Position"] = UDim2.new(0, -150, 0, 0);
I2L["34"]["Name"] = [[Sidebar]];

-- Executor.MainUI.Container.Sidebar.VersionLabel
I2L["35"] = Instance.new("TextLabel", I2L["34"]);
I2L["35"]["BorderSizePixel"] = 0;
I2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["35"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["35"]["TextSize"] = 19;
I2L["35"]["TextColor3"] = Color3.fromRGB(187, 190, 188);
I2L["35"]["AnchorPoint"] = Vector2.new(1, 1);
I2L["35"]["Size"] = UDim2.new(1, 0, 0, 25);
I2L["35"]["Text"] = [[${version}]];
I2L["35"]["Name"] = [[VersionLabel]];
I2L["35"]["Font"] = Enum.Font.Unknown;
I2L["35"]["BackgroundTransparency"] = 1;
I2L["35"]["Position"] = UDim2.new(1, 0, 1, 0);

-- Executor.MainUI.Container.Sidebar.Buttons
I2L["36"] = Instance.new("Frame", I2L["34"]);
I2L["36"]["BorderSizePixel"] = 0;
I2L["36"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["36"]["BackgroundTransparency"] = 1;
I2L["36"]["Size"] = UDim2.new(1, 0, 0, 290);
I2L["36"]["Name"] = [[Buttons]];

-- Executor.MainUI.Container.Sidebar.Buttons.Executor
I2L["37"] = Instance.new("TextButton", I2L["36"]);
I2L["37"]["TextSize"] = 20;
I2L["37"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["37"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["37"]["Size"] = UDim2.new(1, -10, 0, 30);
I2L["37"]["Name"] = [[Executor]];
I2L["37"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["37"]["Text"] = [[]];
I2L["37"]["Font"] = Enum.Font.Unknown;
I2L["37"]["Position"] = UDim2.new(0, 5, 0, 5);

-- Executor.MainUI.Container.Sidebar.Buttons.Executor.Label
I2L["38"] = Instance.new("TextLabel", I2L["37"]);
I2L["38"]["BorderSizePixel"] = 0;
I2L["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["38"]["TextSize"] = 20;
I2L["38"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["38"]["Size"] = UDim2.new(0, 110, 1, 0);
I2L["38"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
I2L["38"]["Text"] = [[Executor]];
I2L["38"]["Name"] = [[Label]];
I2L["38"]["Font"] = Enum.Font.Unknown;
I2L["38"]["BackgroundTransparency"] = 1;
I2L["38"]["Position"] = UDim2.new(0, 30, 0, 0);

-- Executor.MainUI.Container.Sidebar.Buttons.Executor.Icon
I2L["39"] = Instance.new("TextLabel", I2L["37"]);
I2L["39"]["LineHeight"] = 1.1399999856948853;
I2L["39"]["BorderSizePixel"] = 0;
I2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["39"]["TextSize"] = 27;
I2L["39"]["TextColor3"] = Color3.fromRGB(231, 231, 231);
I2L["39"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["39"]["Text"] = [=[[]]=];
I2L["39"]["Name"] = [[Icon]];
I2L["39"]["Font"] = Enum.Font.Unknown;
I2L["39"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Sidebar.Buttons.Console
I2L["3a"] = Instance.new("TextButton", I2L["36"]);
I2L["3a"]["TextSize"] = 20;
I2L["3a"]["BackgroundColor3"] = Color3.fromRGB(22, 21, 24);
I2L["3a"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["3a"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["3a"]["Size"] = UDim2.new(1, -10, 0, 30);
I2L["3a"]["Name"] = [[Console]];
I2L["3a"]["BorderColor3"] = Color3.fromRGB(38, 40, 39);
I2L["3a"]["Text"] = [[]];
I2L["3a"]["Font"] = Enum.Font.Unknown;
I2L["3a"]["Position"] = UDim2.new(0, 5, 0, 40);

-- Executor.MainUI.Container.Sidebar.Buttons.Console.Label
I2L["3b"] = Instance.new("TextLabel", I2L["3a"]);
I2L["3b"]["BorderSizePixel"] = 0;
I2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["3b"]["TextSize"] = 20;
I2L["3b"]["TextColor3"] = Color3.fromRGB(214, 214, 214);
I2L["3b"]["Size"] = UDim2.new(0, 110, 1, 0);
I2L["3b"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
I2L["3b"]["Text"] = [[Console]];
I2L["3b"]["Name"] = [[Label]];
I2L["3b"]["Font"] = Enum.Font.Unknown;
I2L["3b"]["BackgroundTransparency"] = 1;
I2L["3b"]["Position"] = UDim2.new(0, 30, 0, 0);

-- Executor.MainUI.Container.Sidebar.Buttons.Console.Icon
I2L["3c"] = Instance.new("TextLabel", I2L["3a"]);
I2L["3c"]["LineHeight"] = 1.1399999856948853;
I2L["3c"]["BorderSizePixel"] = 0;
I2L["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
I2L["3c"]["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
I2L["3c"]["TextSize"] = 24;
I2L["3c"]["TextColor3"] = Color3.fromRGB(231, 231, 231);
I2L["3c"]["Size"] = UDim2.new(0, 30, 1, 0);
I2L["3c"]["Text"] = [[>_]];
I2L["3c"]["Name"] = [[Icon]];
I2L["3c"]["Font"] = Enum.Font.Unknown;
I2L["3c"]["BackgroundTransparency"] = 1;

-- Executor.MainUI.Container.Sidebar.FadeEffect
I2L["3d"] = Instance.new("Frame", I2L["34"]);
I2L["3d"]["BorderSizePixel"] = 0;
I2L["3d"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
I2L["3d"]["BackgroundTransparency"] = 0.44999998807907104;
I2L["3d"]["Size"] = UDim2.new(0, 475, 1, 0);
I2L["3d"]["Position"] = UDim2.new(1, 0, 0, 0);
I2L["3d"]["Visible"] = false;
I2L["3d"]["Name"] = [[FadeEffect]];

-- Executor.MainUI.Container.PopupBackground
I2L["3e"] = Instance.new("Frame", I2L["c"]);
I2L["3e"]["ZIndex"] = 2;
I2L["3e"]["BorderSizePixel"] = 0;
I2L["3e"]["BackgroundColor3"] = Color3.fromRGB(19, 19, 19);
I2L["3e"]["BackgroundTransparency"] = 0.44999998807907104;
I2L["3e"]["Size"] = UDim2.new(1, 0, 1, 0);
I2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
I2L["3e"]["Visible"] = false;
I2L["3e"]["Name"] = [[PopupBackground]];

return I2L["1"];
