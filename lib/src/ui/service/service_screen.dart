import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/model/service_model.dart';
import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:parent_control/src/utils/utils.dart';

import '../main_screen.dart';

class ServiceScreen extends StatefulWidget {
  final int userId;

  const ServiceScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  final Repository _repository = Repository();
  bool _selectIndex = false;
  List<ServiceModel> data = [
    ServiceModel(
      image: "assets/images/instagram.png",
      name: "Instagram",
      onClick: false,
    ),
    ServiceModel(
      image: "assets/images/tiktok.png",
      name: "TikTok",
      onClick: false,
    ),
    ServiceModel(
      image: "assets/images/youtube.png",
      name: "Youtube",
      onClick: false,
    ),
    ServiceModel(
      image: "assets/images/twitter.png",
      name: "Twitter",
      onClick: false,
    ),
    ServiceModel(
      image: "assets/images/steam.png",
      name: "Steam",
      onClick: false,
    ),
    ServiceModel(
      image: "assets/images/facebook.png",
      name: "Facebook",
      onClick: false,
    ),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: Column(
        children: [
          SizedBox(
            height: 60 * h,
          ),
          Row(
            children: [
              SizedBox(
                width: 24 * w,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/icons/arrow.svg")),
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
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 16 * w,
                    right: 16 * w,
                    top: 8 * h,
                  ),
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
                        data[index].image,
                      ),
                      SizedBox(
                        width: 16 * w,
                      ),
                      Text(
                        data[index].name,
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
                          setState(
                            () {
                              data[index].onClick = !data[index].onClick;
                            },
                          );
                        },
                        child: (data[index].onClick)
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
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (
                  context, index
                  ) {
                return GestureDetector(
                  onTap: () async {
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 1,
                          userId: widget.userId,
                        ),
                      );
                    }
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 2,
                          userId: widget.userId,
                        ),
                      );
                    }
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 3,
                          userId: widget.userId,
                        ),
                      );
                    }
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 4,
                          userId: widget.userId,
                        ),
                      );
                    }
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 5,
                          userId: widget.userId,
                        ),
                      );
                    }
                    if (data[index].onClick) {
                      await _repository.saveSocial(
                        SocialModel(
                          id: 0,
                          typeId: 6,
                          userId: widget.userId,
                        ),
                      );
                    }




                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return const MainScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
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
                );
              },
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
