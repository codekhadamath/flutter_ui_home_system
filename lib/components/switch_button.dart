import 'package:flutter/material.dart';
import 'package:ui_tutorial_1/constants/style.dart';

class SwitchButton extends StatelessWidget {
  final bool isAcvtive;
  final Function(bool) onChanged;
  const SwitchButton(
      {Key? key, this.isAcvtive = false, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 50.0,
          height: 28.0,
          decoration: BoxDecoration(
              color: isAcvtive ? AppColor.lightBlue : Colors.grey[350],
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.white, width: 2.0)),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 5000),
          right: isAcvtive ? 5.0 : null,
          left: isAcvtive ? null : 5.0,
          bottom: 0.0,
          top: 0.0,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 8.5,
          ),
        )
      ],
    );
  }
}
