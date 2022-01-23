using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeroController : MonoBehaviour
{
    public Vector3 maxSpeed;
    public float acceleration;
    private float move;
    private Vector2 moveDiretion = new Vector2(0, 0);
    private float horizontalRotateValue;
    public float horizontalRotateSpeed;
    private Rigidbody rb;
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
    }

    // Update is called once per frame
    void Update()
    {
        var moveX = 0.0f;
        var moveY = 0.0f;
        moveX += Input.GetAxis("Horizontal");
        moveY += Input.GetAxis("Vertical");
        horizontalRotateValue = Input.GetAxis("HorizontalRotation");
        moveDiretion = new Vector2(moveX, moveY).normalized;
        if (rb.velocity.y < maxSpeed.y)
            move = acceleration * moveY;
        else
        move = 0;
        // move = (transform.right * acceleration * moveDiretion.x) + (transform.forward * acceleration * moveDiretion.y);

    }
    void FixedUpdate()
    {
        rb.AddForce(transform.forward * move, ForceMode.Acceleration);
        print("====================");
        print("adding force: " + move + "dasd");
        print("total velocity: " + rb.velocity);
        print("====================");
        rb.transform.Rotate(Vector3.up, horizontalRotateValue * horizontalRotateSpeed);

    }
}
