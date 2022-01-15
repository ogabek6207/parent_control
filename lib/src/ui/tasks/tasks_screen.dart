import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/ui/tasks/new_task_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class TasksScreen extends StatefulWidget {
  final Function() onBack;
  final String name;
  final String image;
  final int gender;
  final int id;

  const TasksScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.gender,
    required this.id,
    required this.onBack,
  }) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    setState(() {
      selectedDay = now;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.blue,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.blue,
        leading: GestureDetector(
          onTap: () {
            widget.onBack();
          },
          child: SizedBox(
            height: 24,
            width: 24,
            child: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: AppTheme.white,
            ),
          ),
        ),
        title: Text(
          "Tasks " + widget.name,
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 22 * o,
            fontWeight: FontWeight.w500,
            height: 26 / 22 * h,
            color: AppTheme.white,
          ),
        ),
        actions: [
          Center(
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * o),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8 * o),
                child: widget.image != ""
                    ? Image.file(
                        File(widget.image),
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: AppTheme.white,
                        child: widget.gender == 1
                            ? SvgPicture.asset(
                                "assets/icons/boy_.svg",
                              )
                            : SvgPicture.asset(
                                "assets/icons/girl_.svg",
                              ),
                      ),
              ),
            ),
          ),
          SizedBox(
            width: 16 * w,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 600 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 16 * h,
              left: 16 * w,
              right: 16 * w,
              bottom: 18 * h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
              color: AppTheme.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 24 * h,
                ),
                Row(children: [
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(0);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(0)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(0)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(weekDay(0)),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.w600,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(0)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(1);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(1)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(1)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(1),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(1)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(2);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(2)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(2)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(2),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(2)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(3);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(3)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(3)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(3),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(3)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(4);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(4)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(4)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(4),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(4)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(5);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(5)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(5)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(5),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(5)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14 * w,
                  ),
                  GestureDetector(
                    onTap: () {
                      change(6);
                    },
                    child: Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: selectedDay == getData(6)
                            ? null
                            : Border.all(color: AppTheme.border, width: 1),
                        color: selectedDay == getData(6)
                            ? AppTheme.blue1
                            : AppTheme.white,
                      ),
                      child: Center(
                        child: Text(
                          Utils.getWeek(
                            weekDay(6),
                          ),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: selectedDay == getData(6)
                                ? AppTheme.white
                                : AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 24 * h,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: AppTheme.greyE4,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                ),
                SizedBox(
                  height: 24 * h,
                ),
                Text(
                  Utils.getMonth(selectedDay.month) +
                      " " +
                      selectedDay.day.toString() +
                      ", " +
                      selectedDay.year.toString(),
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    height: 22 / 16 * h,
                    color: AppTheme.dark,
                  ),
                ),
                SizedBox(
                  height: 16 * h,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 56 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8 * o),
                          color: AppTheme.light_blue,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            Text(
                              "School",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "8 am - 14 pm",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow_left.svg",
                              height: 10 * h,
                              width: 5 * w,
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * h,
                      ),
                      Container(
                        height: 56 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8 * o),
                          color: AppTheme.light_green,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            Text(
                              "Free time",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "14 pm - 16 pm",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow_left.svg",
                              height: 10 * h,
                              width: 5 * w,
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8 * h,
                      ),
                      Container(
                        height: 56 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8 * o),
                          color: AppTheme.light_grey,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16 * w,
                            ),
                            Text(
                              "Default",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "16 pm - 18 pm",
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 16 * o,
                                fontWeight: FontWeight.w500,
                                height: 19 / 16 * h,
                                color: AppTheme.black,
                              ),
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                            SvgPicture.asset(
                              "assets/icons/arrow_left.svg",
                              height: 10 * h,
                              width: 5 * w,
                            ),
                            SizedBox(
                              width: 16 * w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NewTasksScreen(
                            name: widget.name,
                            image: widget.image,
                            gender: widget.gender,
                            id: widget.id,
                            taskChanged: (String startTime, String finishTime,
                                String name, String image) {},
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      color: AppTheme.blue1,
                      borderRadius: BorderRadius.circular(32 * o),
                    ),
                    child: Center(
                      child: Text(
                        "+ Add task",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 18 * o,
                          fontWeight: FontWeight.w500,
                          height: 21 / 18 * h,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36 * h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int weekDay(int i) {
    return now.add(Duration(days: i)).weekday % 7;
  }

  void change(int i) {
    setState(() {
      selectedDay = now.add(
        Duration(days: i),
      );
    });
  }

  DateTime getData(int i) {
    return now.add(
      Duration(days: i),
    );
  }
}
