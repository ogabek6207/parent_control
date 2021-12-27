import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/model/onboard_model.dart';
import 'package:parent_control/src/ui/photos/photos_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<OnboardModel> data = [
    OnboardModel(
      msg: "Control and educate correctly",
      image: 'assets/images/onboard_one.png',
      title:
          'Set tasks and control the time spent online and the content of the child',
    ),
    OnboardModel(
      msg: "Help us to improve the app",
      image: 'assets/images/onboard_two.png',
      title: 'We constantly monitor feedback and need your opinion',
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
        color: AppTheme.blue,
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
                              SizedBox(
                                height: 160,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(8 * o),
                                      child: Image.asset(
                                        "assets/images/schoolgirl.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const Spacer(),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 16 * w,
                                            ),
                                            Text(
                                              "Victoria",
                                              style: TextStyle(
                                                  color: AppTheme.white,
                                                  fontSize: 32 * o,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600,
                                                  height: 38 / 32 * h),
                                            ),
                                            const Spacer(),
                                            SvgPicture.asset(
                                                "assets/icons/vector.svg"),
                                            SizedBox(
                                              width: 24 * w,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 32 * h,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Text("Current task",
                              style: TextStyle(
                                  color: AppTheme.white,
                                  fontSize: 32 * o,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  height: 38 / 32 * h
                              ),
                              ),
                              Container(
                                height: 56 * h,
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    EdgeInsets.symmetric(horizontal: 16 * w),
                                padding: EdgeInsets.only(left: 16 * w),
                                decoration: BoxDecoration(
                                  color: AppTheme.milk,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
