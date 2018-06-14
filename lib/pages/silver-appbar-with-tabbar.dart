import 'package:flutter/material.dart';

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Some title"),
            ),
            expandedHeight: 160.0,
            bottom: new TabBar(
              tabs: [
                new Tab(text: 'Tab 1'),
                new Tab(text: 'Tab 2'),
                new Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          new SliverList(
            delegate: new SliverChildBuilderDelegate(
              (context, idx) {
                return new ListTile(
                  title: new Text("$idx"),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}