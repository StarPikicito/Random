if isfile and writefile and typeof(isfile) == 'function' and typeof(writefile) == 'function' then
	if not isfile('PromptedDiscordDH.txt') then
		writefile('PromptedDiscordDH.txt', game:GetService('HttpService'):JSONEncode('hi'))
		local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
		Module.Prompt({
			invite = "https://discord.gg/fNeggqVMZs",
			name = "CF-Community",
		})
	end
end


if game.PlaceId == 2597632885 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/snoday.lua"))()
  elseif game.PlaceId == 6839171747 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/doors.lua"))()
 elseif game.GameId == 3647333358 or game.PlaceId == 9872472334 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/evade.lua"))()
  elseif game.GameId == 323675642 then
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/.x.vr.e.hi/fe2.lua"))()
end
