s, e = pcall(function()
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
        if rconsoleprint then
          rconsoleprint(changelog)
        end
        makeNotification("warning","dot.hub | Loading",'made this so no error')
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
        
        game.Players.LocalPlayer.Character.HumanoidRootPart.Changed:Connect(function(prop)
            task.wait()
            if getgenv().aresp then
            if game.Players.LocalPlayer.Character:WaitForChild("StatChanges"):WaitForChild("Speed"):FindFirstChild("Downed") then
            game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
            end
            end
        end)
        
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
        
        sec1:Seperator("Buttons")
        
        sec1:Button{
            Name = "Anti Down",
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

end)
if not s then
    vcb = {"Error appeared in the script","A Wild Error appeared","Error joined. Stay awhile and listen.",'Welcome, Error. We hope you brought pizza.','Error just arrived. Seems OP - please nerf.','Error has spawned in the script','Error comes in. Leave your weapons by the door.','Error joined. You must construct additional pylons.','Error just showed up. Hold my beer.','Error hopped into the script. Kangaroo!!','Error joined your party.'}
    makeNotification("error","dot.hub | Error Handler",e)
end
