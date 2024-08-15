#using scripts\codescripts\struct;
#using scripts\shared\system_shared;
#using scripts\zm\_zm_weapons;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace ba_t7_weapons;

REGISTER_SYSTEM_EX( "zm_t7_weapons", &__init__, &__main__, undefined )

function __init__()
{
	zm_weapons::load_weapon_spec_from_table( "gamedata/weapons/zm/zm_ba_weapons.csv", 1 );
	// luiLoad( "ui.uieditor.widgets.hud.zm_ammowidgetfactory_mod.zmammo_propfactory" );
}

function __main__()
{
}