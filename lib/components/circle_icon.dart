import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  const CircleIcon(
      {Key? key,
      this.backgroundColor = const Color(0x1F9E9E9E),
      this.iconColor = const Color(0xFF424242),
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Icon(
        icon,
        color: iconColor,
        size: 24.0,
      ),
      backgroundColor: backgroundColor,
    );
  }
}
