repeat task.wait() until game:GetService('Players').LocalPlayer

local ids = {
	4245576625,
	1808875272
}
local banbypass = {
	'а',
	'q',
	'x',
	'й',
	'こ'
}

game:GetService('Players').PlayerAdded:Connect(function(plr)
	for _i, _v in next, ids do
		if plr.UserId == _v and plr ~= game:GetService('Players').LocalPlayer then
			game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer('/w ' .. plr.Name .. ' | [CF] ' .. banbypass[math.random(1, #banbypass)],'All')
		end
	end
end)

for i, plr in next, game:GetService('Players'):GetPlayers() do
	for _i, _v in next, ids do
		if plr.UserId == _v and plr ~= game:GetService('Players').LocalPlayer then
			game:GetService('ReplicatedStorage'):WaitForChild('DefaultChatSystemChatEvents'):WaitForChild('SayMessageRequest'):FireServer('/w ' .. plr.Name .. ' | [CF] ' .. banbypass[math.random(1, #banbypass)],'All')
		end
	end
end
