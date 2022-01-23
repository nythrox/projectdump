using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunInfoReference : MonoBehaviour
{
    public GunInfo gunInfo;
    void Awake()
    {
        gunInfo.ammo = gunInfo.initialAmmo;
        gunInfo.currentMagazineAmmo = gunInfo.magazineCapacity;
    }
    public void FillAmmo()
    {
        gunInfo.FillAmmo();
    }
}
