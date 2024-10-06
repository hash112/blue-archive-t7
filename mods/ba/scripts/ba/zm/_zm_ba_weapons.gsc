#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\shared\system_shared;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_spawner;
#using scripts\shared\callbacks_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace zm_ba_weapons;

// REGISTER_SYSTEM_EX( "zm_ba_weapons", &__init__, &__main__, undefined )

//*****************************************************************************
// MAIN
//*****************************************************************************
function __init__()
{
	// callback::on_spawned( &on_player_spawned );
}

function __main__()
{

}

function main()
{
  self endon("disconnect");
  self endon("bled_out");
  level flag::wait_till("initial_blackscreen_passed");
  zm_weapons::load_weapon_spec_from_table("gamedata/weapons/zm/zm_ba_weapons.csv", 1);
}