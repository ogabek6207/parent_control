import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/dialog/bottom_dialog.dart';
import 'package:parent_control/src/utils/utils.dart';

class NewTasksScreen extends StatefulWidget {
  final String name;
  final String image;
  final int gender;
  final int id;
  final Function(
      String startTime,
      String finishTime,
      String name,
      String image,

      ) taskChanged;
  const NewTasksScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.gender,
    required this.id, required this.taskChanged,
  }) : super(key: key);

  @override
  _NewTasksScreenState createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  final TextEditingController _controller = TextEditingController();
  DateTime date = DateTime.now();
  int start = 8,
      end = 9;
  int color = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
          Container(
            width: 56,
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
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 660 * h,
            width: MediaQuery
                .of(context)
                .size
                .width,
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
                  height: 25 * h,
                ),
                Text(
                  getMonth(date.month) +
                      " " +
                      date.day.toString() +
                      ", " +
                      date.year.toString(),
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    height: 22 / 16 * h,
                    color: AppTheme.dark,
                  ),
                ),
                SizedBox(
                  height: 20 * h,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 56 * h,
                        padding: EdgeInsets.only(left: 16 * w),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          color: AppTheme.milk,
                          borderRadius: BorderRadius.circular(8 * o),
                        ),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: "Title name",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: AppTheme.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                              fontSize: 16 * o,
                              fontStyle: FontStyle.normal,
                              height: 19 / 16 * h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      GestureDetector(
                        onTap: () {
                          BottomDialog.showDatePicker(
                            context,
                            start,
                            end,
                                (_start, _end) {
                              setState(() {
                                start = _start;
                                end = _end;
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 56 * h,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(horizontal: 16 * w),
                          child: Row(
                            children: [
                              Container(
                                height: 56,
                                width: 156 * w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8 * o),
                                    bottomLeft: Radius.circular(8 * o),
                                  ),
                                  border: Border.all(
                                    color: AppTheme.greyE4,
                                    width: 1 * o,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16 * w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/hour.svg",
                                    ),
                                    SizedBox(
                                      width: 8 * w,
                                    ),
                                    Text(
                                      start.toString() + " pm",
                                      style: TextStyle(
                                        color: AppTheme.black,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16 * o,
                                        height: 19 / 16 * h,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12 * w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/more.svg",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 56,
                                width: 155 * w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8 * o),
                                    bottomRight: Radius.circular(8 * o),
                                  ),
                                  border: Border.all(
                                    color: AppTheme.greyE4,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 16 * w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/hour.svg",
                                    ),
                                    SizedBox(
                                      width: 8 * w,
                                    ),
                                    Text(
                                      end.toString() + " pm",
                                      style: TextStyle(
                                        color: AppTheme.black,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 16 * o,
                                        height: 19 / 16 * h,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12 * w,
                                    ),
                                    SvgPicture.asset(
                                      "assets/icons/more.svg",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                      GestureDetector(
                        onTap: () {
                          BottomDialog.showDefaultColor(
                            context,
                            color,
                            (_id) {
                                setState(() {
                                  color = _id;
                                });
                              } );
                        },
                        child: Container(
                          height: 56 * h,
                          padding: EdgeInsets.only(left: 16 * w),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(horizontal: 16 * w),
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: AppTheme.greyE4, width: 1),
                            color: AppTheme.white,
                            borderRadius: BorderRadius.circular(8 * o),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 24 * o,
                                width: 24 * o,
                                color: getColor(color),
                              ),
                              SizedBox(
                                width: 16 * w,
                              ),
                              Text(
                                "Default color",
                                style: TextStyle(
                                  color: AppTheme.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16 * o,
                                  fontStyle: FontStyle.normal,
                                  height: 19 / 16 * h,
                                ),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/icons/more.svg",
                              ),
                              SizedBox(
                                width: 24 * w,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16 * h,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(horizontal: 40 * w),
                  decoration: BoxDecoration(
                    color: AppTheme.milk,
                    borderRadius: BorderRadius.circular(32 * o),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18 * o,
                        fontWeight: FontWeight.w500,
                        height: 21 / 18 * h,
                        color: AppTheme.dark.withOpacity(0.3),
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

  String getMonth(int now) {
    if (date.month == 1) {
      return "January";
    } else if (date == 2) {
      return "February";
    } else if (date == 3) {
      return "March";
    } else if (date == 4) {
      return "April";
    } else if (date == 5) {
      return "May";
    } else if (date == 6) {
      return "June";
    } else if (date == 7) {
      return "July";
    } else if (date == 8) {
      return "August";
    } else if (date == 9) {
      return "September";
    } else if (date == 10) {
      return "October";
    } else if (date == 11) {
      return "November";
    } else {
      return "December";
    }
  }
  Color getColor(int id) {
    if (color == 1) {
      return AppTheme.white;
    } else if (color == 2) {
      return AppTheme.light_grey;
    } else if (color == 3) {
      return AppTheme.light_blue;
    } else if (color == 4) {
      return AppTheme.light_green;
    } else if (color == 5) {
      return AppTheme.light_yellow;
    } else if (color == 6) {
      return AppTheme.peach;
    } else if (color == 7) {
      return AppTheme.rose;
    } else if (color == 8) {
      return AppTheme.lilac;
    } else if (color == 9) {
      return AppTheme.lilacA2;
    }  else {
      return AppTheme.lilac6B;
    }
  }


}
