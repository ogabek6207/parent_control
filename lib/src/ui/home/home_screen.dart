import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/home_bloc.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  final Function(int id) userChanged;

  const HomeScreen({
    Key? key,
    required this.userChanged,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController(viewportFraction: 0.85);
  bool isFirst = true;

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
              stream: homeBloc.fetchUser,
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> result = snapshot.data!;
                  if (isFirst) {
                    widget.userChanged(result[0].id);
                    isFirst = false;
                  }
                  return PageView.builder(
                    controller: controller,
                    onPageChanged: (_index) {
                      widget.userChanged(result[_index].id);
                    },
                    itemCount: result.length,
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
                            SizedBox(
                              height: 160 * h,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  result[index].image != ""
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8 * o),
                                            topLeft: Radius.circular(8 * o),
                                          ),
                                          child: Image.file(
                                            File(result[index].image),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          height: 160 * h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12 * o),
                                              topRight: Radius.circular(12 * o),
                                            ),
                                            color: AppTheme.white,
                                          ),
                                          child: Row(
                                            children: [
                                              const Spacer(),
                                              result[index].gender == 1
                                                  ? SvgPicture.asset(
                                                      "assets/icons/boy_.svg",
                                                    )
                                                  : SvgPicture.asset(
                                                      "assets/icons/girl_.svg",
                                                    ),
                                              SizedBox(
                                                width: 58 * w,
                                              ),
                                            ],
                                          ),
                                        ),
                                  Container(
                                    height: 160 * h,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(top: 106 * h),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 16 * w,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            result[index].name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: result[index].image != ""
                                                  ? AppTheme.white
                                                  : AppTheme.black,
                                              fontSize: 32,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                              height: 38 / 32 * h,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        SvgPicture.asset(
                                          "assets/icons/vector.svg",
                                          color: result[index].image != ""
                                              ? AppTheme.white
                                              : AppTheme.black,
                                        ),
                                        SizedBox(
                                          width: 16 * w,
                                        ),
                                      ],
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
                                SizedBox(width: 16 * w),
                                Container(
                                  height: 28 * h,
                                  width: 156 * w,
                                  decoration: BoxDecoration(
                                    color: AppTheme.purple,
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
