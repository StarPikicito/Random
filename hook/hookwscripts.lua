lp = game:GetService("Players").LocalPlayer
local oldhook

oldhook = hookmetamethod(game, "__namecall", function(Self, ...)
	local method = getnamecallmethod()

	if Self == lp and (method == "Kick" or method == "kick") then
		return warn('no')
	end

	return oldhook(Self, ...)
end)

task.spawn(function()
  task.wait(60)
  if game.CoreGui:FindFirstChild("imgui") then
     for i,v in next, game.CoreGui.imgui:GetDescendants() do
        if v:IsA('TextLabel') and v.Text == "Saints Hub" then
           while true do end -- troll
        end
     end
  end
end)
