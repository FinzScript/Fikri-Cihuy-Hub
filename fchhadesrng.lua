local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local Title = Instance.new("TextLabel")
local OpenButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Fungsi drag mobile
local function Dragify(frame)
	local dragToggle, dragInput, dragStart, startPos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
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
		if input == dragInput and dragToggle then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- GUI Setup
ScreenGui.Name = "HadesRNG_UI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main Panel
MainFrame.Name = "MainPanel"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
MainFrame.Position = UDim2.new(0.25, 0, 0.2, 0)
MainFrame.Size = UDim2.new(0.5, 0, 0.4, 0)
MainFrame.Visible = false

local CornerMain = UICorner:Clone()
CornerMain.Parent = MainFrame

local StrokeMain = UIStroke:Clone()
StrokeMain.Parent = MainFrame
StrokeMain.Color = Color3.fromRGB(0, 127, 255)
StrokeMain.Thickness = 2

-- Title
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Text = "Hade's RNG Panel"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold

-- Close Button
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
CloseButton.Position = UDim2.new(0.88, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0.1, 0, 0.12, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextScaled = true

local CornerClose = UICorner:Clone()
CornerClose.Parent = CloseButton

local StrokeClose = UIStroke:Clone()
StrokeClose.Parent = CloseButton
StrokeClose.Color = Color3.fromRGB(0, 127, 255)

-- Open Button (kotak kecil)
OpenButton.Parent = ScreenGui
OpenButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
OpenButton.Position = UDim2.new(0.03, 0, 0.4, 0)
OpenButton.Size = UDim2.new(0.12, 0, 0.06, 0)
OpenButton.Text = "Open"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.Font = Enum.Font.SourceSans
OpenButton.TextScaled = true

local CornerOpen = UICorner:Clone()
CornerOpen.Parent = OpenButton

local StrokeOpen = UIStroke:Clone()
StrokeOpen.Parent = OpenButton
StrokeOpen.Color = Color3.fromRGB(0, 127, 255)

-- Fungsi tombol
OpenButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	OpenButton.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	OpenButton.Visible = true
end)

-- Aktifkan drag
Dragify(MainFrame)
Dragify(OpenButton)
