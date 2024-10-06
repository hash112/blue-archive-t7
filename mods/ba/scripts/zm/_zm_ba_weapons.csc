#using scripts\codescripts\struct;
#using scripts\shared\system_shared;
#using scripts\zm\_zm_weapons;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace zm_ba_weapons;

REGISTER_SYSTEM_EX( "zm_ba_weapons", &__init__, &__main__, undefined )

function __init__()
{
	zm_weapons::load_weapon_spec_from_table( "gamedata/weapons/zm/zm_ba_weapons.csv", 1 );
	// replace_wallbuys();
	// luiLoad( "ui.uieditor.widgets.hud.zm_ammowidgetfactory_mod.zmammo_propfactory" );
}

function __main__()
{
}

// function replace_wallbuys()
// {
// 	wallreplace = [];
// 	wallreplace["ar_marksman"] = "t7_ba_pistol_mc96_upgraded";
// 	wallbuys = struct::get_array("weapon_upgrade", "targetname");
// 	foreach (buy in wallbuys)
// 	{
// 		buy.zombie_weapon_upgrade = wallreplace[buy.zombie_weapon_upgrade];
// 	}
// }