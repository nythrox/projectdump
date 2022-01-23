using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu]
public class JumpInfo : ScriptableObject
{
    public float jumpForce = 50;
    public bool canJump = false;
}
