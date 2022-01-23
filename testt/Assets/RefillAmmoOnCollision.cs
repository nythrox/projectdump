using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RefillAmmoOnCollision : MonoBehaviour
{
    public GameEvent refillAmmoEvent;
    void OnCollisionEnter(Collision c)
    {
        // if (c.gameObject.tag == "Hero") {
        //     var gunInfo = c.gameObject.GetComponentInChildren<GunInfoResetter>().gunInfo;
        //     gunInfo.fillAmmo();
        // }
        refillAmmoEvent.Raise();
    }
}
