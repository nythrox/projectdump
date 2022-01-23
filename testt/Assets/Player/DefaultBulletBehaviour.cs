using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DefaultBulletBehaviour : MonoBehaviour
{
    public float speed = 3;
    [SerializeField]
    public Time duration;

    // Update is called once per frame
    void Update()
    {
        
    }
    void FixedUpdate() {
        gameObject.transform.Translate(transform.forward * speed * Time.deltaTime);
    }
}
