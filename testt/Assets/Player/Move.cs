using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour
{
    public PlayerMovementInfo playerMovementInfo;
    private Rigidbody rb;
    private Vector2 moveValue;
    public GameObject facingTowards;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        playerMovementInfo.aditionalSpeed = playerMovementInfo.initialSpeed;
    }

    // Update is called once per frame
    void Update()
    {
        HandleMovement();
    }
    void FixedUpdate()
    {
        var v = (facingTowards.transform.right * moveValue.x) + (facingTowards.transform.forward * moveValue.y);
        v.y = rb.velocity.y;
        rb.velocity = v;
    }
    void HandleMovement()
    {
        var moveX = 0.0f;
        var moveY = 0.0f;
        moveX += Input.GetAxis("Horizontal");
        moveY += Input.GetAxis("Vertical");
        if (moveX != 0 | moveY != 0)
        {
            playerMovementInfo.aditionalSpeed += playerMovementInfo.acceleration * Time.deltaTime;
            if (playerMovementInfo.aditionalSpeed > playerMovementInfo.maxSpeed - playerMovementInfo.initialSpeed)
                playerMovementInfo.aditionalSpeed = playerMovementInfo.maxSpeed - playerMovementInfo.initialSpeed;
        }
        else playerMovementInfo.aditionalSpeed = 0;
        moveValue = new Vector2((playerMovementInfo.initialSpeed + playerMovementInfo.aditionalSpeed) * moveX, (playerMovementInfo.initialSpeed + playerMovementInfo.aditionalSpeed) * moveY);

    }

}
