import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/ui/alert/alert_screen.dart';
import 'package:parent_control/src/ui/home/home_screen.dart';
import 'package:parent_control/src/ui/setting/setting_screen.dart';
import 'package:parent_control/src/ui/tasks/tasks_screen.dart';

class CurvedNavigationBar1 extends StatefulWidget {
  const CurvedNavigationBar1({Key? key}) : super(key: key);

  @override
  _CurvedNavigationBar1State createState() => _CurvedNavigationBar1State();
}

class _CurvedNavigationBar1State extends State<CurvedNavigationBar1> {
  int _selectedIndex = 0;
  int userId = 0;
  int userGender = 0;
  String userName = "", userImage = "";
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(
        userChanged: (_id, _userName, _userImage, _userGender) {
          userId = _id;
          userName = _userName;
          userImage = _userImage;
          userGender = _userGender;
        },
      ),
      TasksScreen(

        id: userId,
        name: userName,
        image: userImage,
        gender: userGender, onBack: () {_selectedIndex = 0;  },
      ),
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
      SettingScreen(
        id: userId,
      ),
    ];
    final items = [
      SvgPicture.asset("assets/menu/home.svg"),
      SvgPicture.asset(
        "assets/menu/tasks.svg",
      ),
      SvgPicture.asset(
        "assets/menu/bell.svg",
        color: AppTheme.blue,
      ),
      SvgPicture.asset(
        "assets/menu/setting.svg",
      ),
    ];
    return Scaffold(
      extendBody: true,
      body:screens[index],
      backgroundColor: AppTheme.blue,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppTheme.blue,
        height: 60,
        items: items,
index: index,
        onTap: (index)=> setState(() {
          this.index = index;
        }),
      ),
    );
  }
}
