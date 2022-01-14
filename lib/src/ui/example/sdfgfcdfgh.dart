import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPicker extends StatefulWidget {
  const CupertinoTimerPicker({Key? key}) : super(key: key);

  @override
  _CupertinoTimerPickerState createState() => _CupertinoTimerPickerState();
}

class _CupertinoTimerPickerState extends State<CupertinoTimerPicker> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: buildTimePicker(),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          maximumYear: DateTime.now().year,
          minimumYear: 2015,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          use24hFormat: true,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
