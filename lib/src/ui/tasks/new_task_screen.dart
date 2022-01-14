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

  const NewTasksScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.gender,
    required this.id,
  }) : super(key: key);

  @override
  _NewTasksScreenState createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  final TextEditingController _controller = TextEditingController();

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
      body: Column(
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
                  height: 25 * h,
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
                          BottomDialog.showDatePicker(context);
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
                                      "16 pm",
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
                                      "16 pm",
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
                      Container(
                        height: 56 * h,
                        padding: EdgeInsets.only(left: 16 * w),
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 16 * w),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.greyE4, width: 1),
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(8 * o),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 24 * o,
                              width: 24 * o,
                              color: AppTheme.milk,
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
                            SizedBox(width: 24*w,),
                          ],
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
                  width: MediaQuery.of(context).size.width,
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
}
