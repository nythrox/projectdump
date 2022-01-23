
import 'package:flutter/material.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    Key key,
    @required this.onPressed,
    @required this.icon
  }) : super(key: key);

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
