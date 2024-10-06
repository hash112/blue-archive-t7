require("ui.uieditor.actions_og")

function OpenWorkshop(InstanceRef, arg1, arg2)
    Engine.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=3302644889")
end

function OpenIOPWiki(InstanceRef, arg1, arg2)
    Engine.OpenURL("https://bluearchive.wiki/wiki/Main_Page")
end

function OpenZMChangeLobby(InstanceRef, arg1, arg2)
    Engine.SendClientScriptNotify( InstanceRef, "lobby_room_changed", "" )
    PlaySoundSetSound( InstanceRef, "action" )
end

function NavigateToLobby(f355_arg0, f355_arg1, f355_arg2, f355_arg3)
    if f355_arg1 == "ZMLobbyOnlineCustomGame" or f355_arg1 == "ZMLobbyOnline" or f355_arg1 == "ZMLobbyLANGame" then
        CoD.TFPCUtil.CheckForRecentUpdate()
        CoD.TFPCUtil.LoadTFOptions()
    end

    CoD.LobbyBase.NavigateToLobby(f355_arg0, f355_arg1, f355_arg2, f355_arg3)
end

function OpenZMChooseCharacterLoadout( f1122_arg0, f1122_arg1, f1122_arg2, f1122_arg3, f1122_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_ZOMBIES
	OpenZMChooseCharacterLoadout_Override( f1122_arg4, f1122_arg2, f1122_arg3 )
end

function OpenZMChooseCharacterLoadout_Override( f77_arg0, f77_arg1, f77_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f77_arg1, CoD.LobbyBase.LeaderActivity.MODIFYING_HERO )
	local f77_local0 = OpenOverlay( f77_arg0, "ChooseZMCharacterLoadout", f77_arg1, f77_arg2 )
	LUI.OverrideFunction_CallOriginalFirst( f77_local0, "close", function ()
		CoD.LobbyBase.ResetLeaderActivity( f77_arg1 )
	end )
	return f77_local0
end

function OpenZMChooseCharacterLoadout_InGame( f427_arg0, f427_arg1, f427_arg2 )
	OpenOverlay( f427_arg0, "ChooseZMCharacterLoadout_InGame", f427_arg2 )
end

function OpenTFOptions( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
	CoD.LobbyBase.OpenTFOptions( f206_arg0, f206_arg2 )
end

function OpenTFOptions_InGame( f427_arg0, f427_arg1, f427_arg2 )
	if not (Dvar.tfoption_tf_enabled:exists() and Dvar.tfoption_tf_enabled:get() == 0) then
		CoD.TFPCUtil.CheckForRecentUpdate()
		CoD.TFPCUtil.LoadTFOptions()
	end

	OpenOverlay(f427_arg0, "TFOptions", f427_arg2)
end

function OpenModInfo( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
	OpenOverlay(f206_arg0, "ModInfo", f206_arg2)
end

function OpenModInfo_InGame( f427_arg0, f427_arg1, f427_arg2 )
	OpenOverlay(f427_arg0, "ModInfo", f427_arg2)
end

function OpenZMInfoPopup( InstanceRef, arg1, arg2 )
    LuaUtils.UI_ShowInfoMessageDialog( InstanceRef, "BA_MODINFO_ZM_INFO_DESC", "BA_MODINFO_ZM_INFO_TITLE" )
end

function OpenCPInfoPopup( InstanceRef, arg1, arg2 )
    LuaUtils.UI_ShowInfoMessageDialog( InstanceRef, "BA_MODINFO_CP_INFO_DESC", "BA_MODINFO_CP_INFO_TITLE" )
end

function OpenMPInfoPopup( InstanceRef, arg1, arg2 )
    LuaUtils.UI_ShowInfoMessageDialog( InstanceRef, "BA_MODINFO_MP_INFO_DESC", "BA_MODINFO_MP_INFO_TITLE" )
end

function splitString(inputstr, sep)
    if sep == nil or inputstr == nil then
        return nil
    end
    local t={}
    for str in string.gmatch(tostring(inputstr,""), "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

function OpenConfigureCheatsPopup( f108_arg0, f108_arg1, f108_arg2, f108_arg3, f108_arg4 )
	CoD.OverlayUtility.AddSystemOverlay( "ConfigureCheatsPopup", {
		menuName = "SystemOverlay_Compact",
		title = "BA_MENU_CONFIGURE_CHEATS",
		description = "TF_CHEATS_DESC",
		listDatasource = function ()
			DataSources.ConfigureCheatsPopup_List = DataSourceHelpers.ListSetup( "ConfigureCheatsPopup_List", function ( f110_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_DISABLE_CAPS" )
						},
						properties = {
							action = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
                                Engine.SetDvar( "tfoption_cheats", 0 )
								GoBack( f30_arg4, f30_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_ENABLE_CAPS" )
						},
						properties = {
							action = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
                                Engine.SetDvar( "tfoption_cheats", 1 )
                                GoBack( f31_arg4, f31_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ConfigureCheatsPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
	} )
	CoD.OverlayUtility.CreateOverlay( f108_arg2, f108_arg0, "ConfigureCheatsPopup" )
end

function GetCharacterImageName(character)
	local prefix = "uie_t7_zm_hud_score_"
	local suffix = ""
    if character ~= nil then
        suffix = string.lower(character)
    end

	local fullname = prefix .. suffix
	
    return fullname
end

function ClearNotificationQueue( container )
	container.notificationInProgress = false
	Engine.SetModelValue( container.notificationQueueEmptyModel, true )
end

function AddSimpleNotification( controller, container, image, title, description )
	local localizedTitle = ""
	local localizedDescription = ""
	if title then
		localizedTitle = Engine.Localize( Engine.ToUpper(title) )
	end

	if description then
		localizedDescription = Engine.Localize( Engine.ToUpper(description) )
	end
    
	container:appendNotification( {
		clip = "TextandImageBGB",
		title = localizedTitle,
        description = localizedDescription,
		bgbImage = RegisterImage( image )
	} )
end

function AddCharacterNotification( controller, container, character )
	local ref = "BA_CHARACTER_"
    local title = Engine.Localize( Engine.ToUpper(ref .. character .. "_NAME") )
    -- local description = Engine.Localize( Engine.ToUpper(ref .. character .. "_DESC") )
    local description = ""
    
	container:appendNotification( {
		clip = "TextandImageBGB",
		title = title,
        description = description,
		bgbImage = RegisterImage( GetCharacterImageName( character ) )
	} )
end

function AddCheatsNotification( controller, container, model )
	container:appendNotification( {
		clip = "TextandImageBasic",
		title = Engine.Localize( "BA_CHEATS_ENABLED" ),
		description = ""
	} )
end

function SendCharacterSystemResponse( controller, character )
	Engine.SendMenuResponse(controller, "popup_leavegame", "CharacterSystem" .. "," .. character )
end

function SendChatNotifyResponse( controller, sending_Text )
	Engine.SendMenuResponse(controller, "popup_leavegame", "ChatNotify" .. "…" .. string.gsub(tostring(sending_Text), " ", "¨"))
end

function GetCharacterFromHeroesList(index, heroes)
	if not heroes or not index then
		return nil
	end

	for _, hero in ipairs( heroes ) do
		if hero.character and hero.bodyIndex and index == hero.bodyIndex then
			return hero.character
		end
	end

	return nil
end

function GetHeroesList_InGame( customizationMode )
    local heroes = {}
    table.insert(heroes, {
		character = "hare",
        displayName = "Hare",
        backgroundWithCharacter = "t7_menu_mp_hero_background_with_hare",
		frozenMomentRender = "t7_menu_choosespecialist_default_hare",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_hare",
    })

	table.insert(heroes, {
		character = "minori",
		displayName = "Minori",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_minori",
		frozenMomentRender = "t7_menu_choosespecialist_default_minori",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_minori",
	})

	table.insert(heroes, {
		character = "hina",
		displayName = "Hina",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_hina",
		frozenMomentRender = "t7_menu_choosespecialist_default_hina",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_hina",
	})

	table.insert(heroes, {
		character = "chise",
		displayName = "Chise",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_chise",
		frozenMomentRender = "t7_menu_choosespecialist_default_chise",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_chise",
	})

	
	table.insert(heroes, {
		character = "shiroko",
		displayName = "Shiroko",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_shiroko",
		frozenMomentRender = "t7_menu_choosespecialist_default_shiroko",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_shiroko",
	})
	
	table.insert(heroes, {
		character = "fubuki",
		displayName = "Fubuki",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_fubuki",
		frozenMomentRender = "t7_menu_choosespecialist_default_fubuki",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_fubuki",
	})
	
    table.insert(heroes, {
		character = "yuuka",
        displayName = "Yuuka",
        backgroundWithCharacter = "t7_menu_mp_hero_background_with_yuuka",
		frozenMomentRender = "t7_menu_choosespecialist_default_yuuka",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_yuuka",
    })
	
	table.insert(heroes, {
		character = "mari",
		displayName = "Mari",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_mari",
		frozenMomentRender = "t7_menu_choosespecialist_default_mari",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_mari",
	})

	table.insert(heroes, {
		character = "momoi",
		displayName = "Momoi",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_momoi",
		frozenMomentRender = "t7_menu_choosespecialist_default_momoi",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_momoi",
	})

	table.insert(heroes, {
		character = "aru",
		displayName = "Aru",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_aru",
		frozenMomentRender = "t7_menu_choosespecialist_default_aru",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_aru",
	})

	table.insert(heroes, {
		character = "shigure",
		displayName = "Shigure",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_shigure",
		frozenMomentRender = "t7_menu_choosespecialist_default_shigure",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_shigure",
	})

	table.insert(heroes, {
		character = "izuna",
		displayName = "Izuna",
		backgroundWithCharacter = "t7_menu_mp_hero_background_with_izuna",
		frozenMomentRender = "t7_menu_choosespecialist_default_izuna",
		disabled = false,
		gameImageOff = "uie_t7_zm_hud_score_izuna",
	})
	
	for i, hero in ipairs( heroes ) do
		local index = i - 1
		hero.bodyIndex = index
	end

	return heroes
end