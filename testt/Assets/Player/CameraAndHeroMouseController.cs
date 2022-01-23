using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraAndHeroMouseController : MonoBehaviour
{
    public Transform cam;
    private float yaw = 0f;
    private float pitch = 0f;
    public float minPitch = -90f;
    public float maxPitch = 60f;
    public float speed = 10f;
    void Start()
    {
        if (cam == null) {
            cam = Camera.current.transform;
        }
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        yaw += Input.GetAxis("Mouse X") * speed;
        pitch += Input.GetAxis("Mouse Y") * speed;
        pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
    }

    void FixedUpdate() {
        // transform.Rotate(transform.up * yaw);
        transform.eulerAngles = new Vector3(transform.localEulerAngles.x, yaw, transform.localEulerAngles.z);
        cam.eulerAngles = new Vector3(-pitch, transform.localEulerAngles.y, transform.localEulerAngles.z);
        // cam.Rotate(transform.right * pitch);
    }
}
