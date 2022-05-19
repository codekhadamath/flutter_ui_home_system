import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:ui_tutorial_1/components/circle_icon.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/models/item_model.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/tabs/living_room/widgets/grid_item.dart';

class LivingRoom extends StatelessWidget {
  const LivingRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gridList = ['fdfd', 'fdfd', 'fdfd', 'dfdfd'];

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: .9,
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 48.0),
      children: [
        ...items.map((item) => GridItem(item: item,))
      ],
    );
  }
}
