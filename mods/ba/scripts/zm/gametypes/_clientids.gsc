#using scripts\codescripts\struct;

#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\shared\flag_shared;

#using scripts\zm\cw_maxammo;
#using scripts\zm\zm_counter;
#using scripts\zm\bo4_carpenter;
#using scripts\zm\perkplus;
#using scripts\zm\_zm_ba_weapons;

#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_score;

#insert scripts\shared\shared.gsh;

#namespace clientids;

REGISTER_SYSTEM( "clientids", &__init__, undefined )
	
function __init__()
{
	callback::on_start_gametype( &init );
	callback::on_connect( &on_player_connect );
    callback::on_spawned( &on_player_spawn );
}	

function init()
{
	// this is now handled in code ( not lan )
	// see s_nextScriptClientId 
	level.clientid = 0;
}

function on_player_connect()
{
	self.clientid = matchRecordNewPlayer( self );
	if ( !isdefined( self.clientid ) || self.clientid == -1 )
	{
		self.clientid = level.clientid;
		level.clientid++;	// Is this safe? What if a server runs for a long time and many people join/leave
	}

}

function on_player_spawn()
{
    level flag::wait_till("initial_blackscreen_passed");
	level.perk_purchase_limit = 50;
	cw_max::init();
	zm_counter::init();
	bo4_carpenter::init();
}