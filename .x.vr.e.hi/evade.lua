local library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
local notifs =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true)
)()
local changelog = game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/misc/clogevade.lua")

if rconsoleprint then
    rconsoleprint(changelog)
end

-- [[ LOADING ]]

game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
repeat
    task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name)
repeat
    task.wait()
until workspace.Game.Players:FindFirstChild(game.Players.LocalPlayer.Name):FindFirstChild("HumanoidRootPart")

-- [[ VARS ]]

local eventTaunts = {
    "CursedFlashlight",
    "WerewolfHowl",
    "Tombstone",
    "Baghead",
    "DemonHorns",
    "Candlehead",
    "ImpaledHead",
    "WitchHat",
    "DualBoneSwords",
    "LavaLamp",
    "SpiderInfestation",
    "PumpItUp",
    "VampireOutfit",
    "OminousDemise",
    "BlueHallowedFace",
    "GreenHallowedFace",
    "OrangeHallowedFace",
    "GhostCatcher",
    "DemonWings",
    "CandleLamp",
    "FungalOvergrowth",
    "Reanimated",
    "ToxicInferno",
    "Monoculi",
    "WretchedWings",
    "PhantomBlades",
    "AmethystStaff",
    "GhostAbduction",
    "Telespell",
    "Thriller",
    "BluefirePortal",
    "HellfirePortal",
    "SeekingEye",
    "EyeCorruption",
    "Necromonicon",
    "FrightFunk",
    "BlueUFOAbduction",
    "PinkUFOAbduction",
    "Cauldronhead",
    "HellishGrip",
    "HauntedIredescence",
    "CobwebTrap",
    "MechanicalScythe",
    "DragonSkull",
    "GhostFriend",
    "SpilledCauldron",
    "WardingLantern",
    "RockinStride",
    "Rockin'Stride",
    "DarkTendrils",
    "AlchemistBelt",
    "Frankenstein",
    "ElectrifyingGuitar",
    "BatVision",
    "BananaSuit",
    "EyeIllusions",
    "BloodMoon"
}

getgenv().respawning = false
getgenv().flly = false
getgenv().cframespeed = false
getgenv().cfspeed = 0
getgenv().autobuy = false

-- [[ FUNCTIONS ]]

function f()
    UIS = game:GetService("UserInputService")

    while getgenv().cframespeed do
        if getgenv().cfspeed ~= getgenv().cfspeed then
            break
        end
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
        You = game.Players.LocalPlayer.Character
        You:WaitForChild("HumanoidRootPart")
        if UIS:IsKeyDown(Enum.KeyCode.W) then
            You.HumanoidRootPart.CFrame =
                You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, -getgenv().cfspeed)
        end
        if UIS:IsKeyDown(Enum.KeyCode.A) then
            You.HumanoidRootPart.CFrame =
                You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(-getgenv().cfspeed, 0, 0)
        end
        if UIS:IsKeyDown(Enum.KeyCode.S) then
            You.HumanoidRootPart.CFrame =
                You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(0, 0, getgenv().cfspeed)
        end
        if UIS:IsKeyDown(Enum.KeyCode.D) then
            You.HumanoidRootPart.CFrame =
                You:WaitForChild("HumanoidRootPart").CFrame * CFrame.new(getgenv().cfspeed, 0, 0)
        end
        task.wait()
    end
end

function bb()
    while getgenv().breakbots do
        n = math.random(1, 10000000)
        z = math.random(50, 8000)
        x = math.random(1, 10000000)
        if not getgenv().breakbots then
            break
        end
        if game:GetService("Workspace").Game.Map.Parts:FindFirstChild("KillBricks") then
            game:GetService("Workspace").Game.Map.Parts.KillBricks:Destroy()
        end
        task.wait()
        game.Workspace.Game.Players:WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("HumanoidRootPart").CFrame =
            CFrame.new(0, z, 0)
    end
end

