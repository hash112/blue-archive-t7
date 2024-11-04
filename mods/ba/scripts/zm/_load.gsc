// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\codescripts\struct;
#using scripts\shared\_oob;
#using scripts\shared\abilities\_ability_player;
#using scripts\shared\ai\zombie_utility;
#using scripts\shared\archetype_shared\archetype_shared;
#using scripts\shared\audio_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\demo_shared;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\flagsys_shared;
#using scripts\shared\fx_shared;
#using scripts\shared\hud_message_shared;
#using scripts\shared\load_shared;
#using scripts\shared\lui_shared;
#using scripts\shared\music_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\serverfaceanim_shared;
#using scripts\shared\system_shared;
#using scripts\shared\turret_shared;
#using scripts\shared\util_shared;
#using scripts\shared\vehicle_shared;
#using scripts\zm\_art;
#using scripts\zm\_callbacks;
#using scripts\zm\_destructible;
#using scripts\zm\_util;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_behavior;
#using scripts\zm\_zm_blockers;
#using scripts\zm\_zm_bot;
#using scripts\zm\_zm_clone;
#using scripts\zm\_zm_devgui;
#using scripts\zm\_zm_magicbox;
#using scripts\zm\_zm_playerhealth;
#using scripts\zm\_zm_power;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_stats;
#using scripts\zm\_zm_traps;
#using scripts\zm\_zm_unitrigger;
#using scripts\zm\_zm_zonemgr;
#using scripts\zm\gametypes\_clientids;
#using scripts\zm\gametypes\_scoreboard;
#using scripts\zm\gametypes\_serversettings;
#using scripts\zm\gametypes\_shellshock;
#using scripts\zm\gametypes\_spawnlogic;
#using scripts\zm\gametypes\_spectating;
#using scripts\zm\gametypes\_weaponobjects;

#using scripts\zm\_zm_weapons;

#namespace load;

/*
	Name: main
	Namespace: load
	Checksum: 0x85A46EC4
	Offset: 0x7C0
	Size: 0x11C
	Parameters: 0
	Flags: Linked
*/
function main()
{
	/#
		/#
			assert(isdefined(level.first_frame), "");
		#/
	#/
	if(GetDvarInt("tfoption_ba_weapons", 1))
	{
		level thread change_wallbuys();
	}
	zm::init();
	level._loadstarted = 1;
	register_clientfields();
	level.aitriggerspawnflags = getaitriggerflags();
	level.vehicletriggerspawnflags = getvehicletriggerflags();
	level thread start_intro_screen_zm();
	setup_traversals();
	footsteps();
	system::wait_till("all");
	level thread art_review();
	level flagsys::set("load_main_complete");
}

/*
	Name: footsteps
	Namespace: load
	Checksum: 0x4240B549
	Offset: 0x8E8
	Size: 0x23C
	Parameters: 0
	Flags: Linked
*/
function footsteps()
{
	if(isdefined(level.fx_exclude_footsteps) && level.fx_exclude_footsteps)
	{
		return;
	}
	zombie_utility::setfootstepeffect("asphalt", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("brick", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("carpet", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("cloth", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("concrete", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("dirt", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setfootstepeffect("foliage", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setfootstepeffect("gravel", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("grass", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("metal", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("mud", "_t6/bio/player/fx_footstep_mud");
	zombie_utility::setfootstepeffect("paper", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("plaster", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("rock", "_t6/bio/player/fx_footstep_dust");
	zombie_utility::setfootstepeffect("sand", "_t6/bio/player/fx_footstep_sand");
	zombie_utility::setfootstepeffect("water", "_t6/bio/player/fx_footstep_water");
	zombie_utility::setfootstepeffect("wood", "_t6/bio/player/fx_footstep_dust");
}

/*
	Name: setup_traversals
	Namespace: load
	Checksum: 0x99EC1590
	Offset: 0xB30
	Size: 0x4
	Parameters: 0
	Flags: Linked
*/
function setup_traversals()
{
}

/*
	Name: start_intro_screen_zm
	Namespace: load
	Checksum: 0xBE8A0915
	Offset: 0xB40
	Size: 0x94
	Parameters: 0
	Flags: Linked
*/
function start_intro_screen_zm()
{
	players = getplayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] lui::screen_fade_out(0, undefined);
		players[i] freezecontrols(1);
	}
	wait(1);
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0xE474FA
	Offset: 0xBE0
	Size: 0xC4
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int");
	clientfield::register("clientuimodel", "zmhud.swordEnergy", 1, 7, "float");
	clientfield::register("clientuimodel", "zmhud.swordState", 1, 4, "int");
	clientfield::register("clientuimodel", "zmhud.swordChargeUpdate", 1, 1, "counter");
}

function is_custom()
{
	
	switch(level.script)
	{
		case "zm_zod":
		case "zm_factory":
		case "zm_castle":
		case "zm_island":
		case "zm_stalingrad":
		case "zm_genesis":
		case "zm_prototype":
		case "zm_asylum":
		case "zm_sumpf":
		case "zm_theater":
		case "zm_cosmodrome":
		case "zm_temple":
		case "zm_moon":
		case "zm_tomb":
			return false;
			break;

		default:
			return true;
			break;
	}
}

function change_wallbuys()
{
    zm_weapons::load_weapon_spec_from_table( "gamedata/weapons/zm/zm_ba_weapons.csv", 1 );
	if(is_custom())
	{
		return;
	}
	wallreplace = [];
	wallreplace["pistol_burst"] = "pistol_burst"; // Mina           
	wallreplace["pistol_fullauto"] = "t5_skorpion"; // Tsubaki 
	wallreplace["ar_longburst"] = "ar_longburst"; // Asuna         
	wallreplace["ar_marksman"] = "iw3_g3"; 	// Momoi                
	wallreplace["ar_cqb"] = "ar_cqb"; // Azusa                     
	wallreplace["ar_accurate"] = "t6_m27"; // Chihiro              
	wallreplace["ar_standard"] = "t5_ak47"; // Minori              
	wallreplace["ar_stg44"] = "ar_stg44"; // Junko                 
	wallreplace["smg_standard"] = "t5_mp5k"; // Airi               
	wallreplace["smg_fastfire"] = "t6_skorpion_evo"; // Atsuko     
	wallreplace["smg_versatile"] = "iw4_mini_uzi"; // Natsu        
	wallreplace["smg_burst"] = "smg_burst"; // Fuuka               
	wallreplace["smg_sten"] = "smg_sten"; // Izuna
	wallreplace["smg_thompson"] = "smg_thompson"; // Saten         
	wallreplace["smg_mp40_1940"] = "smg_mp40_1940";                
	wallreplace["shotgun_pump"] = "t6_rem870mcs"; // Michiru
	wallreplace["shotgun_precision"] = "shotgun_precision"; // Mine
	wallreplace["lmg_light"] = "iw5_m60e4"; // Koyuki
	wallreplace["sniper_fastbolt"] = "sniper_fastbolt"; // Miyu

	wallbuys = struct::get_array("weapon_upgrade", "targetname");
    foreach (buy in wallbuys)
    {
        buy.zombie_weapon_upgrade = wallreplace[buy.zombie_weapon_upgrade];
		// util::spawn_model("iw3_g3_chalk", buy.origin+(0,0,0), buy.angles);
    }

}