--[[ 
    🔥 HÙNG FORSAKEN HUB V1.2 - FIX GHOST & WATERMARK 🔥
    - Security: Level Medium (Numeric Strings)
    - Status: Ultra Lite for Delta
]]

local function _0xS(str)
    local r = ""
    for b in str:gmatch("%d+") do r = r .. string.char(tonumber(b)) end
    return r
end

-- Logic lõi đã fix lỗi
local _0xLogic = [[
local P = game:GetService("Players")
local R = game:GetService("RunService")
local C = game:GetService("CoreGui")
local L = P.LocalPlayer
local U = {G = false, S = false, U = false, T = nil}

-- Fix Watermark (Tự hồi sinh)
local function CreateWM()
    if C:FindFirstChild("ForsakenWM") then C.ForsakenWM:Destroy() end
    local wm = Instance.new("ScreenGui", C); wm.Name = "ForsakenWM"
    local lb = Instance.new("TextLabel", wm)
    lb.Size = UDim2.new(0,300,0,50); lb.Position = UDim2.new(1,-310,1,-60); lb.BackgroundTransparency = 1
    lb.Font = 3; lb.TextSize = 25; lb.TextXAlignment = 1
    R.RenderStepped:Connect(function()
        lb.Text = "HÙNG FORSAKEN V1.0"
        lb.TextColor3 = Color3.fromHSV(tick()%2.5/2.5, 0.8, 1)
        if not lb.Parent or lb.Parent ~= wm then lb.Parent = wm end
    end)
end
task.spawn(CreateWM)

-- Fix Ghost (Trở lại bình thường khi OFF)
local function SetGhost(ov)
    local char = L.Character
    if char then
        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") or p:IsA("Decal") then
                p.Transparency = ov and 1 or 0
                if not ov then p.CanCollide = true end
            end
        end
    end
end

local gui = Instance.new("ScreenGui", C); gui.Name = "H_F_V2"
local f = Instance.new("Frame", gui); f.Size = UDim2.new(0,200,0,260); f.Position = UDim2.new(0.5,-100,0.4,0); f.BackgroundColor3 = Color3.fromRGB(15,15,20); f.Active = true; f.Draggable = true
Instance.new("UICorner", f)
local b = Instance.new("Frame", f); b.Size = UDim2.new(1,0,1,-35); b.Position = UDim2.new(0,0,0,35); b.BackgroundTransparency = 1

local function _AB(n, y, c, tg)
    local bt = Instance.new("TextButton", b); bt.Text = n..": OFF"; bt.Size = UDim2.new(0.9,0,0,42); bt.Position = UDim2.new(0.05,0,0,y); bt.BackgroundColor3 = Color3.fromRGB(150,0,0); bt.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", bt)
    local a = false
    bt.MouseButton1Click:Connect(function()
        a = not a
        bt.Text = n..(a and ": ON" or ": OFF")
        bt.BackgroundColor3 = a and Color3.fromRGB(0,150,0) or Color3.fromRGB(150,0,0)
        c(a)
    end)
end

R.Stepped:Connect(function()
    local ch = L.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    if U.S and U.T and U.T.Character then
        ch.HumanoidRootPart.CFrame = U.T.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
    end
    if U.G or U.U then
        for _,p in pairs(ch:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end
    end
end)

_AB("GHOST", 15, function(s) U.G = s; SetGhost(s) end, true)
_AB("STICKY", 75, function(s) 
    U.S = s; U.T = nil
    if s then for _,v in pairs(P:GetPlayers()) do if v ~= L and v.Character then U.T = v break end end end
end, true)
_AB("UNDER", 135, function(s)
    local r = L.Character.HumanoidRootPart
    if s then U.U = true; r.CFrame = r.CFrame * CFrame.new(0,-15,0)
    else U.U = false; r.CFrame = r.CFrame * CFrame.new(0,15,0) end
end, true)
]]

loadstring(_0xLogic)()
print(_0xS("72 85 78 71 32 86 49 46 50 32 70 73 88 69 68"))

