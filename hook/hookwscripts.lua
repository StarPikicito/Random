lp = game:GetService("Players").LocalPlayer
local oldhook

oldhook = hookmetamethod(game, "__namecall", function(Self, ...)
	local method = getnamecallmethod()

	if Self == lp and (method == "Kick" or method == "kick") then
		return warn('no')
	end

	return oldhook(Self, ...)
end)
