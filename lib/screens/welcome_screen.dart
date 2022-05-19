import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ui_tutorial_1/constants/constant.dart';
import 'package:ui_tutorial_1/navbar/navbar.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _sliderItems = [
    'assets/smart_home.png',
    'assets/smart_home.png',
    'assets/smart_home.png'
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CarouselSlider(
                          items: _sliderItems
                              .map((image) => Image.asset(
                                    'assets/smart_home.png',
                                    height: 300.0,
                                    width: 300.0,
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            onPageChanged: (pageNo, reason) {
                              setState(() => _currentIndex = pageNo);
                            },
                            scrollDirection: Axis.horizontal,
                          )),
                      Space.verticle(value: 26.0),
                      DotsIndicator(
                        dotsCount: _sliderItems.length,
                        position: _currentIndex.toDouble(),
                        decorator: DotsDecorator(
                          spacing: const EdgeInsets.all(2.0),
                          size: const Size.square(8.0),
                          activeSize: const Size(25.0, 8.0),
                          color: Colors.grey[300]!,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      )
                    ],
                  ),
                  Space.verticle(value: 30.0),
                  const Text(
                    'Control your daily energy expenses',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        height: 1.4),
                  ),
                  Space.verticle(value: 16.0),
                  const Text(
                    'Always save your electrical energy needs to protect the earth',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 50.0,
              left: 0.0,
              right: 0.0,
              child: Align(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NavBar()));
                  },
                  child: const Text('Getting Started'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
              ))
        ],
      ),
    );
  }
}
