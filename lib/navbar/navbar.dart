import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/maki_icons.dart';
import 'package:ui_tutorial_1/screens/home_screen/home_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final _navTabs = [const HomeScreen(), const HomeScreen(), const HomeScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navTabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showUnselectedLabels: false,
          selectedLabelStyle: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Maki.minefield), label: '_'),
            BottomNavigationBarItem(icon: Icon(FontAwesome.flash), label: '_'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesome.sliders), label: '_'),
          ]),
    );
  }
}
