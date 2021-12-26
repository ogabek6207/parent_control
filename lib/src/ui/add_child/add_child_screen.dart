import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/ui/dialog/center_dialog.dart';
import 'package:parent_control/src/ui/photos/photos_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  _AddChildScreenState createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final TextEditingController _controller = TextEditingController();
  bool errorText = true;
  bool isLoading = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.length > 4) {
        setState(() {
          errorText = true;
        });
      } else {
        setState(() {
          errorText = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;

    return Scaffold(
      backgroundColor: AppTheme.blue,
      body: ListView(
        children: [
          SizedBox(
            height: 60 * h,
          ),
          Row(
            children: [
              const Spacer(),
              Text(
                "Create your child profile",
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
                  height: 40 * h,
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const PhotosScreen();
                    },),);
                  },
                  child: Image.asset(
                    "assets/images/image.png",
                    height: 128 * o,
                    width: 128 * o,
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 108 * h,
                      width: 72 * w,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/mask_group1.svg",
                            height: 72 * o,
                            width: 72 * o,
                          ),
                          const Spacer(),
                          Text(
                            "Boy",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              height: 19 / 16 * h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 38 * w,
                    ),
                    SizedBox(
                      height: 108 * h,
                      width: 72 * w,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/mask_group.svg",
                            height: 72 * o,
                            width: 72 * o,
                          ),
                          const Spacer(),
                          Text(
                            "Girl",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              height: 19 / 16 * h,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 28 * h,
                ),
                Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  padding: EdgeInsets.only(left: 16 * w),
                  decoration: BoxDecoration(
                    color: AppTheme.milk,
                    borderRadius: BorderRadius.circular(8),
                    border: !errorText
                        ? Border.all(color: Colors.red)
                        : Border.all(color: Colors.white),
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: AppTheme.black.withOpacity(0.3),
                        )),
                  ),
                ),
                SizedBox(
                  height: 152 * h,
                ),
                GestureDetector(
                  onTap: () {
                    print(errorText);
                    if (_controller.text.length >= 4) {
                      isLoading = false;
                      Navigator.pop(context);
                      BottomDialog.sendDialog(context);
                    }
                  },
                  child: Container(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 40 * w),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(32 * o),
                    ),
                    child: Center(
                      child: Text(
                        "Add child",
                        style: TextStyle(
                            color: AppTheme.dark.withOpacity(0.3),
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            height: 21 / 18 * h),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
