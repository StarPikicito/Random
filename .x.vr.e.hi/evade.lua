if workspace.Game.Effects:FindFirstChild("Tickets") then
        local tickets = workspace.Game.Effects.Tickets
       ticketevent = true
    end
    local notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
    function makeNotification(type,head,body)
        notifs.new(type, head, body,true,5)
    end
    changelog = game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/misc/clogevade.lua")
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
   repeat task.wait() until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
   repeat task.wait() until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()        
        local watermark = library:Watermark("dot.hub | Evade")
        getgenv().cframespeed = false
        getgenv().cfspeed = 0.1
        getgenv().breakbots = false
        getgenv().flly = false
        getgenv().besp = false
        if rconsoleprint then
          rconsoleprint(changelog)
        end
        function f(arg,v,value,stopped,x,walkspeed,checkondie,notps,xv,plrcount,looped,cframe)
            UIS = game:GetService("UserInputService")
            
            while getgenv().cframespeed do
                if getgenv().cfspeed ~= getgenv().cfspeed then break end
                repeat task.wait() until game.Players.LocalPlayer.Character
                You = game.Players.LocalPlayer.Character
                You:WaitForChild("HumanoidRootPart")
               if UIS:IsKeyDown(Enum.KeyCode.W) then
                   You.HumanoidRootPart.CFrame = You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,-getgenv().cfspeed)
               end;
               if UIS:IsKeyDown(Enum.KeyCode.A) then
                You.HumanoidRootPart.CFrame = You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(-getgenv().cfspeed,0,0)
               end;
               if UIS:IsKeyDown(Enum.KeyCode.S) then
                You.HumanoidRootPart.CFrame = You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0,0,getgenv().cfspeed)
               end;
               if UIS:IsKeyDown(Enum.KeyCode.D) then
                You.HumanoidRootPart.CFrame = You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(getgenv().cfspeed,0,0)
               end;
            task.wait()
            end
        end
        
        function bb()
            while getgenv().breakbots do
                n = math.random(1,10000000)
                z = math.random(50,8000)
                x = math.random(1,10000000)
                if not getgenv().breakbots then break end
                if game:GetService("Workspace").Game.Map.Parts:FindFirstChild("KillBricks") then game:GetService("Workspace").Game.Map.Parts.KillBricks:Destroy() end
                task.wait()
                game.Workspace.Game.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0,z,0)
            end
        end
        
        function annoydown()
        if annoydowned then
        makeNotification("warning",'dot.hub | ywserasdfas;fls', 'this will most likely break without Auto Respawn')
        end
        while task.wait() do
            if not getgenv().annoydowned then break end
            pcall(function()
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(250,250,250)
            for i,v in next, game:GetService("Workspace").Game.Players:GetDescendants() do
                if v.IsA(v,"NumberValue") and v.Name == "Downed" and not v.Parent.Parent.Parent:FindFirstChild("CarriedBy") and game.Players[v.Parent.Parent.Parent.Name].Settings.CanBeCarried.Value == true then
                    local holder = v.Parent.Parent.Parent.Name
                    local hold = workspace.Game.Players[holder]
                    scrip = require(game:GetService("ReplicatedStorage").ModuleStorage.Interact.Interactions.Revive.Revive)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(hold.HumanoidRootPart.Position)
                    task.wait(0.4)
                    game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3000,0)
                    task.wait(0.3)
                    game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder,true)
                    task.wait(1)
            end
            end
            end)
        end
        end
        
        local lib = library:Load{
            Name = "dot.hub",
            SizeX = 475,
            SizeY = 525,
            Theme = "Midnight",
            Extension = "extension", -- config file extension
            Folder = "dothub" -- config folder name
        }
        
        local main = lib:Tab("Main")
        local misc = lib:Tab("Misc")
        
        local sec1 = main:Section{
            Name = "",
            Side = "Left"
        }
        
        local unload = misc:Section{
            Name = "",
            Side = "Left"
        }
        
        unload:Button{
            Name = 'Unload',
            Callback = function()
                library:Unload()
            end
        }
        
        
        local sec2 = main:Section{
            Name = "",
            Side = "Right"
        }
        
        sec1:Toggle{
            Name = "Auto Respawn",
            Flag = "ara",
            Default = false,
            Callback  = function(ares)
                getgenv().aresp = ares
                while task.wait(1) and aresp do
                    if not getgenv().aresp then break end
                    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local stats = char:WaitForChild("StatChanges",3)
                    if stats == nil then return end 
                    if stats:FindFirstChild("Speed") and stats:FindFirstChild("Speed"):FindFirstChild("Downed") then
                        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                    end
                end
            end
        }
        
        sec1:Toggle{
            Name = "Annoy downed",
            Callback  = function(down)
               getgenv().annoydowned = down
               annoydown()
            end
        }

        sec1:Toggle{
            Name = "Fly",
            Callback = function(flyy)
               getgenv().flly = flyy
               if getgenv().flly then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/bypassedfly.lua"))()
            else
             for i,v in next, workspace:GetChildren() do
                if v.IsA(v,"BasePart") and v.Name ~= "Terrain" then
                   v:Destroy()
                end
             end
            end
            end
        }
        
        sec1:Toggle{
            Name = "Walkspeed Toggle",
            Callback = function(c)
               getgenv().cframespeed = c
               f()     
            end
        }
        
        sec1:Toggle{
            Name = "Autofarm Wins",
            Callback = function(bbb)
                getgenv().breakbots = bbb
                bb()
            end
        }

        if ticketevent then
           sec1:Toggle{
            Name = 'Ticket Farm',
            Callback = function(TF)
                getgenv().tf = TF
                if tf then
                   makeNotification("warning",'dot.hub | Farm','Please click on "Auto Respawn" in the GUI to avoid breaking')
                   part = Instance.new("Part",workspace)
                   part.Anchored = true
                   part.CFrame = CFrame.new(100,496,100)
                end
                while task.wait(0.5) and getgenv().tf do
                    if not tf then break end
                    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local tickets = workspace.Game.Effects.Tickets
                    local hrp = char:WaitForChild("HumanoidRootPart",3)
                    if hrp == nil then return end
                    hrp.CFrame = CFrame.new(100,500,100)
                    for i,v in next, tickets:GetDescendants() do
                       if v.IsA(v,"BasePart") and v.Name == 'HumanoidRootPart' then
                          hrp.CFrame = CFrame.new(v.Position)
                       end
                    end
                end
            end
           }
        end
        
        sec1:Seperator("Buttons")
        
        sec1:Button{
            Name = "Anti Down [GodMode]",
            Callback = function()
                pcall(function()
                    for i,v in next, game:GetDescendants() do
                        if v.IsA(v,"BindableEvent") and string.lower(v.Name) == 'force' then
                            v:Destroy()
                        end
                        end
                        game.DescendantAdded:Connect(function(v)
                            task.wait()
                            if v.IsA(v,"BindableEvent") and string.lower(v.Name) == 'force' then
                                v:Destroy()
                            end
                        end)
                    end)
            end
        }
        
        sec2:Slider{
            Text = "Walkspeed Boost: [value]",
            Min = 0.1,
            Max = 2,
            Float = 0.1,
            Flag = "walkspeed",
            Callback = function(speed)
                getgenv().cfspeed = speed
            end
        }
        
sec1:Button{
    Name = 'Remove Map Barriers',
    Callback = function()
        if workspace.Game.Map:FindFirstChild("InvisParts") then
        workspace.Game.Map.InvisParts:Destroy()
        end
    end
}

sec1:Button{
    Name = 'Teleport to objective',
    Callback = function()
       hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
       if workspace.Game.Map.Parts:FindFirstChild("Objectives") then
       for i,v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
          if v.IsA(v,"Model") then
             hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
          end
        end
       end
    end
}

sec1:Button{
    Name = "Freddy",
    Callback = function()
        sound = Instance.new("Sound",game:GetService("Workspace"))
        sound.SoundId = "rbxassetid://1847795501"
        sound.PlayOnRemove = true
        sound:Destroy()
    end
}
