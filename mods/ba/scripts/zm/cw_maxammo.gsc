#using scripts\codescripts\struct;

#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\shared\flag_shared;

#namespace cw_max;

function init()
{
    thread watch_max_ammo();
}

function watch_max_ammo()
{
    while(1)
    {
        self endon("bled_out");
        self endon("spawned_player");
        self endon("disconnect");
        self waittill("zmb_max_ammo");
        foreach(weapon in self GetWeaponsList(1))
        {
            if(isdefined(weapon.clipsize) && weapon.clipsize > 0)
            {
                self SetWeaponAmmoClip(weapon, weapon.clipsize);
            }
        }
    }
}