function annoydown()
    if annoydowned then
        makeNotification("warning", "dot.hub | ywserasdfas;fls", "this will most likely break without Auto Respawn")
    end
    while task.wait() do
        if not getgenv().annoydowned then
            break
        end
        pcall(
            function()
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(250, 250, 250)
                for i, v in next, game:GetService("Workspace").Game.Players:GetDescendants() do
                    if
                        v.IsA(v, "NumberValue") and v.Name == "Downed" and
                            not v.Parent.Parent.Parent:FindFirstChild("CarriedBy") and
                            game.Players[v.Parent.Parent.Parent.Name].Settings.CanBeCarried.Value == true
                     then
                        local holder = v.Parent.Parent.Parent.Name
                        local hold = workspace.Game.Players[holder]
                        scrip =
                            require(
                            game:GetService("ReplicatedStorage").ModuleStorage.Interact.Interactions.Revive.Revive
                        )
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                            CFrame.new(hold.HumanoidRootPart.Position)
                        task.wait(0.3)
                        game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder)
                        task.wait(0.3)
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 3000, 0)
                        task.wait(0.2)
                        game:GetService("ReplicatedStorage").Events.Revive.CarryPlayer:FireServer(holder, true)
                        task.wait(1)
                    end
                end
            end
        )
    end
end

function makeNotification(type, head, body)
    notifs.new(type, head, body, true, 5)
end

-- [[ MISC ]]

if workspace.Game.Effects:FindFirstChild("Tickets") then
    local tickets = workspace.Game.Effects.Tickets
    ticketevent = true
end

-- [[ GUI ]]

local lib =
    library:CreateWindow(
    {
        Name = "dot.hub | Evade | New UI 🎉",
        Themeable = {
            Info = "new ui ok"
        }
    }
)

local main =
    lib:CreateTab(
    {
        Name = "Main"
    }
)

local mesc =
    lib:CreateTab(
    {
        Name = "Misc"
    }
)

local misc =
    mesc:CreateSection(
    {
        Name = "Misc",
        Side = "Left"
    }
)

local player =
    main:CreateSection(
    {
        Name = "Player",
        Side = "Left"
    }
)

local settings =
    main:CreateSection(
    {
        Name = "Settings",
        Side = "Right"
    }
)

local map =
    main:CreateSection(
    {
        Name = "Map",
        Side = "Right"
    }
)

local troll =
    main:CreateSection(
    {
        Name = "Trolling",
        Side = "Right"
    }
)

local farm =
    main:CreateSection(
    {
        Name = "AutoFarms",
        Side = "Left"
    }
)

-- [[ MAIN ]]

player:AddToggle(
    {
        Name = "Auto Respawn",
        Flag = "ar",
        Callback = function(x)
            getgenv().respawning = x
            while task.wait(1) and respawning do
                if not getgenv().respawning then
                    break
                end
                local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                local stats = char:WaitForChild("StatChanges", 3)
                if stats == nil then
                    return
                end
                if stats:FindFirstChild("Speed") and stats:FindFirstChild("Speed"):FindFirstChild("Downed") then
                    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                end
            end
        end
    }
)

player:AddToggle(
    {
        Name = "Fly",
        Callback = function(flyy)
            getgenv().flly = flyy
            if getgenv().flly then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/bypassedfly.lua"))()
            else
                for i, v in next, workspace:GetChildren() do
                    if v.IsA(v, "BasePart") and v.Name ~= "Terrain" then
                        v:Destroy()
                    end
                end
            end
        end
    }
)

player:AddToggle(
    {
        Name = "Walkspeed Toggle",
        Callback = function(c)
            getgenv().cframespeed = c
            f()
        end
    }
)

