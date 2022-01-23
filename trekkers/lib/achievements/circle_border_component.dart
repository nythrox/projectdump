import 'package:flutter/material.dart';

class CircleBorderComponent extends StatelessWidget {
  final double radius;
  final bool opacity;
  final bool border;
  final String image;

  const CircleBorderComponent(this.radius, this.opacity, this.border, this.image);

  @override
  Widget build(BuildContext context) {
    return  Opacity(
          opacity: !opacity ? 1 : 0.7,
          child: Container(
            decoration: new BoxDecoration(
              border: Border.all(width: 6.0, color: !border ? Colors.black12 :  Colors.black45),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  image),
            ),
          ),
    );
}
}