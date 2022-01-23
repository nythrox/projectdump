using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NormalGun : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject bulletSpawnPoint;
    public GameObject bullet;
    public GunInfo gunInfo;

    private float nextTimeToFire = 0f;
    public void Reload()
    {
        gunInfo.Reload();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetAxis("Reload") > 0)
        {
            Reload();
        }
        if (Input.GetAxis("Fire1") > 0)
        {
            Fire();
        }
    }

    public void Fire()
    {
        if (gunInfo.currentMagazineAmmo > 0 && Time.time >= nextTimeToFire)
        {
            var b = GameObject.Instantiate(bullet);
            b.transform.position = bulletSpawnPoint.transform.position;
            b.transform.rotation = bulletSpawnPoint.transform.rotation;
            gunInfo.currentMagazineAmmo -= 1;
            nextTimeToFire = Time.time + 1f/gunInfo.fireRate;
        }
    }
}
