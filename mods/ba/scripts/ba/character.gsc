#using scripts\ba\character_util;

#namespace character;

function init_character_table()
{
	if ( !isdefined(level.charactertable) )
	{
		level.charactertable = [];
	}

	level.charactertable["generic"] = [];
	level.charactertable["generic"]["hare"] = &swap_to_hare;
	level.charactertable["generic"]["minori"] = &swap_to_minori;
	level.charactertable["generic"]["hina"] = &swap_to_hina;
	level.charactertable["generic"]["chise"] = &swap_to_chise;
	level.charactertable["generic"]["shiroko"] = &swap_to_shiroko;
	level.charactertable["generic"]["fubuki"] = &swap_to_fubuki;
	level.charactertable["generic"]["yuuka"] = &swap_to_yuuka;
	level.charactertable["generic"]["mari"] = &swap_to_mari;
	level.charactertable["generic"]["momoi"] = &swap_to_momoi;
	level.charactertable["generic"]["shigure"] = &swap_to_shigure;
	level.charactertable["generic"]["aru"] = &swap_to_aru;
	level.charactertable["generic"]["izuna"] = &swap_to_izuna;

	// level.charactertable["char"] = [];

	// level.charactertable["generic_mob"] = [];
	
	// level.charactertable["generic_char"] = [];
	
}

// generic
function swap_to_hare()
{
	self detachall();
	self setmodel("t7_ba_hare_fb");
	self thread character_util::set_character_name();
}

function swap_to_aru()
{
	self detachall();
	self setmodel("t7_ba_aru_fb");
	self thread character_util::set_character_name();
}

function swap_to_shigure()
{
	self detachall();
	self setmodel("t7_ba_shigure_fb");
	self thread character_util::set_character_name();
}

function swap_to_chise()
{
	self detachall();
	self setmodel("t7_ba_chise_fb");
	self thread character_util::set_character_name();
}

function swap_to_hina()
{
	self detachall();
	self setmodel("t7_ba_hina_fb");
	self thread character_util::set_character_name();
}

function swap_to_momoi()
{
	self detachall();
	self setmodel("t7_ba_momoi_fb");
	self thread character_util::set_character_name();
}

function swap_to_minori()
{
	self detachall();
	self setmodel("t7_ba_shigure_fb");
	self thread character_util::set_character_name();
}

function swap_to_yuuka()
{
	self detachall();
	self setmodel("t7_ba_yuuka_fb");
	self thread character_util::set_character_name();
}

function swap_to_shiroko()
{
	self detachall();
	self setmodel("t7_ba_shiroko_fb");
	self thread character_util::set_character_name();
}

function swap_to_mari()
{
	self detachall();
	self setmodel("t7_ba_mari_fb");
	self thread character_util::set_character_name();
}

function swap_to_fubuki()
{
	self detachall();
	self setmodel("t7_ba_fubuki_fb");
	self thread character_util::set_character_name();
}

function swap_to_izuna()
{
	self detachall();
	self setmodel("t7_ba_izuna_fb");
	self thread character_util::set_character_name();
}
