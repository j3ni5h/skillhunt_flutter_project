import 'package:flutter/material.dart';
import 'package:skillhunt/pages/bottom_navigation_pages/homePage.dart';
import 'package:skillhunt/pages/bottom_navigation_pages/profile_page.dart';
import 'package:skillhunt/pages/bottom_navigation_pages/setting_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = [
    HomePage(),
    ProfilePage(),
    SettingPage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color.fromARGB(255, 223, 70, 70),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
         selectedLabelStyle: TextStyle(
          color: Colors.red, // Change label color here
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black87,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black87,
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black87,
            ),
            label: "Setting",
          ),
          
        ],
      ),
    );
  }
}
