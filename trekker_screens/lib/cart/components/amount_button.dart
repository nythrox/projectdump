import 'package:flutter/material.dart';

class AmountButton extends StatelessWidget {
  final double radius;
  final Widget icon;
  final Color borderColor;
  final void Function() onTap;
  final ShapeBorder shapeBorder;

  const AmountButton(
      {Key key, this.icon, this.borderColor, this.onTap, this.radius, this.shapeBorder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        customBorder:shapeBorder ?? RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        onTap: onTap,
        child: Container(
          width: (radius ?? 44) / 2,
          height: (radius ?? 44) / 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.2,
              color: borderColor,
            ),
          ),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
