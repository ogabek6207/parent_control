import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/ui/add_child/add_child_two_screen.dart';
import 'package:parent_control/src/ui/service/service_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class SettingScreen extends StatefulWidget {
  final int id;

  const SettingScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
            height: 80 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 48 * h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sozlamalar",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 22 * o,
                    fontWeight: FontWeight.w500,
                    height: 26 / 22 * h,
                    color: AppTheme.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 8 * h, left: 16 * w, right: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
              color: AppTheme.white,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Maxfiylik siyosati",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    height: 19 / 16 * h,
                    color: AppTheme.black,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  color: AppTheme.black,
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          Container(
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 8 * h, left: 16 * w, right: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
              color: AppTheme.white,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Foydalanish muddati",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    height: 19 / 16 * h,
                    color: AppTheme.black,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  color: AppTheme.black,
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          Container(
            height: 56 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 8 * h, left: 16 * w, right: 16 * w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
              color: AppTheme.white,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Qo'llab-quvvatlash",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.w500,
                    height: 19 / 16 * h,
                    color: AppTheme.black,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/arrow_left.svg",
                  color: AppTheme.black,
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AddChildTwoScreen();
                  },
                ),
              );
            },
            child: Container(
              height: 56,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 40 * w),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(32 * o),
              ),
              child: Center(
                child: Text(
                  "Bola qo'shing",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18 * o,
                    fontWeight: FontWeight.w500,
                    height: 21 / 18 * h,
                    color: AppTheme.blue1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ServiceScreen(
                      userId: widget.id,
                      addUser: false,
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
                color: Colors.transparent,
                border: Border.all(color: AppTheme.white, width: 1),
                borderRadius: BorderRadius.circular(32 * o),
              ),
              child: Center(
                child: Text(
                  "Xizmatlarni qo'shish",
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
            height: 34 * h,
          ),
        ],
      ),
    );
  }
}
