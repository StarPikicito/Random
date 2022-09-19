--[[
uwu??
]]
protec = protect_function and protect or newcclosure
lp = game:GetService("Players").LocalPlayer
local oldhook

oldhook = hookmetamethod(game, "__namecall", protec(function(Self, ...)
	local method = getnamecallmethod()

	if not checkcaller() and Self == lp and (method == "Kick" or method == "kick") then
		return wait(9e9)
	end

	return oldhook(Self, ...)
end))
