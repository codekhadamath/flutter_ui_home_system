import 'package:flutter/material.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/header.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/tabs/bedroom.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/tabs/kitchen.dart';
import 'package:ui_tutorial_1/screens/home_screen/widgets/tabs/living_room/living_room.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _tabs = ['Living Room', 'Bedroom', 'Kitchen'];
  final _tabViews = const [LivingRoom(), BedRoom(), Kitchen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      leading: const SizedBox.shrink(),
                      expandedHeight: 280.0,
                      flexibleSpace: Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: const FlexibleSpaceBar(background: Header())),
                      bottom: TabBar(
                        tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
                      ),
                    ),
                  )
                ],
            body: TabBarView(
                children: _tabViews
                    .map((tab) => Builder(builder: (context) {
                          return CustomScrollView(
                            key: PageStorageKey<String>(
                                _tabViews.hashCode.toString()),
                            slivers: [
                              SliverOverlapInjector(
                                  handle: NestedScrollView
                                      .sliverOverlapAbsorberHandleFor(context)),
                              SliverToBoxAdapter(
                                child: tab,
                              )
                            ],
                          );
                        }))
                    .toList())),
      ),
    );
  }
}
