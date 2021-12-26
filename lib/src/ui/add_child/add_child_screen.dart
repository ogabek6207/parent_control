import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  _AddChildScreenState createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
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
            height: 60 * h,
          ),
          Text(
            "Create your child profile",
            style: TextStyle(
                color: AppTheme.white,
                fontSize: 22 * o,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                height: 26 / 22 * h),
          ),
          Container(
            height: 648 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 26 * h,
              left: 16 * w,
              right: 16 * w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8 * o),
              color: AppTheme.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 40*h,),
           Image.asset("assets/images/image.png",
                height: 128*o,
                  width: 128*o,

                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
