import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
    const HomeScreen(),
  ];

  @override
  void initState() {
    _changeLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (_index) {
          setState(() {
            _selectedIndex = _index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        selectedItemColor: AppTheme.blue,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset("assets/icons/home3.svg")
                : SvgPicture.asset("assets/icons/home2.svg"),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
              "assets/icons/briefcase.svg",
              color: AppTheme.blue,
            )
                : SvgPicture.asset(
              "assets/icons/briefcase.svg",
            ),
            label: "reconnoiter",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
              "assets/icons/setting.svg",
              color: AppTheme.blue,
            )
                : SvgPicture.asset(
              "assets/icons/setting.svg",
            ),
            label:"irritant",
          ),
        ],
      ),
    );
  }

  Future<void> _changeLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lan = prefs.getString("language") ?? "ru";
  }
}
