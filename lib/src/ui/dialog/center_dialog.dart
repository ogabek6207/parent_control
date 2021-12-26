import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class BottomDialog {
  static void sendDialog(
      BuildContext context,
      ) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              double h = Utils.windowHeight(context);
              double w = Utils.windowWidth(context);
              double o = (h + w) / 2;
              return Container(

                margin:
                EdgeInsets.symmetric(horizontal: 50 * w, vertical: 256 * h),
                height: 300 * h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(28 * o),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24 * h,
                    ),
                    Image.asset("assets/images/done.png"),
                    SizedBox(
                      height: 16 * h,
                    ),
                    Text(
                  "oijojofjopfe",
                      style: TextStyle(
                        color: AppTheme.milk,
                        fontWeight: FontWeight.bold,
                        fontSize: 20 * o,
                        height: 1.35 * h,
                      ),
                    ),
                    SizedBox(
                      height: 8 * h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16 * w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "efwpopoejpoge",
                              style: TextStyle(
                                color: AppTheme.milk,
                                fontSize: 14 * o,
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16 * h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 48 * h,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppTheme.milk,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "owjpojpogpog",
                            style: TextStyle(
                              color: AppTheme.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16 * o,
                              height: 1.25 * h,
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
        });
  }
}

