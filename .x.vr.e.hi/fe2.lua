--[[

FE2 script is not done yet

]]

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local key = -game:GetService("ReplicatedStorage").Remote.ReqPasskey:InvokeServer()
local subs = {'You knew that 1xblindx1 was cheating?','We automatically bypass client anticheat.','This GUI was inspired by FloodGUI V3'}
local ltitles = {'Drowning Crazyblox..','never enough','zxcursed'}
local part = Instance.new('Part',workspace)
part.Anchored = true

if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('LocalScript') then
game.Players.LocalPlayer.Character:FindFirstChild("LocalScript"):Destroy()
game:GetService("StarterPlayer").StarterCharacterScripts:FindFirstChild("LocalScript"):Destroy()
end
game.ReplicatedStorage.Remote.ReqCharVars.OnClientInvoke = function()
warn("Anticheat bypassed.")
wait(9e9)
return {}
end

local lib = Rayfield:CreateWindow({
	Name = "dot.hub | FE2",
	LoadingTitle = ltitles[math.random(1,#ltitles)],
	LoadingSubtitle = subs[math.random(1,#subs)],
})

getgenv().godmode = nil
getgenv().waterwalk = nil
getgenv().muteemotes = nil
getgenv().walkspeed = 20
getgenv().jumppower = 50

local infoTab = lib:CreateTab("Info")
local mainTab = lib:CreateTab("Map")
local lpTab = lib:CreateTab("LocalPlayer")
local miscTab = lib:CreateTab("Misc")

infoTab:CreateLabel('[⚠️/x] - where x is chance of getting anticheated')
infoTab:CreateLabel('[✅] - Tested and safe')
infoTab:CreateLabel('Functions are tweaked to Bypass The AntiCheat. You Shouldnt Worry That Much.')

function getButton()
    for i,v in next, workspace.Multiplayer:WaitForChild('Map'):GetDescendants() do
        if v.IsA(v,'TouchTransmitter') and not v.Parent:FindFirstChild('pressed') and not string.match(string.lower(v.Parent.Name),'rescue') and not string.match(string.lower(v.Parent.Name),'page') and v.Parent.Position ~= Vector3.zero then
           return v.Parent
        end
     end
end

function Time(targetpos)
   local tme = (targetpos - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude / game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed
   return tme
end

workspace.Multiplayer.DescendantAdded:Connect(function(t)
      if string.match(string.lower(t.Name),'water') and t.IsA(t,'BasePart') and getgenv().waterwalk then
         t.CanCollide = true
      end
end)
function tp(cframe, speed)
    local plr = game:GetService("Players").LocalPlayer.Character
    local tween = game:GetService("TweenService")
    
    tween:Create(plr.HumanoidRootPart,TweenInfo.new(speed,Enum.EasingStyle.Linear),{CFrame = cframe}):Play()
end 

function handler()
   char = game.Players.LocalPlayer.Character
   char:WaitForChild('Humanoid')
   char.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()
    if getgenv().godmode then
       char.Humanoid.Health = 100
    end
   end)
end

handler()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    handler()
    task.wait(5)
    game.Players.LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = getgenv().walkspeed
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = getgenv().jumppower
end)

function float()
   task.spawn(function()
      if gettingbuttons then
      fpart = Instance.new('Part',workspace)
      fpart.Name = 'floatpart'
      fpart.Anchored = true
      while task.wait() and getgenv().gettingbuttons do
         fpart.CFrame = CFrame.new(game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').Position - Vector3.new(0,3,0))
      end
   end
   end)
end

mainTab:CreateToggle({
	Name = "AutoFarm [✅]",
    CurrentValue = false,
	Callback = function(getbtns)
		getgenv().gettingbuttons = getbtns
      task.spawn(function()
         float()
      end)
        while task.wait() and getgenv().gettingbuttons do
         map = workspace.Multiplayer:WaitForChild('Map')
         char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
         for i,v in next, map:GetDescendants() do
            if v.Name == 'ExitRegion' and not map:FindFirstChild('completed') then
               xor = Instance.new('IntValue',map)
               xor.Name = 'completed'
               tp(v.CFrame,Time(v.Position))
               task.wait(Time(v.Position) + 1)
               game.Players.LocalPlayer.Character.Humanoid:ChangeState('Dead')
               task.wait(3)
               repeat task.wait() until workspace:WaitForChild(game.Players.LocalPlayer.Name):FindFirstChild('HumanoidRootPart')
               game:GetService("ReplicatedStorage").Remote.AddedWaiting:FireServer(key)
              end
           end
        for i,v in next, char:GetDescendants() do
          if v.IsA(v,'BasePart') then v.CanCollide = false end
        end
        char:WaitForChild('HumanoidRootPart')
        hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        button = getButton()
        if button then
        tp(button.CFrame,Time(button.Position))
        task.wait(Time(button.Position))
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        task.wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        psd = Instance.new('IntValue',button)
        psd.Name = 'pressed'
        end
    end
	end,
})

function funcmuteemotes()
   task.spawn(function()
      while task.wait() and getgenv().muteemotes do
       if getgenv().muteemotes == false then break end
         for i,v in next, workspace:GetDescendants() do
            if v.IsA(v,'Sound') then
               v:Stop()
            end
         end
      end
   end)
end

function _autoget()
   task.spawn(function()
   while task.wait(3) and getgenv().misc do
      if not getgenv().misc then break end
      map = workspace.Multiplayer:WaitForChild('Map')
      for i,v in next, map:GetDescendants() do
         if string.match(string.lower(v.Name),'lost') and v.IsA(v,'BasePart') then
            v.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
         elseif (string.match(string.lower(v.Name),'rescue')) and v:FindFirstChild('Contact') then
            v.Contact.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
      end
      end
   end
end)
end

mainTab:CreateToggle({
    Name = 'AutoTP to ExitRegion [⚠️/very low]',
    CurrentValue = false,
    Callback = function(tper)
        getgenv().tptoexit = tper
        while task.wait(2) and getgenv().tptoexit do
         if not getgenv().tptoexit then break end
           map = workspace.Multiplayer:WaitForChild('Map')
           for i,v in next, map:GetDescendants() do
              if v.Name == 'ExitRegion' then
               tp(v.CFrame,4.5)
               task.wait(4.5)
            end
           end
        end
    end,
})

mainTab:CreateToggle({
    Name = 'Auto Get Lost Pages/Escapees [✅]',
    CurrentValue = false,
    Callback = function(gr)
        getgenv().misc = gr
        _autoget()
    end,
})

mainTab:CreateToggle({
   Name = 'Water Walk [✅]',
   CurrentValue = false,
   Callback = function(wwalk)
      getgenv().waterwalk = wwalk
         for i,t in next, workspace.Multiplayer.Map:GetDescendants() do
            if string.match(string.lower(t.Name),'water') and t.IsA(t,'BasePart') and getgenv().waterwalk then
               t.CanCollide = not waterwalk
            end
      end
   end
})

mainTab:CreateToggle({
   Name = 'Auto Safespot [✅]',
   CurrentValue = false,
   Callback = function(Value)
      getgenv().safespot = Value
      task.spawn(function()
          while task.wait(5) and safespot do
            if not safespot then break end
            game.Players.LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(part.Position + Vector3.new(0,5,0))
          end
      end)
   end,
})


lpTab:CreateToggle({
    Name = 'GodMode [✅]',
    CurrentValue = false,
    Callback = function(gm)
        getgenv().godmode = gm
    end,
})

lpTab:CreateSlider({
	Name = "WalkSpeed [✅]",
	Range = {20, 28},
	Increment = 1,
	CurrentValue = 20,
	Callback = function(ws)
       getgenv().walkspeed = ws
       game.Players.LocalPlayer.Character:WaitForChild('Humanoid').WalkSpeed = walkspeed
	end,
})

lpTab:CreateSlider({
	Name = "JumpPower [✅]",
	Range = {50, 80},
	Increment = 1,
	CurrentValue = 50,
	Callback = function(jp)
       getgenv().jumppower = jp
       game.Players.LocalPlayer.Character:WaitForChild('Humanoid').JumpPower = jumppower
	end,
})

miscTab:CreateToggle({
   Name = 'Mute Emote Sounds [FE] [✅]',
   CurrentValue = false,
   Callback = function(gm)
       getgenv().muteemotes = gm
       funcmuteemotes()
   end,
})

miscTab:CreateToggle({
   Name = 'Lag Server [50 coins required/noob buddie] [✅]',
   CurrentValue = false,
   Callback = function(lag)
      getgenv().laggin = lag
      if laggin then
      for i = 1, 190, 1 do
         game:GetService("ReplicatedStorage").Remote.ConfirmItem:FireServer(key, 40)
      end
   else
      game.Players.LocalPlayer.Character.Humanoid.Health = 0 
   end
   end,
})
