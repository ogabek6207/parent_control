import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/model/onboard_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int _selectedIndex = 0;
  List<OnboardModel> data = [
    OnboardModel(
      msg: "Сontrol and educate correctly",
      image: 'assets/images/onboard_one.png',
      title:
          'Set tasks and control the time spent online and the content of the child',
    ),
    OnboardModel(
      msg: "Help us to improve the app",
      image: 'assets/images/onboard_two.png',
      title:
          'We constantly monitor feedback and need your opinion',
    ),
    OnboardModel(
      msg: "Create profiles  for your kids",
      image: 'assets/images/onboard_three.png',
      title:
          'Create unique profiles for your kids for their different lifestyles',
    ),
    OnboardModel(
      msg: "Pre-configured  popular services",
      image: 'assets/images/onboard_four.png',
      title:
          '9:41 Pre-configured  popular services Subscribe to unlock all the features, just 3.99/week Continue Terms of UsestorPrivacy policy',
    ),
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      body: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
             AppTheme.blue,
              AppTheme.blue1,
            ],
          ),
        ),
        curve: Curves.easeInOut,
        duration: const Duration(
          seconds: 3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (_index) {
                  setState(() {
                    _selectedIndex = _index;
                  });
                },
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16 * w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          data[index].image,
                          width: MediaQuery.of(context).size.width - 32 * w,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: 44 * h,
                        ),
                        Text(
                          data[index].msg,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 28 * o,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            height: 36 / 28 * h,
                          ),
                        ),
                        SizedBox(
                          height: 18 * h,
                        ),
                        Text(
                          data[index].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 18 * o,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.jumpToPage(
                  1,
                  // duration: const Duration(microseconds: 270),
                  // curve: Curves.easeInOut,
                );
              },
              child: Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  horizontal: 56 * w,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(
                    36 * o,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: AppTheme.blue1,
                      fontSize: 18 * o,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35 * h),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Terms of Use",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
                          height: 20 / 14 * h,
                          color: AppTheme.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Restore",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
                          height: 20 / 14 * h,
                          color: AppTheme.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Privacy policy",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
                          height: 20 / 14 * h,
                          color: AppTheme.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (Platform.isIOS ? 44 : 32) * h,
            ),
          ],
        ),
      ),
    );
  }
}
