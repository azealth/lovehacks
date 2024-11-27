-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_ScreenGui"] = Instance.new("ScreenGui");
	["_Frame"] = Instance.new("Frame");
	["_close"] = Instance.new("TextButton");
	["_TextButton"] = Instance.new("TextButton");
	["_ScrollingFrame"] = Instance.new("ScrollingFrame");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_LocalScript"] = Instance.new("LocalScript");
	["_TextLabel"] = Instance.new("TextLabel");
	["_TextButton1"] = Instance.new("TextButton");
}

-- Properties:

Converted["_ScreenGui"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_ScreenGui"].Parent = game:GetService("CoreGui")

Converted["_Frame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Frame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Frame"].Position = UDim2.new(0.322250634, 0, 0.220447287, 0)
Converted["_Frame"].Size = UDim2.new(0, 342, 0, 342)
Converted["_Frame"].Parent = Converted["_ScreenGui"]

Converted["_close"].Font = Enum.Font.SourceSans
Converted["_close"].Text = "X"
Converted["_close"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_close"].TextSize = 14
Converted["_close"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_close"].Position = UDim2.new(0.96198833, 0, -0.146198824, 0)
Converted["_close"].Size = UDim2.new(0, 52, 0, 50)
Converted["_close"].Name = "close"
Converted["_close"].Parent = Converted["_Frame"]

Converted["_TextButton"].Font = Enum.Font.SourceSans
Converted["_TextButton"].Text = "REF"
Converted["_TextButton"].TextColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].TextSize = 14
Converted["_TextButton"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_TextButton"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TextButton"].Position = UDim2.new(0.786549687, 0, -0.149122804, 0)
Converted["_TextButton"].Size = UDim2.new(0, 52, 0, 50)
Converted["_TextButton"].Parent = Converted["_Frame"]

Converted["_ScrollingFrame"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame"].Active = true
Converted["_ScrollingFrame"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_ScrollingFrame"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_ScrollingFrame"].BorderSizePixel = 0
Converted["_ScrollingFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ScrollingFrame"].Parent = Converted["_Frame"]

Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].Parent = Converted["_ScrollingFrame"]

-- Fake Module Scripts:

local fake_module_scripts = {}


-- Fake Local Scripts:

local function EALOCE_fake_script() -- Fake Script: StarterGui.ScreenGui.LocalScript
    local script = Instance.new("LocalScript")
    script.Name = "LocalScript"
    script.Parent = Converted["_ScreenGui"]
    local req = require
    local require = function(obj)
        local fake = fake_module_scripts[obj]
        if fake then
            return fake()
        end
        return req(obj)
    end

	script.Parent.Draggable = true
	
	local function toHMS(s)
		return string.format("%02i:%02i:%02i", s/60^2, s/60%60, s%60)
	end
	
	function refresh()
		for n,m in pairs(script.Parent.Frame.ScrollingFrame:GetChildren()) do
			if m.Name ~= 'UIListLayout' then
				m:Destroy()
			end
		end
		for i,v in pairs(game.Players:GetPlayers()) do
			local timeonrock = toHMS(v.RockAge.Value)
			local f = script.TextLabel:Clone()
			f.TextButton.MouseButton1Up:Connect(function()
				local Target = v.Name
				local hah = true
				spawn(function()
					while true do
						pcall(function()
							for i,v in pairs(workspace[Target]:GetDescendants()) do
								if v:IsA('ProximityPrompt') and v:IsDescendantOf(workspace[Target]) then
									v.RequiresLineOfSight = false
									v.MaxActivationDistance = 100000
									game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace[Target].Rock:FindFirstChildWhichIsA('BasePart').CFrame)
	
									local b = tostring(math.random())
									if not _G[b] then
										_G[b] = true
										task.spawn(function()
											print('THIS IS RUNNING')
											wait(1)
											for i = 1, 100 do
												hah = false
												game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0,0,0))
												wait()
											end
										end)
									end
									break
								end
							end
						end)
						if not hah then
							break
						end
						wait()
					end
				end)
			end)
			f.Text = v.Name .. ' | ' .. timeonrock
			f.Parent = script.Parent.Frame.ScrollingFrame
		end
		script.Parent.Frame.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, script.Parent.Frame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y)
	end
	
	refresh()
	
	script.Parent.Frame.TextButton.MouseButton1Up:Connect(refresh)
	script.Parent.Frame.close.MouseButton1Up:connect(function()
		script.Parent:Destroy()
	end)
end

coroutine.wrap(EALOCE_fake_script)()
