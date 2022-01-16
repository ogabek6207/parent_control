import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/task_bloc.dart';
import 'package:parent_control/src/dialog/bottom_dialog.dart';
import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:parent_control/src/utils/utils.dart';

class UpdateTasksScreen extends StatefulWidget {
  final String name;
  final String image;
  final int gender;
  final int id;
  final DateTime dateTime;
   int startHour;
   int endHour;
   int defaultColor;

  String taskName;
   UpdateTasksScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.gender,
    required this.id,
    required this.dateTime,
    required this.startHour,
    required this.endHour,
    required this.defaultColor,
    required this.taskName,
  }) : super(key: key);



  @override
  _UpdateTasksScreenState createState() => _UpdateTasksScreenState();
}

class _UpdateTasksScreenState extends State<UpdateTasksScreen> {
  final TextEditingController _controller = TextEditingController();
  final Repository _repository = Repository();
  int start = 8, end = 9;
  int color = 1;
  bool isNext = false;

  @override
  void initState() {
    _controller.text = widget.taskName;
    _controller.addListener(() {
      if (_controller.text.length >= 4) {
        if (!isNext) {
          setState(() {
            isNext = true;
          });
        }
      } else {
        if (isNext) {
          setState(() {
            isNext = false;
          });
        }
      }
    });
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
        centerTitle: true,
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
      body: ListView(
        children: [
          Container(
            height: 660 * h,
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
                  height: 25 * h,
                ),
                Text(
                  Utils.getMonth(widget.dateTime.month) +
                      " " +
                      widget.dateTime.day.toString() +
                      ", " +
                      widget.dateTime.year.toString(),
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
                        width: MediaQuery.of(context).size.width,
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
                            widget.startHour,
                            widget.endHour,
                            (_start, _end) {
                              setState(() {
                                widget.startHour = _start;
                                widget.endHour = _end;
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 56 * h,
                          width: MediaQuery.of(context).size.width,
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
                                      widget.startHour.toString() + " pm",
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
                                      widget.endHour.toString() + " pm",
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
                            widget.defaultColor,
                            (_id) {
                              setState(() {
                                widget.defaultColor = _id;
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 56 * h,
                          padding: EdgeInsets.only(left: 16 * w),
                          width: MediaQuery.of(context).size.width,
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
                                decoration: BoxDecoration(
                                    color: Utils.getColor(widget.defaultColor),
                                    borderRadius: BorderRadius.circular(4),
                                    border: widget.defaultColor == 1
                                        ? Border.all(
                                            color: const Color(0xFFECECEC),
                                          )
                                        : null),
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
                GestureDetector(
                  onTap: () async {
                    if (isNext) {
                      var id = await _repository.updateNotes(
                        NotesModel(
                          id: 0,
                          color: color,
                          year: widget.dateTime.year,
                          month: widget.dateTime.month,
                          day: widget.dateTime.day,
                          startHour: widget.startHour,
                          endHour: widget.endHour,
                          userId: widget.id,
                          title: _controller.text,
                        ),
                      );
                      if (id >= 0) {
                        taskBloc.getOneTask(widget.id, widget.dateTime);
                      }
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      color: isNext ? AppTheme.blue : AppTheme.milk,
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
                          color: isNext
                              ? AppTheme.white
                              : AppTheme.dark.withOpacity(0.3),
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
}
