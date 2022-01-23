using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScopedGun : MonoBehaviour
{
    // Start is called before the first frame update
    public GameObject bulletSpawnPoint;
    public GunInfo gunInfo;
    public ParticleSystem muzzleFlash;
    public GameObject impactEffect;
    public float ImpactForce = 5;

    private float nextTimeToFire = 0f;
    // Update is called once per frame
    void Update()
    {
        if (Input.GetAxis("Reload") > 0)
        {
            gunInfo.Reload();
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
            // instanciateBullet();
            RaycastHit hit;
            Physics.Raycast(transform.position, transform.forward, out hit, 100f);
            muzzleFlash.Play();
            GameObject impactEffectInstance = Instantiate(impactEffect, hit.point, Quaternion.LookRotation(hit.normal));
            Destroy(impactEffectInstance, 2f);
            Rigidbody hrb = hit.rigidbody;
            if (hrb != null) {
                hrb.AddForce(-hit.normal * ImpactForce);
            }
            gunInfo.currentMagazineAmmo -= 1;
            nextTimeToFire = Time.time + 1f / gunInfo.fireRate;
        }

    }
}
