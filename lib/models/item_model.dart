import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

class Item {
  final IconData icon;
  final String name;
  final int deviceCount;
  final bool isActive;
  final double savings;

  Item(
      {required this.icon,
      required this.name,
      required this.deviceCount,
      this.isActive = false,
      this.savings = 0.0});
}

final items = [
  Item(icon: Linecons.lightbulb, name: 'Lamp', deviceCount: 6, savings: 25.0),
  Item(icon: FontAwesome.television, name: 'Smart TV', deviceCount: 1, savings: 45.0),
  Item(icon: Entypo.air, name: 'Air Condition', deviceCount: 2, savings: 55.0),
  Item(icon: Icons.speaker_outlined, name: 'Speaker', deviceCount: 2, savings: 60.0)
];
