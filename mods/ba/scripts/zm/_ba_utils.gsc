#using scripts\codescripts\struct;

#using scripts\shared\array_shared;

#using scripts\zm\_zm_weapons;

#namespace ba_utils;

function is_custom()
{
	switch(level.script)
	{
		case "zm_zod":
			trainbuy = getentarray("train_buyable_weapon", "script_noteworthy");
			foreach(buy in trainbuy)
			{
				buy.zombie_weapon_upgrade = "s2_type100";
				buy.target = "wm_s2_type100";
			}
			return false;
			break;

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

function is_stock_wpn(wpn)
{
	boxwpn = array(
		"pistol_fullauto",
		"pistol_energy",
		"smg_standard",
		"smg_longrange",
		"smg_capacity",
		"smg_versatile",
		"smg_fastfire",
		"smg_capacity",
		"smg_burst",
		"smg_sten",
		"smg_ak74u",
		"ar_standard",
		"ar_cqb",
		"ar_damage",
		"ar_longburst",
		"ar_marksman",
		"ar_accurate",
		"ar_famas",
		"ar_peacekeeper",
		"ar_m14",
		"ar_m16",
		"shotgun_pump",
		"shotgun_fullauto",
		"shotgun_semiauto",
		"shotgun_precision",
		"shotgun_energy",
		"lmg_light",
		"lmg_cqb",
		"lmg_slowfire",
		"lmg_heavy",
		"lmg_rpk",
		"sniper_fastsemi",
		"sniper_fastbolt",
		"sniper_powerbolt",
		"launcher_standard",
		"launcher_multi"
	);

	if(IsInArray(boxwpn, wpn))
	{
		return true;
	}

	return false;
}

function change_wallbuys()
{
    zm_weapons::load_weapon_spec_from_table( "gamedata/weapons/zm/zm_ba_weapons.csv", 1 );
	if(is_custom())
	{
		return;
	}
	wallreplace = [];
	wallreplace["pistol_burst"] = "iw8_renetti"; // Saya
	wallreplace["pistol_fullauto"] = "t5_skorpion"; // Tsubaki
	wallreplace["ar_longburst"] = "iw4_famas"; // Asuna
	wallreplace["ar_marksman"] = "iw8_kar98k_irons"; // Iori
	wallreplace["ar_cqb"] = "iw4_tar21"; // Azusa
	wallreplace["ar_accurate"] = "t6_m27"; // Chihiro
	wallreplace["ar_standard"] = "t5_ak47"; // Minori
	wallreplace["ar_stg44"] = "ar_stg44"; // Junko
	wallreplace["smg_standard"] = "t5_mp5k"; // Airi
	wallreplace["smg_fastfire"] = "t6_skorpion_evo"; // Atsuko
	wallreplace["smg_versatile"] = "iw4_mini_uzi"; // Natsu
	wallreplace["smg_burst"] = "t6_mp7"; // Fuuka
	wallreplace["smg_sten"] = "s2_type100"; // Izuna
	wallreplace["smg_thompson"] = "smg_thompson"; // Saten
	wallreplace["smg_mp40_1940"] = "smg_mp40_1940";
	wallreplace["shotgun_pump"] = "t6_rem870mcs"; // Michiru
	wallreplace["shotgun_precision"] = "iw4_model1887"; // Mine
	wallreplace["lmg_light"] = "iw5_m60e4"; // Koyuki
	wallreplace["sniper_fastbolt"] = "s2_mosin"; // Miyu

	wallbuys = struct::get_array("weapon_upgrade", "targetname");
    foreach (buy in wallbuys)
    {
        buy.zombie_weapon_upgrade = wallreplace[buy.zombie_weapon_upgrade];
		// util::spawn_model("iw3_g3_chalk", buy.origin+(0,0,0), buy.angles);
    }
}
