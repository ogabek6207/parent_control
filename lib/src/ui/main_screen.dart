import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/ui/alert/alert_screen.dart';
import 'package:parent_control/src/ui/setting/setting_screen.dart';
import 'package:parent_control/src/ui/tasks/tasks_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {



  MainScreen({Key? key, }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> data = [
          HomeScreen(),
    const TasksScreen(),
    const AlertScreen(),
    const SettingScreen(),
  ];

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
                ? SvgPicture.asset("assets/icons/home.svg")
                : SvgPicture.asset("assets/icons/home.svg"),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
                    "assets/icons/tasks.svg",
                    color: AppTheme.blue,
                  )
                : SvgPicture.asset(
                    "assets/icons/tasks.svg",
                  ),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/icons/bell.svg",
                    color: AppTheme.blue,
                  )
                : SvgPicture.asset(
                    "assets/icons/bell.svg",
                  ),
            label: "Alerts",
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
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
