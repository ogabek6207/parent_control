import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/home_bloc.dart';
import 'package:parent_control/src/bloc/task_bloc.dart';
import 'package:parent_control/src/model/notes_model.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/ui/service_child/service_child_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  final Function(
    int id,
    String name,
    String image,
    int gender,
  ) userChanged;

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Bosh sahifa",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 22 * o,
            fontWeight: FontWeight.w500,
            height: 26 / 22 * h,
            color: AppTheme.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder(
              stream: homeBloc.fetchUser,
              builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.hasData) {
                  List<UserModel> result = snapshot.data!;
                  if (isFirst) {
                    taskBloc.getUserCurrentTask(result[0].id, DateTime.now());
                    taskBloc.getWeekTask(result[0].id);
                    taskBloc.getWeekEndTask(result[0].id);
                    widget.userChanged(result[0].id, result[0].name,
                        result[0].image, result[0].gender);
                    isFirst = false;
                  }
                  return PageView.builder(
                    controller: controller,
                    onPageChanged: (_index) {
                      taskBloc.getUserCurrentTask(
                        result[_index].id,
                        DateTime.now(),
                      );
                      taskBloc.getWeekTask(result[_index].id);
                      taskBloc.getWeekEndTask(result[_index].id);
                      widget.userChanged(
                        result[_index].id,
                        result[_index].name,
                        result[_index].image,
                        result[_index].gender,
                      );
                    },
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                          top: 16 * h,
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
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return ServiceChildScreen(
                                                    userCount: result.length,
                                                    userId: result[index].id,
                                                    image: result[index].image,
                                                    name: result[index].name,
                                                    gender:
                                                        result[index].gender,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: SvgPicture.asset(
                                            "assets/icons/vector.svg",
                                            color: result[index].image != ""
                                                ? AppTheme.white
                                                : AppTheme.black,
                                          ),
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
                            StreamBuilder(
                              stream: taskBloc.allUserTask,
                              builder: (context,
                                  AsyncSnapshot<List<NotesModel>> snapshot) {
                                if (snapshot.hasData) {
                                  List<NotesModel> result = snapshot.data!;
                                  return result.isEmpty
                                      ? Container()
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: 21 * h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 16 * w,
                                                ),
                                                Text(
                                                  "Joriy vazifa",
                                                  style: TextStyle(
                                                    color: AppTheme.grey,
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  height: 28 * h,
                                                  decoration: BoxDecoration(
                                                    color: Utils.getColor(
                                                        result[0].color),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8 * o,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      result[0].title +
                                                          " " +
                                                          result[0]
                                                              .startHour
                                                              .toString() +
                                                          (result[0].startHour >=
                                                                  13
                                                              ? "pm "
                                                              : "am ") +
                                                          " - " +
                                                          result[0]
                                                              .endHour
                                                              .toString() +
                                                          (result[0].endHour >=
                                                                  13
                                                              ? "pm "
                                                              : "am "),
                                                      style: TextStyle(
                                                        color: AppTheme.dark,
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        height: 19 / 16 * h,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                }
                                return Container();
                              },
                            ),
                            SizedBox(
                              height: 24 * h,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StreamBuilder(
                                    stream: taskBloc.allWeekEndTask,
                                    builder:
                                        (context, AsyncSnapshot<int> snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          height: 72 * h,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              47 * w,
                                          decoration: BoxDecoration(
                                            color: AppTheme.grey7,
                                            borderRadius:
                                                BorderRadius.circular(8 * o),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  snapshot.data!.toString(),
                                                  style: TextStyle(
                                                    color: AppTheme.blue1,
                                                    fontSize: 24,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    height: 29 / 24 * h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3 * h,
                                              ),
                                              Text(
                                                "Qolgan vazifalar",
                                                style: TextStyle(
                                                    color: AppTheme.grey,
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 14 / 12 * h),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return Container();
                                    },
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            DateTime.now().day.toString(),
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
                                          "Ko'rib chiqish kerak",
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
                                  StreamBuilder(
                                    stream: taskBloc.allWeekTask,
                                    builder:
                                        (context, AsyncSnapshot<int> snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          height: 72 * h,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              47 * w,
                                          decoration: BoxDecoration(
                                            color: AppTheme.grey7,
                                            borderRadius:
                                                BorderRadius.circular(8 * o),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  snapshot.data!.toString(),
                                                  style: TextStyle(
                                                    color: AppTheme.blue1,
                                                    fontSize: 24,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500,
                                                    height: 29 / 24 * h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 3 * h,
                                              ),
                                              Text(
                                                "Hafta uchun vazifalar",
                                                style: TextStyle(
                                                    color: AppTheme.grey,
                                                    fontSize: 12,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 14 / 12 * h),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      return Container();
                                    },
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
                                  "2 ta ogohlantirish",
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
