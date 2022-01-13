import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';
import 'package:parent_control/src/bloc/home_bloc.dart';
import 'package:parent_control/src/dialog/bottom_dialog.dart';
import 'package:parent_control/src/model/user_model.dart';
import 'package:parent_control/src/repository/repository.dart';
import 'package:parent_control/src/ui/add_child/add_child_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class ServiceChildScreen extends StatefulWidget {
  final String image;
  final String name;
  final int gender;
  final int userId;
  final int userCount;

  const ServiceChildScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.userId,
    required this.gender,
    required this.userCount,
  }) : super(key: key);

  @override
  _AddChildScreenTwoState createState() => _AddChildScreenTwoState();
}

class _AddChildScreenTwoState extends State<ServiceChildScreen> {
  final ImagePicker _picker = ImagePicker();
  final Repository _repository = Repository();
  final TextEditingController _controller = TextEditingController();
  File? data;
  int gender = 1;

  @override
  void initState() {
    if (widget.image != "") {
      data = File(widget.image);
    }
    gender = widget.gender;
    _controller.text = widget.name;
    setState(() {});
    super.initState();
  }

  int k = 0;

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
            height: 32 * h,
          ),
          SizedBox(
            height: 56 * h,
            child: Row(
              children: [
                SizedBox(
                  width: 16 * w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * w,
                    ),
                    color: Colors.transparent,
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 24 * h,
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Profile setting",
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 22 * o,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 26 / 22 * h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 32 * w + 24 * h,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                top: 26 * h,
                left: 16 * w,
                right: 16 * w,
                bottom: 24 * h
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8 * o),
                color: AppTheme.white,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 40 * h,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      data == null
                          ? GestureDetector(
                              onTap: () {
                                BottomDialog.showGalleryDialog(
                                  context,
                                  () async {
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.gallery);
                                    setState(() {
                                      data = File(image!.path);
                                    });
                                  },
                                  () async {
                                    final XFile? image = await _picker
                                        .pickImage(source: ImageSource.camera);
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
                                    SizedBox(
                                      height: 18 * h,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 13.5 * w, right: 13.5 * w),
                                      child: Text(
                                        "Click here to upload a photo",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: AppTheme.grey,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13.5 * o,
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
                      const Spacer(),
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
                                gender = 1;
                              });
                            },
                            child: Container(
                              height: 72 * o,
                              width: 72 * o,
                              padding: EdgeInsets.only(top: 12 * h),
                              decoration: BoxDecoration(
                                color:
                                    gender == 1 ? Colors.blue : AppTheme.greyDE,
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
                                gender = 0;
                              });
                            },
                            child: Container(
                              height: 72 * o,
                              width: 72 * o,
                              padding: EdgeInsets.only(top: 12 * h),
                              decoration: BoxDecoration(
                                color:
                                    gender == 0 ? Colors.blue : AppTheme.greyDE,
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
                    padding: EdgeInsets.only(left: 16 * w, top: 3 * h),
                    decoration: BoxDecoration(
                      color: AppTheme.milk,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextField(
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
                    height: 100 * h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_controller.text.length >= 4) {
                        var image = data == null ? "" : data!.path;
                        int userId = await _repository.updateProduct(
                          UserModel(
                            id: widget.userId,
                            name: _controller.text,
                            image: image,
                            gender: gender,
                          ),
                        );
                        if (userId >= 0) {
                          Navigator.pop(context);
                          homeBloc.getUsers();
                        }
                      }
                    },
                    child: Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 40 * w),
                      decoration: BoxDecoration(
                        color: AppTheme.blue,
                        borderRadius: BorderRadius.circular(32 * o),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            height: 21 / 18 * h,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12 * h),
                  GestureDetector(
                    onTap: () async {
                      var user =
                          await _repository.deleteProducts(widget.userId);
                      await _repository.deleteSocialUser(widget.userId);
                      if (user >= 0) {
                        if (widget.userCount == 1) {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const AddChildScreen();
                              },
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                          homeBloc.getUsers();
                        }
                      }
                    },
                    child: Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 40 * w),
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(32 * o),
                      ),
                      child: Center(
                        child: Text(
                          "Delete profile",
                          style: TextStyle(
                            color: AppTheme.red4C,
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
          ),
        ],
      ),
    );
  }
}
