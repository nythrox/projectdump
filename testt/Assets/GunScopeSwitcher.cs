using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GunScopeSwitcher : MonoBehaviour
{
    public GameObject scopedGun;
    public GameObject normalGun;
    void Start()
    {
        if (scopedGun == null) {
            scopedGun = GetComponentInChildren<ScopedGun>().gameObject;
        }
        if (normalGun == null) {
            normalGun = GetComponentInChildren<NormalGun>().gameObject;
        }
    }

    void Update()
    {
        if (Input.GetAxis("Fire2") > 0)
        {
            normalGun.SetActive(false);
            scopedGun.SetActive(true);
        }
        else {
            normalGun.SetActive(true);
            scopedGun.SetActive(false);
        }

    }
}
