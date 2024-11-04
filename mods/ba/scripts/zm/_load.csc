// Decompiled by Serious. Credits to Scoba for his original tool, Cerberus, which I heavily upgraded to support remaining features, other games, and other platforms.
#using scripts\codescripts\struct;
#using scripts\shared\_oob;
#using scripts\shared\abilities\_ability_player;
#using scripts\shared\archetype_shared\archetype_shared;
#using scripts\shared\audio_shared;
#using scripts\shared\clientfaceanim_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flagsys_shared;
#using scripts\shared\footsteps_shared;
#using scripts\shared\fx_shared;
#using scripts\shared\load_shared;
#using scripts\shared\music_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\system_shared;
#using scripts\shared\turret_shared;
#using scripts\shared\util_shared;
#using scripts\shared\vehicle_shared;
#using scripts\zm\_ambient;
#using scripts\zm\_callbacks;
#using scripts\zm\_destructible;
#using scripts\zm\_global_fx;
#using scripts\zm\_radiant_live_update;
#using scripts\zm\_sticky_grenade;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_magicbox;
#using scripts\zm\_zm_playerhealth;
#using scripts\zm\_zm_score;
#using scripts\zm\_zm_traps;
#using scripts\zm\craftables\_zm_craftables;
#using scripts\zm\gametypes\_weaponobjects;

#using scripts\zm\_zm_weapons;

#namespace load;

/*
	Name: levelnotifyhandler
	Namespace: load
	Checksum: 0xEEA521CA
	Offset: 0x4F0
	Size: 0x3A
	Parameters: 3
	Flags: Linked
*/
function levelnotifyhandler(clientnum, state, oldstate)
{
	if(state != "")
	{
		level notify(state, clientnum);
	}
}

/*
	Name: warnmissilelocking
	Namespace: load
	Checksum: 0x8AA5A2BB
	Offset: 0x538
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilelocking(localclientnum, set)
{
}

/*
	Name: warnmissilelocked
	Namespace: load
	Checksum: 0x45712ABB
	Offset: 0x558
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilelocked(localclientnum, set)
{
}

/*
	Name: warnmissilefired
	Namespace: load
	Checksum: 0x836BFE92
	Offset: 0x578
	Size: 0x14
	Parameters: 2
	Flags: None
*/
function warnmissilefired(localclientnum, set)
{
}

/*
	Name: main
	Namespace: load
	Checksum: 0x12999F87
	Offset: 0x598
	Size: 0x14C
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
	level thread server_time();
	level thread util::init_utility();
	util::register_system("levelNotify", &levelnotifyhandler);
	register_clientfields();
	level.createfx_disable_fx = getdvarint("disable_fx") == 1;
	if(isdefined(level._uses_sticky_grenades) && level._uses_sticky_grenades)
	{
		level thread _sticky_grenade::main();
	}
	system::wait_till("all");
	level thread art_review();
	level flagsys::set("load_main_complete");
	
}

/*
	Name: server_time
	Namespace: load
	Checksum: 0x6D016E91
	Offset: 0x6F0
	Size: 0x30
	Parameters: 0
	Flags: Linked
*/
function server_time()
{
	for(;;)
	{
		level.servertime = getservertime(0);
		wait(0.01);
	}
}

/*
	Name: register_clientfields
	Namespace: load
	Checksum: 0xD69FF95C
	Offset: 0x728
	Size: 0xF4
	Parameters: 0
	Flags: Linked
*/
function register_clientfields()
{
	clientfield::register("allplayers", "zmbLastStand", 1, 1, "int", &zm::laststand, 0, 1);
	clientfield::register("clientuimodel", "zmhud.swordEnergy", 1, 7, "float", undefined, 0, 0);
	clientfield::register("clientuimodel", "zmhud.swordState", 1, 4, "int", undefined, 0, 0);
	clientfield::register("clientuimodel", "zmhud.swordChargeUpdate", 1, 1, "counter", undefined, 0, 0);
}

function is_custom()
{
	map_name = ToLower(GetDvarString("mapname"));
	switch(map_name)
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
	wallreplace["ar_marksman"] = "iw3_g3"; // Momoi
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
    }
}
