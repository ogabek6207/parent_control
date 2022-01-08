import 'dart:io';
import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/bloc/home_bloc.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    homeBloc.getUsers();
    super.initState();
  }

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
          Expanded(
            child: StreamBuilder(
              stream: homeBloc.fetchDrugs,
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.hasData) {
                  return PageView.builder(
                    controller: controller,
                    onPageChanged: (_index) {},
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 96 * h,
                          left: 16 * w,
                          right: 16 * w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8 * o),
                          color: AppTheme.white,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 160 * h,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(12 * o)),
                                    child: Image.asset(
                                      "assets/images/image.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 21 * h,
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
                                    fontSize: 12,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                    height: 14 / 12 * h,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10 * h,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 16*w),
                                Container(
                                  height: 28 * h,
                                  width: 156 * w,
                                  decoration: BoxDecoration(
                                    color: AppTheme.blueFF,
                                    borderRadius: BorderRadius.circular(8 * o),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "School 8am - 14pm",
                                      style: TextStyle(
                                        color: AppTheme.dark,
                                        fontSize: 16,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.normal,
                                        height: 19 / 16 * h,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24 * h,
                            ),
                            SizedBox(
                              height: 96 * h,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 72 * h,
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            47 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.grey7,
                                      borderRadius:
                                          BorderRadius.circular(8 * o),
                                    ),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "3",
                                            style: TextStyle(
                                                color: AppTheme.blue1,
                                                fontSize: 24,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                height: 29 / 24 * h),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3 * h,
                                        ),
                                        Text(
                                          "Left to  complete",
                                          style: TextStyle(
                                              color: AppTheme.grey,
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              height: 14 / 12 * h),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15 * w,
                                  ),
                                  Container(
                                    height: 72 * h,
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            47 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.grey7,
                                      borderRadius:
                                          BorderRadius.circular(8 * o),
                                    ),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                                color: AppTheme.red,
                                                fontSize: 24,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                height: 29 / 24 * h),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3 * h,
                                        ),
                                        Text(
                                          "Alerts need review",
                                          style: TextStyle(
                                              color: AppTheme.grey,
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              height: 14 / 12 * h),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15 * w,
                                  ),
                                  Container(
                                    height: 72 * h,
                                    width:
                                        MediaQuery.of(context).size.width / 3 -
                                            47 * w,
                                    decoration: BoxDecoration(
                                      color: AppTheme.grey7,
                                      borderRadius:
                                          BorderRadius.circular(8 * o),
                                    ),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "12",
                                            style: TextStyle(
                                                color: AppTheme.black,
                                                fontSize: 24,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                height: 29 / 24 * h),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3 * h,
                                        ),
                                        Text(
                                          "Tasks for the week",
                                          style: TextStyle(
                                              color: AppTheme.grey,
                                              fontSize: 12,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.normal,
                                              height: 14 / 12 * h),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 56,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 40 * w),
                              decoration: BoxDecoration(
                                color: AppTheme.red,
                                borderRadius: BorderRadius.circular(32 * o),
                              ),
                              child: Center(
                                child: Text(
                                  "2 alerts need review",
                                  style: TextStyle(
                                      color: AppTheme.white,
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
                    },
                  );
                }
                return Container();
              },
            ),
          ),
          SizedBox(
            height: (Platform.isIOS ? 44 : 32) * h,
          ),
        ],
      ),
    );
  }
}
