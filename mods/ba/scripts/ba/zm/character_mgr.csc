#using scripts\codescripts\struct;
#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\util_shared;
#using scripts\shared\system_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace character_mgr;

REGISTER_SYSTEM_EX( "character_mgr", &__init__, &__main__, undefined )

function private __init__()
{
    util::register_system( "ba_character_icon", &set_character_icon );
    init_character_icon_table();
}

function private __main__()
{

}

function init_character_icon_table()
{
	level.character_icon_table = [];
	level.character_icon_table["none"] = undefined;
	level.character_icon_table["hare"] = "uie_t7_zm_hud_score_hare";
    level.character_icon_table["minori"] = "uie_t7_zm_hud_score_minori";
	level.character_icon_table["hina"] = "uie_t7_zm_hud_score_hina";
	level.character_icon_table["chise"] = "uie_t7_zm_hud_score_chise";
	level.character_icon_table["shiroko"] = "uie_t7_zm_hud_score_shiroko";
    level.character_icon_table["fubuki"] = "uie_t7_zm_hud_score_fubuki";
	level.character_icon_table["yuuka"] = "uie_t7_zm_hud_score_yuuka";
    level.character_icon_table["mari"] = "uie_t7_zm_hud_score_mari";
	level.character_icon_table["momoi"] = "uie_t7_zm_hud_score_momoi";
	level.character_icon_table["shigure"] = "uie_t7_zm_hud_score_shigure";
	level.character_icon_table["aru"] = "uie_t7_zm_hud_score_aru";
    level.character_icon_table["izuna"] = "uie_t7_zm_hud_score_izuna";

}

function init_playerlist_icon_uimodel( n_local_client )
{
    controllerModel = GetUIModelForController( n_local_client );
	self.playerlist_icon_uimodel = [];
    // for ( i = 0; i < GetLocalPlayers().size; i++ )
    // {
    //     self.playerlist_icon_uimodel[i] = CreateUIModel( controllerModel, "PlayerList." + i + ".zombiePlayerIcon" );
    // }
    self.playerlist_icon_uimodel[0] = CreateUIModel( controllerModel, "PlayerList." + 0 + ".zombiePlayerIcon" );
}

function set_character_icon(clientnum, state, oldstate)
{
	self notify("character_icon_reset");
	self endon("character_icon_reset");
	self endon("entityshutdown");
    self endon("death");
    self endon("bled_out");
	self endon("death_or_disconnect");

    if ( !isdefined(self.playerlist_icon_uimodel) )
    {
        init_playerlist_icon_uimodel(clientnum);
    }

    // todo: add support for clientnum != 0
    if ( clientnum != 0 )
    {
        return;
    }

    if ( !isdefined(state) || state == "none" || !isdefined(level.character_icon_table[state]) )
    {
        return;
    }

    while(true)
    {
        set_character_icon_for_uimodel(clientnum, state);
        WAIT_CLIENT_FRAME;
    }
}

function set_character_icon_for_uimodel( target, index )
{
    model = get_icon_uimodel(target);
    if ( !isdefined(model) )
    {
        return;
    }

    image_name = level.character_icon_table[index];
    if ( isdefined(image_name) )
    {
        SetUIModelValue( model, image_name );
    }
}

function get_icon_uimodel( target )
{
    if ( !isdefined(self.playerlist_icon_uimodel) || target >= self.playerlist_icon_uimodel.size )
    {
        return undefined;
    }

    return self.playerlist_icon_uimodel[target];
}