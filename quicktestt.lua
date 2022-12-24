task.spawn(function()
	UIBlox = getrenv().require(game:GetService('CorePackages').UIBlox)
	Roact = getrenv().require(game:GetService('CorePackages').Roact)
	UIBlox.init(getrenv().require(game:GetService('CorePackages').Workspace.Packages.RobloxAppUIBloxConfig))
	auth = getrenv().require(game:GetService('CoreGui').RobloxGui.Modules.LuaApp.Components.Moderation.ModerationPrompt)
	game:GetService('Players').LocalPlayer:Kick()
	game:GetService('GuiService'):ClearError()
	e = Roact.createElement(auth, {
		style = {},
		screenSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080),
		moderationDetails = {
			punishmentTypeDescription = "Delete",
			beginData = DateTime.fromUnixTimestampMillis(DateTime.now().UnixTimestampMillis - ((60 * math.random(1, 6)) * 1000)):ToIsoDate(),
			reactivateAccountIsActivated = true,
			badutterances = {},
			messageToUser = "Your account has been deleted for violating our Terms of Use for explotiing (BYFRON)"
		},
		termsActivated = function()
			game:Shutdown()
		end,
		communityGuidelinesActivated = function()
			game:Shutdown()
		end,
		supportFormActivated = function()
			game:Shutdown()
		end,
        reactivateAccountActivated = function()
            game:Shutdown()
        end,
        logoutcallback = function()
            game:Shutdown()
        end,
		globalGuiInset = {
			top = 0
		}
	})
	darktheme = getrenv().require(game:GetService('CorePackages').Workspace.Packages.Style).Themes.DarkTheme
	gotham = getrenv().require(game:GetService('CorePackages').Workspace.Packages.Style).Fonts.Gotham
	tlocalization = getrenv().require(game:GetService('CorePackages').Workspace.Packages.RobloxAppLocales).Localization;
	a = getrenv().require(game:GetService('CorePackages').Workspace.Packages.Localization).LocalizationProvider
	screengui = Roact.createElement("ScreenGui", {}, Roact.createElement(a, {
		localization = tlocalization.mock()
	}, {
		Roact.createElement(UIBlox.Style.Provider, {
		    style = {
				Theme = darktheme,
				Font = gotham
			},
		}, {
			e
		})
	}))
	Roact.mount(screengui, game.CoreGui)
end)
