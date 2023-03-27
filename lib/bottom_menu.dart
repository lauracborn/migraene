import 'package:flutter/material.dart';
import 'package:migraene/screens/calendar_screen.dart';
import 'package:migraene/screens/home_screen.dart';
import 'package:migraene/screens/plus_screen.dart';
import 'package:migraene/screens/profile_screen.dart';
class BottomMenu extends StatefulWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 0;

  List pages = [
    HomeScreen(),
    CalendarScreen(),
    PlusScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            //borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            backgroundColor: Color(0xFF000000),
            items: [
              BottomNavigationBarItem(
                label: "",
                activeIcon: new Image.asset('assets/icons/home_outlines_white.png', height: 25),
                icon: new Image.asset('assets/icons/home_outlines_grau.png', height: 25)
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: new Image.asset('assets/icons/list_outlines_white.png', height: 25),
                icon: new Image.asset('assets/icons/list_outlines_grau.png', height: 25)
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: new Image.asset('assets/icons/plus_outlines_white.png', height: 25),
                icon: new Image.asset('assets/icons/plus_outlines_grau.png', height: 25)
              ),
              BottomNavigationBarItem(
                label: "",
                activeIcon: new Image.asset('assets/icons/profile_outlines_white.png', height: 25),
                icon: new Image.asset('assets/icons/profile_outlines_grau.png', height: 25)
              ),
            ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
          ),
        ),
    );
  }
}