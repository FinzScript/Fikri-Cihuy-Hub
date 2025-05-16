repeat task.wait() until game:IsLoaded()
task.wait(1)

local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPlayers()[1]
local PlayerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HadesRNG_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

-- Drag function
local function Dragify(frame)
	local dragging = false
	local dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

-- Main Panel
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
MainFrame.Visible = false
MainFrame.ZIndex = 10

local MainUICorner = Instance.new("UICorner", MainFrame)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(0, 127, 255)
MainStroke.Thickness = 2

local Title = Instance.new("TextLabel", MainFrame)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Text = "Hade's RNG Panel"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.ZIndex = 11

-- Close Button
local CloseButton = Instance.new("TextButton", MainFrame)
CloseButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
CloseButton.Position = UDim2.new(0.88, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0.1, 0, 0.12, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextScaled = true
CloseButton.ZIndex = 11

Instance.new("UICorner", CloseButton)
Instance.new("UIStroke", CloseButton).Color = Color3.fromRGB(0, 127, 255)

-- Open Button (kotak kecil)
local OpenButton = Instance.new("TextButton", ScreenGui)
OpenButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
OpenButton.Position = UDim2.new(0.03, 0, 0.4, 0)
OpenButton.Size = UDim2.new(0.12, 0, 0.06, 0)
OpenButton.Text = "Open"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.Font = Enum.Font.SourceSans
OpenButton.TextScaled = true
OpenButton.ZIndex = 10

Instance.new("UICorner", OpenButton)
Instance.new("UIStroke", OpenButton).Color = Color3.fromRGB(0, 127, 255)

-- Tombol fungsi
OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	OpenButton.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenButton.Visible = true
end)

-- Enable drag
Dragify(MainFrame)
Dragify(OpenButtondrag
Dragify(MainFrame)
Dragify(OpenButton)
