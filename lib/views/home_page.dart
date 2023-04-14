import 'package:flutter/material.dart';
import 'package:shiro/main.dart';
import 'package:shiro/views/home/add/post_pet.dart';
import 'package:shiro/views/home/adoption/adopt_new_page.dart';
import 'package:shiro/views/home/funding/crowd_funding_page.dart';
import 'package:shiro/views/home/view_posts/feed_page.dart';
import 'package:shiro/views/home/view_posts/top_posts_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Feed(),
    TopPosts(),
    NewPost(),
    AdoptNew(),
    CrowdFunding()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appColor,
        ), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
            backgroundColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dynamic_feed),
                label: "Feed",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.verified),
                label: "Top Posts",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "New Post",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: "Adopt",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline_rounded),
                label: "Crowd Funding",
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            iconSize: 30,
            onTap: _onItemTapped,
            elevation: 5),
      ),
    );
  }
}
