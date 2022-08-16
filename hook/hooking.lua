--[[
uwu??
]]
protec = protect_function and protect or newcclosure
game:GetService("Players").Changed:Connect(function()
game:GetService("Players").Name = "Players"
end)
local oldhook

oldhook = hookmetamethod(game, "__namecall", protec(function(Self, ...)
	local method = getnamecallmethod()

	if not checkcaller() and Self == game.Players.LocalPlayer and (method == "Kick" or method == "kick") then
		return wait(9e9)
	end

	return oldhook(Self, ...)
end))
