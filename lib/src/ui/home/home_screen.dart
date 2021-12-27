import 'dart:io';

import 'package:flutter/cupertino.dart';
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
                              Row(
                                children: [
                                  SizedBox(
                                    width: 16 * w,
                                  ),
                                  Text(
                                    "Current task",
                                    style: TextStyle(
                                        color: AppTheme.grey,
                                        fontSize: 12 * o,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        height: 14 / 12 * h),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14*h,),
                              Row(
                                children: [
                                  SizedBox(width: 16*w,),
                                  Container(
                                    height: 27 * h,
                                    width: 156,
                                    decoration: BoxDecoration(
                                      color: AppTheme.purple,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Text("School 8am - 14pm",
                                      style: TextStyle(
                                        color: AppTheme.dark,

                                        fontSize: 16*o,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        height: 19/16*h
                                      ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            SizedBox(height: 24*h,),
                              Row(
                                children: [
                                  SizedBox(width: 14*w,),
                                  Container(height: 72*h,
                                  width: 84*w,
                                  decoration: BoxDecoration(
                                    color: AppTheme.milk,
                                    borderRadius: BorderRadius.circular(8*o),

                                  ),
                                  child: Column(

                                    children: [
                                      SizedBox(height: 5*h,),
                                      Text("3",
                                      style: TextStyle(
                                        fontSize: 24,
                                        height: 29/24*h,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.blue1,
                                      ),
                                      ),
                                      SizedBox(height: 4*h,),
                                      Text("Left to  complete",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12*o,
                                          height: 14/12*h,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          color: AppTheme.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                  SizedBox(width: 14*w,),
                                  Container(height: 72*h,
                                    width: 84*w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.milk,
                                      borderRadius: BorderRadius.circular(8*o),

                                    ),
                                    child: Column(

                                      children: [
                                        SizedBox(height: 5*h,),
                                        Text("2",
                                          style: TextStyle(
                                            fontSize: 24,
                                            height: 29/24*h,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.red,
                                          ),
                                        ),
                                        SizedBox(height: 4*h,),
                                        Text("Alerts need review",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12*o,
                                            height: 14/12*h,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            color: AppTheme.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 14*w,),
                                  Container(height: 72*h,
                                    width: 84*w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.milk,
                                      borderRadius: BorderRadius.circular(8*o),

                                    ),
                                    child: Column(

                                      children: [
                                        SizedBox(height: 5*h,),
                                        Text("12",
                                          style: TextStyle(
                                            fontSize: 24,
                                            height: 29/24*h,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.black,
                                          ),
                                        ),
                                        SizedBox(height: 4*h,),
                                        Text("Tasks for the week",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12*o,
                                            height: 14/12*h,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal,
                                            color: AppTheme.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 14*w,),
                                ],
                              ),

SizedBox(height: 30*h,),
                              Row(
                                children: [
                                  const Spacer(),
                                  Text("3 activities ",
                                  style: TextStyle(
                                    color: AppTheme.blue1,
                                    fontSize: 16*o,
                                    height: 19/16*h,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,


                                  ),


                                  ),
                                  Text("for today",
                                  style: TextStyle(
                                    color: AppTheme.black,
                                    fontSize: 16*o,
                                    height: 19/16*h,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,


                                  ),


                                  ),
SizedBox(width: 4*w,),
SvgPicture.asset("assets/icons/arrow_right.svg"),
                                  const Spacer(),
                                ],
                              ),
SizedBox(height: 30*h,),
                              SvgPicture.asset("assets/icons/group.svg",
                              height: 40*h,
                                width: 291,

                              ),
                              SizedBox(height: 38*h,),

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
