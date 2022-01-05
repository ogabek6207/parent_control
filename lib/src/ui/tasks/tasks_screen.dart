import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: AppTheme.blue,
      appBar: AppBar(

      ),
    );
  }
}
