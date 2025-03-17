--[=[
alr
]=]

-- Instances: 8 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.LOADING_SCREEN
G2L["1"] = Instance.new("ScreenGui", game.CoreGui)
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[LOADING_SCREEN]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.LOADING_SCREEN.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(23, 23, 23);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["ZIndex"] = 99


-- StarterGui.LOADING_SCREEN.Frame.TextLabel
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 20;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["BackgroundTransparency"] = 1;
G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["3"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Murder Mystery 2]];
G2L["3"]["Position"] = UDim2.new(0.5, 0, -0.13795, 150);


-- StarterGui.LOADING_SCREEN.Frame.TextLabel
G2L["4"] = Instance.new("TextLabel", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextSize"] = 16;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextColor3"] = Color3.fromRGB(255,255,255);
G2L["4"]["BackgroundTransparency"] = 1;
G2L["4"]["RichText"] = true;
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["4"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = string.format("<font color=\"rgb(0, 157, 255)\">Servers Scraped:</font> %s", readfile(getgenv().fileName));
G2L["4"]["Position"] = UDim2.new(0.5, 0, -0.10063, 150);


-- StarterGui.LOADING_SCREEN.Frame.ImageLabel
G2L["5"] = Instance.new("ImageLabel", G2L["2"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5"]["Image"] = [[rbxassetid://89376675947127]];
G2L["5"]["Size"] = UDim2.new(0, 175, 0, 175);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.LOADING_SCREEN.Frame.ImageLabel.UICorner
G2L["6"] = Instance.new("UICorner", G2L["5"]);
G2L["6"]["CornerRadius"] = UDim.new(0, 6);


-- StarterGui.LOADING_SCREEN.Frame.ImageLabel.UIStroke
G2L["7"] = Instance.new("UIStroke", G2L["5"]);
G2L["7"]["Thickness"] = 2;
G2L["7"]["Color"] = Color3.fromRGB(39, 39, 39);


-- StarterGui.LOADING_SCREEN.Frame.TextLabel
G2L["8"] = Instance.new("TextLabel", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["TextSize"] = 16;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["RichText"] = true;
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0);
G2L["8"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Text"] = [[interface optimised by <font color="rgb(0, 157, 255)">vkzire</font>]];
G2L["8"]["Position"] = UDim2.new(0.5, 0, -0.066, 150);



return G2L["1"];
