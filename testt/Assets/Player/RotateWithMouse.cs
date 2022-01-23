using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateWithMouse : MonoBehaviour
{
    public float SpeedH = 10f;
    public float SpeedV = 10f;
    private float yaw = 0f;
    private float pitch = 0f;
    public float minPitch = -90f;
    public float maxPitch = 60f;

    void Start()
    {
        // Cursor.lockState = CursorLockMode.Locked;
    }

    void Update()
    {
        yaw += Input.GetAxis("Mouse X") * SpeedH;
        pitch -= Input.GetAxis("Mouse Y") * SpeedV;
        pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
    }
    void FixedUpdate()
    {
        CameraRotate();
    }

    void CameraRotate()
    {
        transform.eulerAngles = new Vector3(pitch, yaw, 0f);
    }


}
