--wsg3
local module = {}

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")


function module:start()
	local start = {}

	local UI = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local Container = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local ScrollFrame = Instance.new("ScrollingFrame")
	local MENU = Instance.new("ImageButton")
	local UIListLayout = Instance.new("UIListLayout")
	local CONFIG_FRAME = Instance.new("Frame")
	local CONFIG_CORNER = Instance.new("UICorner")
	local CONFIGTITLE = Instance.new("TextLabel")
	local CONFIGTITLE_CORNER = Instance.new("UIPadding")
	local CFG_CONT = Instance.new("Frame")
	local CF_CONT_CORNER = Instance.new("UIPadding")
	local ServerHopButton = Instance.new("TextButton")
	local ServerHopButton_Corner = Instance.new("UICorner")
	local RejoinButton = Instance.new("TextButton")
	local ServerHopButton_Corner_2 = Instance.new("UICorner")

	UIListLayout.Parent = ScrollFrame
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)

	UI.Name = tostring(math.random(5, 100000)) .. "yoo"
	UI.Parent = game.CoreGui
	UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = UI
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 480, 0, 330)

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		Main.Position = position
	end

	Main.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = Main.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	UICorner.CornerRadius = UDim.new(0, 6)
	UICorner.Parent = Main

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundTransparency = 1.000
	Title.Size = UDim2.new(0.393, 0, 0, 25)
	Title.Font = Enum.Font.Code
	Title.Text = "Murder Mystery 2 <font color=\"rgb(0, 157, 255)\">next gen</font>"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextStrokeTransparency = 0.850
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.RichText = true

	function start:UpdateStatus(status)
		Title.Text = status ~= nil and string.format("Murder Mystery 2 <font color=\"rgb(0, 157, 255)\">next gen, %s</font>", status) or "Murder Mystery 2 <font color=\"rgb(0, 157, 255)\">next gen</font>"
	end

	UIPadding.Parent = Title
	UIPadding.PaddingLeft = UDim.new(0, 6)

	Container.Name = "Container"
	Container.Parent = Main
	Container.AnchorPoint = Vector2.new(0.5, 0)
	Container.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Container.Position = UDim2.new(0.5, 0, 0.075, 0)
	Container.Size = UDim2.new(1, -20, 0, 293)

	UICorner_2.CornerRadius = UDim.new(0, 6)
	UICorner_2.Parent = Container

	ScrollFrame.Name = "ScrollFrame"
	ScrollFrame.Parent = Container
	ScrollFrame.Active = true
	ScrollFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	ScrollFrame.BackgroundTransparency = 1.000
	ScrollFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	ScrollFrame.Size = UDim2.new(1, 0, 1, 0)
	ScrollFrame.ScrollBarThickness = 0


	CONFIG_FRAME.Name = "CONFIG_FRAME"
	CONFIG_FRAME.Parent = Main
	CONFIG_FRAME.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	CONFIG_FRAME.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CONFIG_FRAME.BorderSizePixel = 0
	CONFIG_FRAME.Position = UDim2.new(1, 5, 0, 0)
	CONFIG_FRAME.Size = UDim2.new(0, 204, 0, 121)
    CONFIG_FRAME.Visible = true

	CONFIG_CORNER.CornerRadius = UDim.new(0, 6)
	CONFIG_CORNER.Name = "CONFIG_CORNER"
	CONFIG_CORNER.Parent = CONFIG_FRAME

	CONFIGTITLE.Name = "CONFIGTITLE"
	CONFIGTITLE.Parent = CONFIG_FRAME
	CONFIGTITLE.AnchorPoint = Vector2.new(0.5, 0)
	CONFIGTITLE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	CONFIGTITLE.BackgroundTransparency = 1.000
	CONFIGTITLE.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CONFIGTITLE.BorderSizePixel = 0
	CONFIGTITLE.Position = UDim2.new(0.5, 0, 0, 0)
	CONFIGTITLE.Size = UDim2.new(1.00000072, 0, 0, 25)
	CONFIGTITLE.ZIndex = 4
	CONFIGTITLE.Font = Enum.Font.Code
	CONFIGTITLE.Text = "Additional Features"
	CONFIGTITLE.TextColor3 = Color3.fromRGB(0, 157, 255)
	CONFIGTITLE.TextSize = 14.000
	CONFIGTITLE.TextStrokeTransparency = 0.850

	CONFIGTITLE_CORNER.Name = "CONFIGTITLE_CORNER"
	CONFIGTITLE_CORNER.Parent = CONFIGTITLE
	CONFIGTITLE_CORNER.PaddingLeft = UDim.new(0, 6)

	CFG_CONT.Name = "CFG_CONT"
	CFG_CONT.Parent = CONFIG_FRAME
	CFG_CONT.AnchorPoint = Vector2.new(0.5, 0.5)
	CFG_CONT.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	CFG_CONT.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CFG_CONT.BorderSizePixel = 0
	CFG_CONT.Position = UDim2.new(0.5, 0, 0.5, 0)
	CFG_CONT.Size = UDim2.new(1, -10, 1, -10)

	CF_CONT_CORNER.Name = "CF_CONT_CORNER"
	CF_CONT_CORNER.Parent = CFG_CONT
	CF_CONT_CORNER.PaddingLeft = UDim.new(0, 6)

	ServerHopButton.Name = "ServerHopButton"
	ServerHopButton.Parent = CFG_CONT
	ServerHopButton.AnchorPoint = Vector2.new(0.5, 0)
	ServerHopButton.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	ServerHopButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ServerHopButton.BorderSizePixel = 0
	ServerHopButton.Position = UDim2.new(0.5, 0, 0.275999993, 0)
	ServerHopButton.Size = UDim2.new(0, 116, 0, 24)
	ServerHopButton.AutoButtonColor = false
	ServerHopButton.Font = Enum.Font.Code
	ServerHopButton.Text = "Server Hop"
	ServerHopButton.TextColor3 = Color3.fromRGB(212, 212, 212)
	ServerHopButton.TextSize = 14.000
    function start:ServerHopCallback(callback)
        ServerHopButton.MouseButton1Click:Connect(callback)
    end

	ServerHopButton_Corner.CornerRadius = UDim.new(0, 6)
	ServerHopButton_Corner.Name = "ServerHopButton_Corner"
	ServerHopButton_Corner.Parent = ServerHopButton

	RejoinButton.Name = "RejoinButton"
	RejoinButton.Parent = CFG_CONT
	RejoinButton.AnchorPoint = Vector2.new(0.5, 0)
	RejoinButton.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
	RejoinButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RejoinButton.BorderSizePixel = 0
	RejoinButton.Position = UDim2.new(0.5, 0, 0.600000024, 0)
	RejoinButton.Size = UDim2.new(0, 116, 0, 24)
	RejoinButton.AutoButtonColor = false
	RejoinButton.Font = Enum.Font.Code
	RejoinButton.Text = "Rejoin"
	RejoinButton.TextColor3 = Color3.fromRGB(212, 212, 212)
	RejoinButton.TextSize = 14.000
    RejoinButton.MouseButton1Click:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
    end)

	ServerHopButton_Corner_2.CornerRadius = UDim.new(0, 6)
	ServerHopButton_Corner_2.Name = "ServerHopButton_Corner"
	ServerHopButton_Corner_2.Parent = RejoinButton

	MENU.Name = "MENU"
	MENU.Parent = Main
	MENU.BackgroundTransparency = 1.000
	MENU.Position = UDim2.new(0.929, 0, 0.003, 0)
	MENU.Size = UDim2.new(0, 24, 0, 24)
	MENU.Image = "rbxassetid://85866174662088"
	MENU.MouseButton1Click:Connect(function()
		CONFIG_FRAME.Visible = not CONFIG_FRAME.Visible
	end)

	function start:AddPlayer(player, value)
		local x = {}
		local playerToAdd = game.Players:FindFirstChild(player)

		if playerToAdd then

			local Name = playerToAdd.Name

			local Example = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local Icon = Instance.new("ImageLabel")
			local UICorner_4 = Instance.new("UICorner")
			local Username = Instance.new("TextLabel")
			local InventoryCost = Instance.new("TextLabel")
			local UIPadding_2 = Instance.new("UIPadding")
			local CopyNameButton = Instance.new("TextButton")
			local CopyNameCorner = Instance.new("UICorner")

			UICorner_3.CornerRadius = UDim.new(0, 6)
			UICorner_3.Parent = Example

			Icon.Name = "Icon"
			Icon.Parent = Example
			Icon.AnchorPoint = Vector2.new(0, 0.5)
			Icon.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
			Icon.Position = UDim2.new(0, 6, 0.5, 0)
			Icon.Size = UDim2.new(0, 60, 0, 60)

			local thumbType = Enum.ThumbnailType.HeadShot
			local thumbSize = Enum.ThumbnailSize.Size60x60
			local content = Players:GetUserThumbnailAsync(playerToAdd.UserId, thumbType, thumbSize)
			Icon.Image = content

			UICorner_4.CornerRadius = UDim.new(0, 10)
			UICorner_4.Parent = Icon

			Username.Name = "Username"
			Username.Parent = Example
			Username.BackgroundTransparency = 1.000
			Username.Position = UDim2.new(0.162, 0, 0.1, 0)
			Username.Size = UDim2.new(0, 178, 0, 14)
			Username.Font = Enum.Font.Code
			Username.Text = "<font color=\"rgb(0, 157, 255)\">Username: </font>@" .. Name
			Username.TextColor3 = Color3.fromRGB(212, 212, 212)
			Username.TextSize = 14.000
			Username.TextStrokeTransparency = 0.850
			Username.TextXAlignment = Enum.TextXAlignment.Left
			Username.RichText = true


			UIPadding_2.Parent = ScrollFrame
			UIPadding_2.PaddingTop = UDim.new(0, 4)

			InventoryCost.Name = "InventoryCost"
			InventoryCost.Parent = Example
			InventoryCost.BackgroundTransparency = 1.000
			InventoryCost.Position = UDim2.new(0.162, 0, 0.286, 0)
			InventoryCost.Size = UDim2.new(0, 178, 0, 14)
			InventoryCost.Font = Enum.Font.Code
			InventoryCost.Text = "<font color=\"rgb(0, 157, 255)\">Inventory Cost: </font>" .. value
			InventoryCost.TextColor3 = Color3.fromRGB(212, 212, 212)
			InventoryCost.TextSize = 14.000
			InventoryCost.TextStrokeTransparency = 0.850
			InventoryCost.TextXAlignment = Enum.TextXAlignment.Left
			InventoryCost.RichText = true

			CopyNameButton.Name = "CopyName"
			CopyNameButton.Parent = Example
			CopyNameButton.BorderSizePixel = 0
			CopyNameButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			CopyNameButton.AutoButtonColor = false
			CopyNameButton.TextSize = 14
			CopyNameButton.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			CopyNameButton.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
			CopyNameButton.Size = UDim2.new(0, 116, 0, 24)
			CopyNameButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			CopyNameButton.Text = "Copy Name"
			CopyNameButton.Position = UDim2.new(0.162, 0, 0.55, 0)
			CopyNameCorner.Parent = CopyNameButton
			CopyNameCorner.CornerRadius = UDim.new(0, 6)

			function x:SetCallback(callback)
				CopyNameButton.MouseButton1Click:Connect(callback)
			end

			Example.Name = "Example"
			Example.Parent = ScrollFrame
			Example.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
			Example.Size = UDim2.new(1, -8, 0, 75)
		end

		return x
	end

	return start
end

return module
