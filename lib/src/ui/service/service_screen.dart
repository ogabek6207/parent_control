import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  bool errorText = true;
  bool isLoading = false;
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;

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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      two = !two;
                    });
                  },
                  child: two
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
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
                  "assets/images/tiktok.png",
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      one = !one;
                    });
                  },
                  child: one
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
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
                  "assets/images/youtube.png",
                ),
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Youtube",
                  style: TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    height: 19 / 16 * h,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      three = !three;
                    });
                  },
                  child: three
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
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
                  "assets/images/twitter.png",
                ),
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Twitter",
                  style: TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    height: 19 / 16 * h,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      four = !four;
                    });
                  },
                  child: four
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
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
                  "assets/images/steam.png",
                ),
                SizedBox(
                  width: 16 * w,
                ),
                Text(
                  "Steam",
                  style: TextStyle(
                    color: AppTheme.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    height: 19 / 16 * h,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      five = !five;
                    });
                  },
                  child: five
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                ),
                SizedBox(
                  width: 16 * w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8 * h,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                six = !six;
              });
            },
            child: Container(
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
                    "assets/images/facebook.png",
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      height: 19 / 16 * h,
                    ),
                  ),
                  const Spacer(),
                  six
                      ? SizedBox(
                          height: 24,
                          width: 24,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/container.svg",
                                color: AppTheme.blue,
                              ),
                              Center(
                                child: SvgPicture.asset(
                                  "assets/icons/done.svg",
                                  color: AppTheme.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SvgPicture.asset(
                          "assets/icons/unselect.svg",
                        ),
                  SizedBox(
                    width: 16 * w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 120 * h,
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 40 * w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32 * o),
            ),
            child: Center(
              child: Text(
                "Save",
                style: TextStyle(
                    color: AppTheme.blue,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    height: 21 / 18 * h),
              ),
            ),
          ),
          SizedBox(
            height: 32 * h,
          ),
        ],
      ),
    );
  }
}
