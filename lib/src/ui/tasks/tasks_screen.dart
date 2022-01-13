import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/utils/utils.dart';

class TasksScreen extends StatefulWidget {
  final String name;
  final String image;
  final int gender;
  final int id;

  const TasksScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.gender,
      required this.id})
      : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  DateTime now = DateTime.now();
  DateTime selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.blue,
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
        child: Column(
          children: [
            Container(
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 48 * h),
              child: Row(
                children: [
                  SizedBox(
                    width: 24 * w,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppTheme.white,
                  ),
                  SizedBox(
                    width: 40 * w,
                  ),
                  Text(
                    "Tasks " + widget.name,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 22 * o,
                      fontWeight: FontWeight.w500,
                      height: 26 / 22 * h,
                      color: AppTheme.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 48 * o,
                    width: 48 * o,
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
                  SizedBox(
                    width: 16 * w,
                  ),
                ],
              ),
            ),
            Container(
              height: 610 * h,
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
                        setState(() {
                          selectedDay = now;
                        });
                      },
                      child: Container(
                        height: 32 * o,
                        width: 32 * o,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: selectedDay == now
                              ? null
                              : Border.all(color: AppTheme.border, width: 1),
                          color: selectedDay == now
                              ? AppTheme.blue1
                              : AppTheme.white,
                        ),
                        child: Center(
                          child: Text(
                            getWeek(now.weekday % 7),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 12 * o,
                              fontWeight: FontWeight.w600,
                              height: 14 / 12 * h,
                              color: selectedDay == now
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
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32 * o),
                        border: Border.all(color: AppTheme.border, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 1)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * w,
                    ),
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: Border.all(color: AppTheme.border, width: 1)),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 2)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * w,
                    ),
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: Border.all(color: AppTheme.border, width: 1)),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 3)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * w,
                    ),
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: Border.all(color: AppTheme.border, width: 1)),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 4)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * w,
                    ),
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: Border.all(color: AppTheme.border, width: 1)),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 5)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 14 * w,
                    ),
                    Container(
                      height: 32 * o,
                      width: 32 * o,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32 * o),
                          border: Border.all(color: AppTheme.border, width: 1)),
                      child: Center(
                        child: Text(
                          getWeek(now.add(const Duration(days: 6)).weekday % 7),
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 12 * o,
                            fontWeight: FontWeight.normal,
                            height: 14 / 12 * h,
                            color: AppTheme.black,
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
                    "November 1, 2021",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 16 * o,
                      fontWeight: FontWeight.w500,
                      height: 22 / 16 * h,
                      color: AppTheme.dark,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 8 * h,
                        ),
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
                  Container(
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
                  SizedBox(
                    height: 36 * h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getWeek(int now) {
    if (now == 1) {
      return "Mon";
    } else if (now == 2) {
      return "Tue";
    } else if (now == 3) {
      return "Wed";
    } else if (now == 4) {
      return "Thu";
    } else if (now == 5) {
      return "Fri";
    } else if (now == 6) {
      return "Sat";
    } else {
      return "Sun";
    }
  }
}
