--[[ 
    🔥 HÙNG FORSAKEN HUB V1.0 - GHOST PROTOCOL 🔥
    - Security: Level Max (Encrypted Strings + Logic)
    - Source: vuh60670-sudo
]]

local _0x52 = function(_0x41) 
    local _0x68 = ""
    for _0x20 in _0x41:gmatch("%d+") do _0x68 = _0x68 .. string.char(tonumber(_0x20)) end
    return _0x68
end

local _0x7A = {
    _0x52("103 97 109 101"), -- game
    _0x52("71 101 116 83 101 114 118 105 99 101"), -- GetService
    _0x52("80 108 97 121 101 114 115"), -- Players
    _0x52("82 117 110 83 101 114 118 105 99 101"), -- RunService
    _0x52("67 111 114 101 71 117 105") -- CoreGui
}

local _0x33 = loadstring(_0x52("114 101 116 117 114 110 32 103 97 109 101 58 71 101 116 83 101 114 118 105 99 101 40 39 80 108 97 121 101 114 115 39 41 46 76 111 99 97 108 80 108 97 121 101 114"))()

local _0xLogic = [[
local _P = game:GetService("Players")
local _R = game:GetService("RunService")
local _C = game:GetService("CoreGui")
local _L = _P.LocalPlayer
local _U = {G=false, S=false, U=false, T=nil}

local function _W()
    if _C:FindFirstChild("ForsakenWM") then _C.ForsakenWM:Destroy() end
    local wm = Instance.new("ScreenGui", _C); wm.Name = "ForsakenWM"
    local lb = Instance.new("TextLabel", wm)
    lb.Size = UDim2.new(0,300,0,50); lb.Position = UDim2.new(1,-310,1,-60); lb.BackgroundTransparency = 1
    lb.Font = 3; lb.TextSize = 25; lb.TextXAlignment = 1
    _R.RenderStepped:Connect(function()
        lb.Text = "HÙNG FORSAKEN V1.0"
        lb.TextColor3 = Color3.fromHSV(tick()%2.5/2.5, 0.8, 1)
    end)
end
task.spawn(_W)

local gui = Instance.new("ScreenGui", _C); gui.Name = "H_F_V1"
local f = Instance.new("Frame", gui); f.Size = UDim2.new(0,200,0,260); f.Position = UDim2.new(0.5,-100,0.4,0); f.BackgroundColor3 = Color3.fromRGB(15,15,20); f.Active = true; f.Draggable = true
Instance.new("UICorner", f)
local t = Instance.new("TextLabel", f); t.Size = UDim2.new(1,0,0,35); t.BackgroundColor3 = Color3.fromRGB(120,0,200); t.Text = "FORSAKEN V1"; t.TextColor3 = Color3.new(1,1,1); t.Font = 3

local b = Instance.new("Frame", f); b.Size = UDim2.new(1,0,1,-35); b.Position = UDim2.new(0,0,0,35); b.BackgroundTransparency = 1

local function _AB(n, y, c, tg)
    local bt = Instance.new("TextButton", b); bt.Text = n..": OFF"; bt.Size = UDim2.new(0.9,0,0,42); bt.Position = UDim2.new(0.05,0,0,y); bt.BackgroundColor3 = Color3.fromRGB(150,0,0); bt.TextColor3 = Color3.new(1,1,1)
    local a = false
    bt.MouseButton1Click:Connect(function()
        if tg then a = not a; bt.Text = n..(a and ": ON" or ": OFF"); bt.BackgroundColor3 = a and Color3.fromRGB(0,150,0) or Color3.fromRGB(150,0,0); c(a)
        else bt.BackgroundColor3 = Color3.fromRGB(0,150,0); c(bt) end
    end)
end

_R.Stepped:Connect(function()
    local ch = _L.Character
    if not ch or not ch:FindFirstChild("HumanoidRootPart") then return end
    if _U.S then
        if not _U.T or not _U.T.Character then
            for _,v in pairs(_P:GetPlayers()) do if v ~= _L and v.Character then _U.T = v break end end
        end
        if _U.T and _U.T.Character:FindFirstChild("HumanoidRootPart") then
            ch.HumanoidRootPart.CFrame = _U.T.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
        end
    end
    if _U.G or _U.U then
        for _,p in pairs(ch:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false; if _U.G then p.Transparency = 1 end end end
    end
end)

_AB("GHOST", 15, function(s) _U.G = s end, true)
_AB("STICKY", 75, function(s) _U.S = s end, true)
_AB("UNDER", 135, function(bt)
    if _U.U then return end
    local r = _L.Character.HumanoidRootPart
    _U.U = true; local o = r.CFrame; r.CFrame = o * CFrame.new(0,-15,0)
    task.wait(3); r.CFrame = o; _U.U = false; bt.Text = "UNDER"; bt.BackgroundColor3 = Color3.fromRGB(150,0,0)
end, false)
]]

-- === THỰC THI MÃ HÓA TỔNG ===
local _0xExecute = loadstring(_0xLogic)
_0xExecute()

print(_0x52("72 85 78 71 32 70 79 82 83 65 75 69 78 32 86 49 32 65 67 84 73 86 65 84 69 68"))
