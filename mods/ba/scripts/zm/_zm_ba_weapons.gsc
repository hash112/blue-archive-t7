#using scripts\codescripts\struct;
#using scripts\shared\flag_shared;
#using scripts\shared\system_shared;
#using scripts\zm\_zm_weapons;
#using scripts\zm\_zm_spawner;
#using scripts\shared\callbacks_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace zm_ba_weapons;

REGISTER_SYSTEM_EX( "zm_ba_weapons", &__init__, &__main__, undefined )

//*****************************************************************************
// MAIN
//*****************************************************************************
function __init__()
{
	zm_weapons::load_weapon_spec_from_table( "gamedata/weapons/zm/zm_ba_weapons.csv", 1 );
	callback::on_spawned( &on_player_spawned );
}

function __main__()
{
}

function on_player_spawned()
{
    switch(level.script)
    {
      case "zm_tomb":
        weapon = getWeapon("t7_ba_pistol_mc96");
        level.default_solo_laststandpistol = getWeapon("t7_ba_pistol_mc96_upgraded");
        level.default_laststandpistol = getWeapon(weapon);
        foreach(player in GetPlayers())
        {
          player.start_weapon = (weapon);
          player TakeWeapon(getWeapon("pistol_c96"));
          player GiveWeapon(weapon);
          player SwitchToWeapon(weapon);
        }
        break;

      default:
        break;
    }
}

// function replace_wallbuys()
// {
//   wallreplace = [];
//   wallreplace["ar_marksman"] = "t7_ba_pistol_mc96_upgraded";
//   wallbuys = struct::get_array("weapon_upgrade", "targetname");
//   foreach (buy in wallbuys)
//   {
//       buy.zombie_weapon_upgrade = wallreplace[buy.zombie_weapon_upgrade];
//   }
// }

// function custom_weapons()
// {
//   level flag::wait_till("weapon_table_loaded");
//   switch(level.script)
//   {
//     case "zm_tomb":
//       level.start_weapon = getWeapon("t7_ba_pistol_mc96_upgraded");
//       break;

//     default:
//       return;
//       break;
//   }
// }