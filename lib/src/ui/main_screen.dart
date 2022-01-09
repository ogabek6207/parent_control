import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/ui/alert/alert_screen.dart';
import 'package:parent_control/src/ui/setting/setting_screen.dart';
import 'package:parent_control/src/ui/tasks/tasks_screen.dart';
import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  int userId = 0;
  int userGender = 0;
  String userName = "", userImage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(
          userChanged: (_id, _userName, _userImage, _userGender) {
            userId = _id;
            userName = _userName;
            userImage = _userImage;
            userGender = _userGender;
          },
        ),
        const TasksScreen(),
        AlertScreen(
          onBack: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          id: userId,
          name: userName,
          image: userImage,
          gender: userGender,
        ),
        SettingScreen(id: userId,),
      ][_selectedIndex],
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
        elevation: 10,
        iconSize: 100,
        selectedFontSize: 20,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? SvgPicture.asset("assets/menu/home.svg")
                : SvgPicture.asset("assets/menu/home.svg"),
            label: "home",
            backgroundColor: AppTheme.white,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? SvgPicture.asset(
                    "assets/menu/tasks.svg",
                    color: AppTheme.blue,
                  )
                : SvgPicture.asset(
                    "assets/menu/tasks.svg",
                  ),
            label: "Tasks",
            backgroundColor: AppTheme.red,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/menu/bell.svg",
                    color: AppTheme.blue,
                  )
                : SvgPicture.asset(
                    "assets/menu/bell.svg",
                  ),
            label: "Alerts",
            backgroundColor: AppTheme.rose,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? SvgPicture.asset(
                    "assets/menu/setting.svg",
                    color: AppTheme.blue,
                  )
                : SvgPicture.asset(
                    "assets/menu/setting.svg",
                  ),
            label: "Settings",
            backgroundColor: AppTheme.purple,
          ),
        ],
      ),
    );
  }
}
