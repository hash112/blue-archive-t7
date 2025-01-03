#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\util_shared;

#using scripts\ba\character_util;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#namespace zm_character;

function init_character_table()
{
	if ( !isdefined(level.charactertable) )
	{
		level.charactertable = [];
	}

	level.charactertable["zm"] = [];
	level.charactertable["zm"]["hare"] = create_hare();
	level.charactertable["zm"]["minori"] = create_minori();
	level.charactertable["zm"]["hina"] = create_hina();
	level.charactertable["zm"]["chise"] = create_chise();
	level.charactertable["zm"]["shiroko"] = create_shiroko();
	level.charactertable["zm"]["fubuki"] = create_fubuki();
	level.charactertable["zm"]["yuuka"] = create_yuuka();
	level.charactertable["zm"]["mari"] = create_mari();
	level.charactertable["zm"]["momoi"] = create_momoi();
	level.charactertable["zm"]["shigure"] = create_shigure();
	level.charactertable["zm"]["aru"] = create_aru();
	level.charactertable["zm"]["izuna"] = create_izuna();
	level.charactertable["zm"]["yuzu"] = create_yuzu();
	level.charactertable["zm"]["hoshino"] = create_hoshino();

	level.charactertable["zm_moon"] = [];
	level.charactertable["zm_moon"]["momoi"] = create_momoi();
	level.charactertable["zm_moon"]["shigure"] = create_shigure();
	level.charactertable["zm_moon"]["aru"] = create_aru();
	level.charactertable["zm_moon"]["izuna"] = create_izuna();
}

function create_hare()
{
	obj = SpawnStruct();
	obj.bodytype = 0;
	obj.bodystyle = 0;
	obj.id = "hare";
	obj.keywords = array("_dempsey_");
	obj.name = "Hare";
	return obj;
}

function create_minori()
{
	obj = SpawnStruct();
	obj.bodytype = 1;
	obj.bodystyle = 0;
	obj.id = "minori";
	obj.keywords = array("_nikolai_");
	obj.name = "Minori";
	return obj;
}

function create_hina()
{
	obj = SpawnStruct();
	obj.bodytype = 2;
	obj.bodystyle = 0;
	obj.id = "hina";
	obj.keywords = array("_richtofen_");
	obj.name = "Hina";
	return obj;
}

function create_chise()
{
	obj = SpawnStruct();
	obj.bodytype = 3;
	obj.bodystyle = 0;
	obj.id = "chise";
	obj.keywords = array("_takeo_");
	obj.name = "Chise";
	return obj;
}

function create_momoi()
{
	obj = SpawnStruct();
	obj.bodytype = 4;
	obj.bodystyle = 0;
	obj.id = "momoi";
	obj.keywords = array("waw_dempsey");
	obj.name = "Momoi";
	return obj;
}

function create_shiroko()
{
	obj = SpawnStruct();
	obj.bodytype = 5;
	obj.bodystyle = 0;
	obj.id = "shiroko";
	obj.keywords = array("_boxer_");
	obj.name = "Shiroko";
	return obj;
}

function create_fubuki()
{
	obj = SpawnStruct();
	obj.bodytype = 6;
	obj.bodystyle = 0;
	obj.id = "fubuki";
	obj.keywords = array("_detective_");
	obj.name = "Fubuki";
	return obj;
}

function create_yuuka()
{
	obj = SpawnStruct();
	obj.bodytype = 7;
	obj.bodystyle = 0;
	obj.id = "yuuka";
	obj.keywords = array("_femme_");
	obj.name = "Yuuka";
	return obj;
}

function create_mari()
{
	obj = SpawnStruct();
	obj.bodytype = 8;
	obj.bodystyle = 0;
	obj.id = "mari";
	obj.keywords = array("_magician_");
	obj.name = "Mari";
	return obj;
}

function create_shigure()
{
	obj = SpawnStruct();
	obj.bodytype = 9;
	obj.bodystyle = 0;
	obj.id = "shigure";
	obj.keywords = array("nikolai_waw");
	obj.name = "Shigure";
	return obj;
}

function create_aru()
{
	obj = SpawnStruct();
	obj.bodytype = 10;
	obj.bodystyle = 0;
	obj.id = "aru";
	obj.keywords = array("richtofen_waw");
	obj.name = "Aru";
	return obj;
}

function create_izuna()
{
	obj = SpawnStruct();
	obj.bodytype = 11;
	obj.bodystyle = 0;
	obj.id = "izuna";
	obj.keywords = array("waw_takeo");
	obj.name = "Izuna";
	return obj;
}

function create_yuzu()
{
	obj = SpawnStruct();
	obj.bodytype = 12;
	obj.bodystyle = 0;
	obj.id = "yuzu";
	obj.keywords = array();
	obj.name = "Yuzu";
	return obj;
}

function create_hoshino()
{
	obj = SpawnStruct();
	obj.bodytype = 13;
	obj.bodystyle = 0;
	obj.id = "hoshino";
	obj.keywords = array();
	obj.name = "Hoshino";
	return obj;
}
