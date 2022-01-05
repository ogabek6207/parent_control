import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: Column(
        children: [
          SizedBox(
            height: 36 * h,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16 * w,
            ),
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 24 * w, right: 24 * w, top: 8 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13 * o),
              border: Border.all(
                color: AppTheme.light_greey,
                width: 1,
              ),
              color: AppTheme.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Default color",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.black,
                      height: 19 / 16 * h),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16 * w,
            ),
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 24 * w, right: 24 * w, top: 8 * h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13 * o),
              color: AppTheme.light_greey,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Default color",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: AppTheme.black,
                      height: 19 / 16 * h),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
