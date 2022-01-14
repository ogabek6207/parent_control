import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parent_control/src/ui/example/custom_picker.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({Key? key}) : super(key: key);

  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Row(
          children: [
            Expanded(
              child: CustomTimerPicker(
                maximumTime: 23,
                minimumTime: 0,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                onTimeChanged: (int value) {
                  print(value);
                },
                initialTime: 8,
                size: MediaQuery.of(context).size.width / 2 - 24,
              ),
            ),
            Expanded(
              child: CustomTimerPicker(
                maximumTime: 23,
                minimumTime: 0,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                onTimeChanged: (int value) {
                  print(value);
                },
                initialTime: 8,
                size: MediaQuery.of(context).size.width / 2 - 24,
              ),
            ),
          ],
        ),
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // buildTimePicker(),
        //       // const SizedBox(height: 24),
        //       // ButtonWidget(
        //       //   onClicked: () => Utils.showSheet(
        //       //     context,
        //       //     child: buildTimePicker(),
        //       //     onClicked: () {
        //       //       final value = DateFormat('HH:mm').format(dateTime);
        //       //       Utils.showSnackBar(context, 'Selected "$value"');
        //       //
        //       //       Navigator.pop(context);
        //       //     },
        //       //   ),
        //       // ),
        //
        //     ],
        //   ),
        // ),
      );

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
