import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/ui/main_screen.dart';
import 'package:parent_control/src/ui/onboard/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Repository _repository = Repository();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  Future<void> _getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isFirst = pref.getBool("isFirst") ?? false;
    int k = (await _repository.getUsers()).length;
    Timer(const Duration(milliseconds: 1250), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return !isFirst
                ? const OnBoardScreen()
                : (k != 0 ? const MainScreen() : const AddChildScreen());
          },
        ),
      );
    });
  }
}
