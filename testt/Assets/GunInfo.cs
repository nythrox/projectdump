using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[CreateAssetMenu]
public class GunInfo : ScriptableObject
{
    public GameObject bullet;
    public int maxAmmo;
    public int magazineCapacity = 8;
    public float reloadDuration = 1; //duration to reload magazine
    public float fireRate = 15f; //seconds between bullets
    public int initialAmmo = 100;
    [ReadOnly]
    public int ammo;
    [ReadOnly]
    public int currentMagazineAmmo;

    public void Reload()
    {
        var leftoverMagazineSlots = magazineCapacity - currentMagazineAmmo;
        if (ammo > leftoverMagazineSlots)
        {
            ammo -= leftoverMagazineSlots;
            currentMagazineAmmo += leftoverMagazineSlots;
        }
        else
        {
            currentMagazineAmmo += ammo;
            ammo = 0;

        }
    }
    public void AddAmmo(int value)
    {
        ammo += value;
    }   
    public void FillAmmo()
    {
        ammo = maxAmmo;
    }
}
