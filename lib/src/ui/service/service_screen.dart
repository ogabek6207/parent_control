import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/social_bloc.dart';
import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/ui/persistent_bar/curved_navigation_bar.dart';
import 'package:parent_control/src/utils/utils.dart';

class ServiceScreen extends StatefulWidget {
  final int userId;
  final bool addUser;

  const ServiceScreen({
    Key? key,
    required this.userId,
    required this.addUser,
  }) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    socialBloc.getSocialUpdate(widget.userId);
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Farzandingiz qanday ilovalardan foydalanadi",
          style: TextStyle(
              color: AppTheme.white,
              fontSize: 22 * o,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              height: 26 / 22 * h),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 27 * h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16 * w),
            height: 72 * h,
            width: 343,
padding: EdgeInsets.symmetric(horizontal: 12*w),
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12*o),
  color: AppTheme.yellow,
),
child: Center(
  child: Text("Farzandingizning tanlangan ilovalardagi faoliyatini kuzatishingizga yordam beramiz",
  textAlign: TextAlign.center,
    style: TextStyle(
    color: AppTheme.black,
    fontStyle: FontStyle.normal,
    fontSize: 16*o,
    fontWeight: FontWeight.normal,
    height: 19/16*h,
  ),


  ),
),


          ),
          SizedBox(
            height: 16 * h,
          ),
          Expanded(
            child: StreamBuilder(
              stream: socialBloc.fetchUpdateSocial,
              builder: (context, AsyncSnapshot<List<SocialModel>> snapshot) {
                if (snapshot.hasData) {
                  List<SocialModel> data = snapshot.data!;
                  return Column(
                    children: [
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
                                    Utils.socialImage(data[index].typeId),
                                  ),
                                  SizedBox(
                                    width: 16 * w,
                                  ),
                                  Text(
                                    Utils.socialName(data[index].typeId),
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
                                        data[index].selected =
                                            !data[index].selected;
                                      });
                                    },
                                    child: data[index].selected
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
                      GestureDetector(
                        onTap: () async {
                          socialBloc.saveSocial(data);
                          Navigator.popUntil(context, (route) => route.isFirst);
                          if (widget.addUser) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return  const CurvedNavigationBar1();
                                },
                              ),
                            );
                          }
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
                              "Saqlash",
                              style: TextStyle(
                                  color: AppTheme.blue,
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  height: 21 / 18 * h),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
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
