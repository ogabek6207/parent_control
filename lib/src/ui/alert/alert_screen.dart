import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/social_bloc.dart';
import 'package:parent_control/src/model/social_model.dart';
import 'package:parent_control/src/utils/utils.dart';

class AlertScreen extends StatefulWidget {
  final int id;

  const AlertScreen({Key? key, required this.id}) : super(key: key);

  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  void initState() {
    socialBloc.getSocial(widget.id);
    super.initState();
  }

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
              AppTheme.blueFF,
            ],
          ),
        ),
        curve: Curves.easeInOut,
        duration: const Duration(
          seconds: 3,
        ),
        child: Column(
          children: [
            Container(
              height: 48 * h,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 48 * h),
              child: Row(
                children: [
                  SizedBox(
                    width: 24 * w,
                  ),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                    color: AppTheme.white,
                  ),
                  SizedBox(
                    width: 40 * w,
                  ),
                  Text(
                    "Tasks Victoria",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 22 * o,
                      fontWeight: FontWeight.w500,
                      height: 26 / 22 * h,
                      color: AppTheme.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 48 * o,
                    width: 48 * o,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8 * o),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8 * o),
                      child: Image.asset(
                        "assets/images/schoolgirl.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16 * w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Container(
              height: 72 * h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12 * o),
                color: AppTheme.yellow,
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 16 * w),
              child: Center(
                child: Text(
                  "At the end of the day, ask your child about his impressions on the Internet for the past day",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 16 * o,
                    fontWeight: FontWeight.normal,
                    height: 19 / 16 * h,
                    color: AppTheme.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 16 * h,
            ),
            Expanded(
              child: StreamBuilder(
                stream: socialBloc.fetchSocial,
                builder: (context, AsyncSnapshot<List<SocialModel>> snapshot) {
                  if (snapshot.hasData) {
                    List<SocialModel> result = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 56 * h,
                          margin: EdgeInsets.only(
                            top: 8 * h,
                            left: 16 * w,
                            right: 16 * w,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12 * o),
                            color: AppTheme.white,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 16 * w,
                              ),
                              Image.asset(
                                Utils.socialImage(
                                  result[index].typeId,
                                ),
                              ),
                              SizedBox(
                                width: 24 * w,
                              ),
                              SizedBox(
                                width: 8 * w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/arrow_bottom.svg",
                                color: AppTheme.black,
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                "assets/icons/dislike_.svg",
                              ),
                              SizedBox(
                                width: 16 * w,
                              ),
                              SvgPicture.asset(
                                "assets/icons/like_.svg",
                              ),
                              SizedBox(
                                width: 16 * w,
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
          ],
        ),
      ),
    );
  }
}
