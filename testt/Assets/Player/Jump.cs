using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Jump : MonoBehaviour
{
    public JumpInfo jumpInfo;
    private Rigidbody rb;
    public float jumpCooldown = 0.2f;
    [SerializeField]
    private float timeToNextJump = 0.0f;
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (Input.GetAxis("Jump") > 0 && Time.time >= timeToNextJump)
        {
            PerformJump();
        }
        if (timeToNextJump > 0) timeToNextJump -= Time.deltaTime;
        else timeToNextJump = 0;
    }
    void PerformJump()
    {
        if (jumpInfo.canJump && timeToNextJump <= 0)
        {
            rb.AddForce(Vector3.up * jumpInfo.jumpForce, ForceMode.Impulse);
            jumpInfo.canJump = false;
            timeToNextJump = jumpCooldown;
        }
    }
}
