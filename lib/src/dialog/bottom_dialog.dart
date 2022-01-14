import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/ui/example/custom_picker.dart';
import 'package:parent_control/src/utils/utils.dart';

class BottomDialog {
  static void showGalleryDialog(
    BuildContext context,
    Function() gallery,
    Function() camera,
  ) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 218 * h,
          child: Column(
            children: [
              Container(
                height: 145 * h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  left: 8 * w,
                  right: 8 * w,
                  bottom: 16 * h,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12 * o),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15 * h,
                    ),
                    Text(
                      "photos",
                      style: TextStyle(
                        color: AppTheme.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15 * h,
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppTheme.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        gallery();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15 * h,
                          ),
                          Text(
                            "From Photos",
                            style: TextStyle(
                              color: AppTheme.blue,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 15 * h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: AppTheme.grey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        camera();
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15 * h,
                          ),
                          Text(
                            "Take Picture",
                            style: TextStyle(
                              color: AppTheme.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(10 * o),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 8 * w,
                  ),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: AppTheme.blue,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDatePicker(
    BuildContext context,
    int start,
    int end,
    Function(int _start, int _end) change,
  ) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 324 * h,
          width: MediaQuery.of(context).size.width,
          color: AppTheme.white,
          child: Column(
            children: [
              SizedBox(
                height: 30 * h,
              ),
              Text(
                "Time for the task",
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  height: 24 / 20 * h,
                ),
              ),
              SizedBox(
                height: 12 * h,
              ),
              SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      width: 72 * w,
                    ),
                    Text(
                      "Start",
                      style: TextStyle(
                        color: AppTheme.black75,
                        fontWeight: FontWeight.normal,
                        fontSize: 16 * o,
                        height: 19 / 16 * h,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Finish",
                      style: TextStyle(
                        color: AppTheme.black75,
                        fontWeight: FontWeight.normal,
                        fontSize: 16 * o,
                        height: 19 / 16 * h,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    SizedBox(
                      width: 76 * w,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTimerPicker(
                        maximumTime: 23,
                        minimumTime: 0,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        onTimeChanged: (int value) {
                          start = value;
                          change(start, end);
                        },
                        initialTime: start,
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
                          end = value;
                          change(start, end);
                        },
                        initialTime: end,
                        size: MediaQuery.of(context).size.width / 2 - 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showDefaultColor(
    BuildContext context,
    int id,
      Function(int _id) change,
  ) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 290 * h,
          width: MediaQuery.of(context).size.width,
          color: AppTheme.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 27 * h,
              ),
              Text(
                "Color for task background",
                style: TextStyle(
                  color: AppTheme.dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 20 * o,
                  height: 24 / 20 * h,
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(
                height: 43 * h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 1;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        border: Border.all(
                          color: AppTheme.greyE4,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 2;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.light_grey,
                        border: Border.all(color: AppTheme.greyE4, width: 1),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 3;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.light_blue,
                        border: Border.all(color: AppTheme.blue1, width: 2),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 4;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.light_green,
                        border: Border.all(
                          color: AppTheme.greyE4,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 5;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.light_yellow,
                        border: Border.all(
                          color: AppTheme.greyE4,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16 * h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 6;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.peach,
                        border: Border.all(
                          color: AppTheme.greyE4,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 7;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.rose,
                        border: Border.all(color: AppTheme.greyE4, width: 1),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 8;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.lilac,
                        border: Border.all(color: AppTheme.greyE4, width: 1),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 9;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.lilacA2,
                        border: Border.all(
                          color: AppTheme.greyE4,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      id = 10;
                      change(id);
                    },
                    child: Container(
                      height: 56 * o,
                      width: 56 * o,
                      decoration: BoxDecoration(
                        color: AppTheme.lilac6B,
                        border: Border.all(
                          color: AppTheme.greyE4,
                        ),
                        borderRadius: BorderRadius.circular(100 * o),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
