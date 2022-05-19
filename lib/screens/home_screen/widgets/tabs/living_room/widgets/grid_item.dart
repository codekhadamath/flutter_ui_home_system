import 'package:flutter/material.dart';
import 'package:ui_tutorial_1/components/circle_icon.dart';
import 'package:ui_tutorial_1/components/switch_button.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/constants/style.dart';
import 'package:ui_tutorial_1/models/item_model.dart';

class GridItem extends StatefulWidget {
  final Item item;
  const GridItem({Key? key, required this.item}) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool _isLongPressed = false;
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() => _isLongPressed = true);
      },
      onTapUp: (details) {
        setState(() => _isLongPressed = false);
      },
      onTapCancel: () {
        setState(() => _isLongPressed = false);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: _isLongPressed
                ? [
                    BoxShadow(
                        color: AppColor.primary.withOpacity(.1),
                        spreadRadius: 15.0,
                        blurRadius: 15.0,
                        offset: const Offset(10.0, 10.0))
                  ]
                : [
                    BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius: 8.0,
                        color: Colors.grey.withOpacity(.05))
                  ]),
        child: Material(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(25.0),
            splashColor: AppColor.primary,
            highlightColor: AppColor.primary.withOpacity(.5),
            onTap: () {
              setState(() => _isOn = !_isOn);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleIcon(
                    icon: widget.item.icon,
                    iconColor:
                        _isLongPressed ? Colors.white : Colors.grey[700]!,
                    backgroundColor: _isLongPressed
                        ? AppColor.lightBlue
                        : AppColor.lightGrey,
                  ),
                  Space.verticle(value: 22.0),
                  Text(
                    widget.item.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: _isLongPressed ? Colors.white : Colors.black),
                  ),
                  Space.verticle(value: 12.0),
                  Text(
                    '${widget.item.deviceCount} devices',
                    style: TextStyle(
                        color: _isLongPressed ? Colors.white54 : Colors.grey),
                  ),
                  Space.verticle(value: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _isOn ? 'On' : 'Off',
                        style: TextStyle(
                            color: _isLongPressed ? Colors.white : Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                      SwitchButton(
                        isAcvtive: _isOn,
                        onChanged: (value) {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