player:AddButton(
    {
        Name = "Anti Down [God Mode]",
        Callback = function()
            pcall(
                function()
                    for i, v in next, workspace.Game.Players:GetDescendants() do
                        if v.IsA(v, "BindableEvent") and string.lower(v.Name) == "force" then
                            v:Destroy()
                        end
                    end
                    workspace.Game.Players.DescendantAdded:Connect(
                        function(v)
                            task.wait()
                            if v.IsA(v, "BindableEvent") and string.lower(v.Name) == "force" then
                                v:Destroy()
                            end
                        end
                    )
                end
            )
        end
    }
)

settings:AddSlider(
    {
        Name = "Walkspeed Boost",
        Value = 0,
        Min = 0,
        Max = 2,
        Callback = function(ws)
            getgenv().cfspeed = ws
        end
    }
)

settings:AddToggle(
    {
        Name = "AutoBuy event items",
        Callback = function(autob)
            getgenv().autobuy = autob
            if getgenv().autobuy then
                makeNotification("Info", "dot.hub | AutoBuy", "This buys event items if you got tickets.")
            end
            while task.wait(60) and autobuy do
                if not getgenv().autobuy then
                    break
                end
                for i, v in next, eventTaunts do
                    task.wait()
                    game:GetService("ReplicatedStorage").Events.UI.Purchase:InvokeServer("Event", v)
                end
            end
        end
    }
)

map:AddButton(
    {
        Name = "Remove Barriers",
        Callback = function()
            if workspace.Game.Map:FindFirstChild("InvisParts") then
                workspace.Game.Map.InvisParts:Destroy()
            end
        end
    }
)

map:AddButton(
    {
        Name = "Teleport to objective",
        Callback = function()
            hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            if workspace.Game.Map.Parts:FindFirstChild("Objectives") then
                for i, v in next, workspace.Game.Map.Parts.Objectives:GetChildren() do
                    if v.IsA(v, "Model") then
                        hrp.CFrame = CFrame.new(v:FindFirstChildWhichIsA("BasePart").Position)
                    end
                end
            end
        end
    }
)

map:AddButton({
   Name = 'Round end time',
   Callback = function()
      makeNotification('Info','dot.hub | Map',game.Players.LocalPlayer.PlayerGui:WaitForChild("HUD").Center.Vote.Info.Read.Timer.Text)
   end
})

if ticketevent then
    farm:AddToggle(
        {
            Name = "Ticket Farm",
            Callback = function(TF)
                getgenv().tf = TF
                if tf then
                    makeNotification(
                        "warning",
                        "dot.hub | Farm",
                        'Please click on "Auto Respawn" in the GUI to avoid breaking'
                    )
                    part = Instance.new("Part", workspace)
                    part.Anchored = true
                    part.CFrame = CFrame.new(100, 496, 100)
                end
                while task.wait(0.5) and getgenv().tf do
                    if not tf then
                        break
                    end
                    local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local tickets = workspace.Game.Effects.Tickets
                    local hrp = char:WaitForChild("HumanoidRootPart", 3)
                    if hrp == nil then
                        return
                    end
                    hrp.CFrame = CFrame.new(100, 500, 100)
                    for i, v in next, tickets:GetDescendants() do
                        if v.IsA(v, "BasePart") and v.Name == "HumanoidRootPart" then
                            hrp.CFrame = CFrame.new(v.Position)
                        end
                    end
                end
            end
        }
    )
end

farm:AddToggle(
    {
        Name = "Autofarm Wins",
        Callback = function(bbb)
            getgenv().breakbots = bbb
            bb()
        end
    }
)

troll:AddToggle(
    {
        Name = "Annoy downed",
        Callback = function(down)
            getgenv().annoydowned = down
            annoydown()
        end
    }
)

misc:AddButton(
    {
        Name = "Freddy",
        Callback = function()
            sound = Instance.new("Sound", game:GetService("Workspace"))
            sound.SoundId = "rbxassetid://1847795501"
            sound.Volume = 5
            sound.PlayOnRemove = true
            sound:Destroy()
        end
    }
)
