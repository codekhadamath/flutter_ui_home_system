import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:ui_tutorial_1/components/circle_icon.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/constants/style.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/energy_expense.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome Ahmad',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                            letterSpacing: .4),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'Smart home technology',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                            letterSpacing: .4),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 25,
                  child: Image.network(
                    'https://palmetto.com/images/home-solar-energy-system.png',
                    errorBuilder: (context, error, stackTrace) => Container(),
                  ),
                )
              ],
            ),
          ),
          Space.verticle(value: 16.0),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  isDismissible: true,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0))),
                  context: context,
                  builder: (context) => const EnergyExpense());
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1.0,
                        blurRadius: 8.0,
                        color: Colors.grey.withOpacity(.05))
                  ]),
              child: Column(children: [
                Row(
                  children: [
                    CircleIcon(
                        backgroundColor: AppColor.primary.withOpacity(.1),
                        iconColor: AppColor.primary,
                        icon: FontAwesome.flash),
                    Space.horizontal(value: 10.0),
                    const Text(
                      'Estimated energy expenses this month',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .4),
                    )
                  ],
                ),
                Space.verticle(value: 16.0),
                Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 44.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey.withOpacity(.1),
                        )),
                    Stack(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 44.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: AppColor.primary,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(.2),
                                      spreadRadius: 10.0,
                                      blurRadius: 10.0,
                                      offset: const Offset(5.0, 0.0))
                                ])),
                        Positioned.fill(
                            right: 16.0,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 3.5,
                                  height: 18.0,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(10.0),
                                          bottom: Radius.circular(10.0))),
                                ))),
                      ],
                    ),
                    Positioned.fill(
                        right: 16.0,
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '\$150.15',
                              style: TextStyle(color: Colors.grey[600]),
                            ))),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
