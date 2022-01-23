using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[CreateAssetMenu]
public class PlayerMovementInfo : ScriptableObject
{
    public float aditionalSpeed;
    public float acceleration = 2f;
    public float initialSpeed = 10f;
    public float maxSpeed = 20f;
}
