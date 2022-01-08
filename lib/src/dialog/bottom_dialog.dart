import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
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
          height: 212,
          child: Column(
            children: [
              Container(
                height: 140,
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
                  margin: EdgeInsets.symmetric(horizontal: 8 * w,),
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
}
