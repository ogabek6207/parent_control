import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/ui/dialog/center_dialog.dart';
import 'package:parent_control/src/ui/photos/photos_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final TextEditingController _controller = TextEditingController();
  bool errorText = true;
  bool isLoading = false;

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: ListView(
        children: [
          SizedBox(
            height: 60 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 24 * w,
              ),
              SvgPicture.asset("assets/icons/arrow.svg"),
              SizedBox(
                width: 18 * w,
              ),
              Text(
                "What apps does Victoria use",
                style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 22 * o,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    height: 26 / 22 * h),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: 27 * h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            height: 72 * h,
            width: 343,
            child: ClipRRect(
              child: Image.asset(
                "assets/images/text.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 16 * h,
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                Image.asset(
                  "assets/images/instagram.png",
                ),
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Instagram",
                  style: TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    height: 19 / 16 * h,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset("assets/icons/done.svg",
                color: AppTheme.blue,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
