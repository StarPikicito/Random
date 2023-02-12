if not rconsoleprint or not hookmetamethod then
	repeat task.wait() until game:IsLoaded()
	game:GetService('Players').LocalPlayer:Kick('Bad executor')
end

if not newcclosure then
	rconsoleprint('PLEASE GET A BETTER EXECUTOR WHICH SUPPORTS newcclosure' .. '\n')
end

local closure = syn_newcclosure or newcclosure

local function blueRPRINT(text)
	rconsoleprint('@@BLUE@@')
	rconsoleprint(text)
end

local function LMagentaPrint(text)
	rconsoleprint('@@LIGHT_MAGENTA@@')
	rconsoleprint(text)
end

local function GreenPrint(text)
	rconsoleprint('@@GREEN@@')
	rconsoleprint(text)
end

--// VoiceChat spoof

local oldhOwOok
oldhOwOok = hookmetamethod(game, "__namecall", closure(function(self, ...)
	if getnamecallmethod() == "IsVoiceEnabledForUserIdAsync" then
		return true
	end
	return oldhOwOok(self, ...)
end))

--// PreloadBypass

local tbl = {}
local CoreGui = game:GetService('CoreGui')

for i, v in pairs(CoreGui.GetDescendants(CoreGui)) do
	if v.IsA(v, "ImageLabel") and v.Image:find('rbxasset://') then
		table.insert(tbl, v.Image)
	end
end

local hello;
hello = hookfunction(game:GetService("ContentProvider").PreloadAsync, closure(function(self, ...)
	local Args = {
		...
	}
	if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) then
		LMagentaPrint("szze's utilities | Blocked PreloadAsync detection" .. ' | Method used: __index \n')
		Args[1] = tbl
		return hello(self, unpack(Args))
	end
	return hello(self, ...)
end))

local function football(ncm)
	if ncm == "PreloadAsync" or ncm == "preloadAsync" then
		return true
	end
	return false
end

local __namecall;

__namecall = hookmetamethod(game, "__namecall", closure(function(Self, ...)
	local Args = {
		...
	}
	local NamecallMethod = getnamecallmethod()
	if not checkcaller() and type(Args[1]) == "table" and table.find(Args[1], CoreGui) and Self == game.GetService(game, "ContentProvider") and football(NamecallMethod) then
		LMagentaPrint("szze's utilities | Blocked PreloadAsync detection from " .. getcallingscript():GetFullName() .. ' | Method used: __namecall \n')
		Args[1] = tbl
		return __namecall(Self, unpack(Args))
	end
	return __namecall(Self, ...)
end))

--// Local GamePass bypasser

local owold
owold = hookmetamethod(game, '__namecall', closure(function(...)
	local method = getnamecallmethod()
	if method == 'UserOwnsGamePassAsync' and not checkcaller() then
		return true
	end
	return owold(...)
end))

--// Script

repeat
	task.wait()
until game:GetService('Players').LocalPlayer
local lplr = game:GetService('Players').LocalPlayer
local isAFK = false

blueRPRINT(
    [[ 
    _____   ______  ______  ______   _    _____     _    _   _______   _____   _        _____   _______   _____   ______    _____ 
    / ____| |___  / |___  / |  ____| ( )  / ____|   | |  | | |__   __| |_   _| | |      |_   _| |__   __| |_   _| |  ____|  / ____|
   | (___      / /     / /  | |__    |/  | (___     | |  | |    | |      | |   | |        | |      | |      | |   | |__    | (___  
    \___ \    / /     / /   |  __|        \___ \    | |  | |    | |      | |   | |        | |      | |      | |   |  __|    \___ \ 
    ____) |  / /__   / /__  | |____       ____) |   | |__| |    | |     _| |_  | |____   _| |_     | |     _| |_  | |____   ____) |
   |_____/  /_____| /_____| |______|     |_____/     \____/     |_|    |_____| |______| |_____|    |_|    |_____| |______| |_____/ 
                                                                                                                                   
                                                            Made by szze#6220
                                                                   V1
                                                    
    ]] .. '\n'
)

--// AntiKick

local OldNameCall 
OldNameCall = hookmetamethod(game, "__namecall", closure(function(...)
	local Self, Args = (...), ({
		select(2, ...)
	})
	local kscript, kscriptz
	if string.lower(getnamecallmethod()) == "kick" and Self == lplr and not checkcaller() then
		kscriptz = getcallingscript()
		if kscriptz then
			kscript = kscriptz:GetFullName()
		else
			kscript = "Couldn't fetch"
		end
		LMagentaPrint("szze's utilities | Blocked kick from " .. tostring(kscript) .. ' | Method used: __namecall \n')
		return wait(9e9)
	end
	return OldNameCall(...)
end))

GreenPrint('Client Anti-Kick loaded \n')
GreenPrint('VoiceChat spoofer loaded \n')
GreenPrint('PreloadBypass loaded \n')
GreenPrint('Local GamePass bypasser loaded \n')

--// AntiAFK
local connections = getconnections or get_signal_cons
if connections then
	for i, v in next, getconnections(lplr.Idled) do
	   v:Disable()
	end
end

lplr.Idled:Connect(function(time)
	if time > 1200 and not isAFK then
		LMagentaPrint('AntiAFK bypassed the kick \n')
		isAFK = true
	end
end)

GreenPrint('AntiAFK loaded \n')
