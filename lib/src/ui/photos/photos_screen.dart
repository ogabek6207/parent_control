import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/utils/utils.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  _PhotosScreenState createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    double h = Utils.windowHeight(context);
    double w = Utils.windowWidth(context);
    double o = (h + w) / 2;
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: ListView(
        children: [
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/girl.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/girl.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: 124 * h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 1.5 * h),
            child: Row(
              children: [
                Spacer(),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 2 * w,
                ),
                SizedBox(
                  height: 124 * o,
                  width: 124 * o,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/image1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
