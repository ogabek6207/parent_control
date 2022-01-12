import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/dialog/bottom_dialog.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:parent_control/src/ui/service/service_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildTwoScreen extends StatefulWidget {
  const AddChildTwoScreen({Key? key}) : super(key: key);

  @override
  _AddChildScreenTwoState createState() => _AddChildScreenTwoState();
}

class _AddChildScreenTwoState extends State<AddChildTwoScreen> {
  final ImagePicker _picker = ImagePicker();
  final Repository _repository = Repository();
  final TextEditingController _controller = TextEditingController();
  File? data;
  bool gender = true;

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
              SizedBox(
                width: 16 * w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24 * o,
                  color: AppTheme.white,
                ),
              ),
              const Spacer(),
              Text(
                "Profile setting",
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
                data == null
                    ? GestureDetector(
                        onTap: () {
                          BottomDialog.showGalleryDialog(
                            context,
                            () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                data = File(image!.path);
                              });
                            },
                            () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                data = File(image!.path);
                              });
                            },
                          );
                        },
                        child: Container(
                          height: 128 * h,
                          width: 128 * h,
                          decoration: BoxDecoration(
                            color: AppTheme.greyF5,
                            borderRadius: BorderRadius.circular(
                              11 * h,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/gallery.svg",
                              ),
                              SizedBox(height: 18*h,),
                              Container(
                                margin: EdgeInsets.only(left: 13.5*w, right: 13.5*w),
                                child: Text("Click here to upload a photo",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppTheme.grey,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.5*o,
                                  fontWeight: FontWeight.normal,

                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              data!,
                              height: 128 * h,
                              width: 128 * h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 4 * h,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    data = null;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 90 * w),
                                  child: SvgPicture.asset(
                                    "assets/icons/close.svg",
                                    height: 24 * o,
                                    width: 24 * o,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                SizedBox(
                  height: 48 * h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = true;
                            });
                          },
                          child: Container(
                            height: 72 * o,
                            width: 72 * o,
                            padding: EdgeInsets.only(top: 12 * h),
                            decoration: BoxDecoration(
                              color: gender ? Colors.blue : AppTheme.greyDE,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/boy.svg",
                              height: 72 * o,
                              width: 72 * o,
                            ),
                          ),
                        ),
                        SizedBox(height: 8 * h),
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
                    SizedBox(
                      width: 38 * w,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = false;
                            });
                          },
                          child: Container(
                            height: 72 * o,
                            width: 72 * o,
                            padding: EdgeInsets.only(top: 12 * h),
                            decoration: BoxDecoration(
                              color: !gender ? Colors.blue : AppTheme.greyDE,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/girl.svg",
                              height: 72 * o,
                              width: 72 * o,
                            ),
                          ),
                        ),
                        SizedBox(height: 8 * h),
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
                  ],
                ),
                SizedBox(
                  height: 28 * h,
                ),
                Container(
                  height: 56 * h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16 * w),
                  padding: EdgeInsets.only(left: 16 * w, top: 3*h),
                  decoration: BoxDecoration(
                    color: AppTheme.milk,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white),
                  ),
                  child:   TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: AppTheme.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 152 * h,
                ),
                GestureDetector(
                  onTap: () async {
                    if (_controller.text.length >= 4) {
                      var image = data == null ? "" : data!.path;
                      int userId = await _repository.saveProducts(
                        UserModel(
                          id: 0,
                          name: _controller.text,
                          image: image,
                          gender: gender ? 1 : 0,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ServiceScreen(
                              userId: userId,
                              addUser: false,
                            );
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
                      color: AppTheme.milk,
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
                          height: 21 / 18 * h,
                        ),
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
