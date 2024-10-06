#namespace zm_clientBox;

function init()
{
	/*
		Including Weapons into the Mystery Box

		Every weapon requires its own line, this will add that specific weapon into the Mystery Box.
		This script is used to show the weapons in the box, since the visual spinning of the box is handeled 
		separtely from the actual weapon it gives you.

		Function: registerBoxWeapon( name, model, dualWield );
		name: The name of the weapon (same as the /give <weapon> name)
		model: The name of the world model of the weapon to be shown in the box (same as the world model in the weapon file)
		dualWield: <true/false> weather or not the weapon is dual wield
		Example: registerBoxWeapon( "ak47", "wpn_ak47_world", false );
	*/

	ResetZombieBoxWeapons(); // Don't touch, this clears the current box
	registerBoxWeapon( "ray_gun", false );
	registerBoxWeapon( "tesla_gun", false );
	registerBoxWeapon("t5_mp5k", false)
	// registerBoxWeapon( "t5_aug", false );
	// registerBoxWeapon( "t5_china_lake", false );
	// registerBoxWeapon( "t5_commando", false );
	// registerBoxWeapon( "t5_cz75", false );
	// registerBoxWeapon( "t5_cz75_rdw", true );
	// registerBoxWeapon( "t5_dragunov", false );
	// registerBoxWeapon( "t5_famas", false );
	// registerBoxWeapon( "t5_fal", false );
	// registerBoxWeapon( "t5_g11", false );
	// registerBoxWeapon( "t5_galil", false );
	// registerBoxWeapon( "t5_hk21", false );
	// registerBoxWeapon( "t5_hs10", false );
	// registerBoxWeapon( "t5_l96a1", false );
	// registerBoxWeapon( "t5_m72", false );
	// registerBoxWeapon( "t5_python", false );
	// registerBoxWeapon( "t5_rpk", false );	
	// registerBoxWeapon( "t5_spas12", false );
	// registerBoxWeapon( "t5_spectre", false );	
}

function registerBoxWeapon( name, dualWield )
{
	if( !isDefined( name ))
		return;

	isDualWield = false;

	if(isDefined( dualWield ))
		isDualWield = dualWield;

	weapon = GetWeapon( name );
	model = GetWeaponWorldModel( weapon );
	
	AddZombieBoxWeapon(weapon, model, isDualWield);
}