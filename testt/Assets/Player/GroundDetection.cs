using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundDetection : MonoBehaviour
{
    public JumpInfo jumpInfo;
    void OnTriggerEnter(Collider c) {
        jumpInfo.canJump = true;
    }
}
