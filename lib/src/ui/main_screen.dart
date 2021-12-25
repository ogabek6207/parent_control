import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 104 * h,
          ),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            child: ClipRRect(
              child: Image.asset("assets/images/illus.png"),
            ),
          ),
          SizedBox(
            height: 44 * h,
          ),
          Text(
            "Сontrol and educate correctly",
            style: TextStyle(
                color: AppTheme.white,
                fontSize: 28 * o,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                height: 36 / 28 * h),
          ),
          SizedBox(
            height: 18 * h,
          ),
          Text(
            "Set tasks and control the time spent online and the content of the child",
            style: TextStyle(
              color: AppTheme.white,
              fontSize: 18 * o,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: 82*h,),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 56 * w),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(36*o),



            ),
            child: Center(
              child: Text("Continue",
              style: TextStyle(
                color: AppTheme.blue1,
                fontSize: 18*o,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,

              ),

              ),
            ),
          ),
          SizedBox(height :35*h),
          Container( width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 16*w),
          child: Row(
            children: [
              const Spacer(),
              Text("Terms of Use",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontStyle: FontStyle.normal,
                height: 20/14*h,
                color: AppTheme.bluePrimary,

              ),
              ),
              SizedBox(width: 40*w,),
              Text("Terms of Use",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontStyle: FontStyle.normal,
                height: 20/14*h,
                color: AppTheme.bluePrimary,

              ),
              ),
              SizedBox(width: 40*w,),
              Text("Terms of Use",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: AppTheme.fontFamilyPoppins,
                fontStyle: FontStyle.normal,
                height: 20/14*h,
                color: AppTheme.bluePrimary,

              ),
              ),
              const Spacer(),

            ],
          ),
          ),
        ],
      ),
    );
  }
}
