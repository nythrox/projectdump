using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class AmmoViewerUI : MonoBehaviour
{
    public GunInfo gunInfo;
    public Text text;
    void Start()
    {
        text = GetComponent<Text>();
    }

    // Update is called once per frame
    void Update()
    {
        text.text = gunInfo.currentMagazineAmmo + " / " + gunInfo.ammo;
    }
}
