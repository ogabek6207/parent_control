import 'dart:io';

import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/model/onboard_model.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool isFirst = false;
  int _selectedIndex = 0;
  List<OnboardModel> data = [
    OnboardModel(
      msg: "To'g'ri nazorat qiling va tarbiyalang ",
      image: 'assets/images/onboard_one.png',
      title:
          'Vazifalarni qo\ying va onlayn vaqtni va bolaning mazmunini nazorat qiling',
    ),
    OnboardModel(
      msg: "Ilovani yaxshilashga yordam bering",
      image: 'assets/images/onboard_two.png',
      title:
          'Biz doimo fikr-mulohazalarni kuzatib boramiz va sizning fikringizga muhtojmiz',
    ),
    OnboardModel(
      msg: "Farzandlaringiz uchun profil yarating",
      image: 'assets/images/onboard_three.png',
      title:
          'Farzandlaringiz uchun turli xil turmush tarzi uchun noyob profillar yarating',
    ),
    OnboardModel(
      msg: "Oldindan sozlangan mashhur xizmatlar",
      image: 'assets/images/onboard_four.png',
      title: 'Hozir ilova sinov muddatida Fikringiz biz uchun juda muhim!',
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
                        Container(
                          height: 250 * o,
                          width: 300 * o,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50 * o),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50 * o),
                            child: Image.asset(
                              data[index].image,
                              width: MediaQuery.of(context).size.width - 32 * w,
                              fit: BoxFit.cover,
                            ),
                          ),
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
                _selectedIndex++;
                if (_selectedIndex == 4) {
                  _setData(isFirst = true);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddChildScreen();
                      },
                    ),
                  );
                } else {
                  controller.jumpToPage(
                    _selectedIndex,
                  );
                }
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
                    "Davom eting",
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
                        "Foydalanish shartlari",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9 * h,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
                          color: AppTheme.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Qayta tiklash",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9 * h,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
                          color: AppTheme.bluePrimary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Maxfiylik siyosati",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 9 * h,
                          fontFamily: AppTheme.fontFamilyPoppins,
                          fontStyle: FontStyle.normal,
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

  Future<void> _setData(bool isFirst) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isFirst", true);
  }
}
