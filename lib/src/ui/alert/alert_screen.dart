import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: AnimatedContainer(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppTheme.blue,
          AppTheme.blueFF,
        ],
      ),
    ),
    curve: Curves.easeInOut,
    duration: const Duration(
      seconds: 3,
    ),
    child: Column(),
  ),
    );
  }
}
