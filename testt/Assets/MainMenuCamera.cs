using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainMenuCamera : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        // transform.localRotation = Quaternion.Euler();
        transform.Rotate(Input.GetAxis("Mouse Y") * -0.1f, Input.GetAxis("Mouse X") * 0.1f, 0);
        transform.Translate(Input.GetAxis("Mouse Y") * -1, Input.GetAxis("Mouse X") * 1, 0);
    }
}
