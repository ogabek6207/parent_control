import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/src/app%20theme/app_thema.dart';
import 'package:parent_control/src/ui/dialog/center_dialog.dart';
import 'package:parent_control/src/ui/service/service_screen.dart';
import 'package:parent_control/src/utils/utils.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({Key? key}) : super(key: key);

  @override
  _AddChildScreenState createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _controller = TextEditingController();
  bool errorText = true;
  bool isLoading = false;
  File? data;
  bool girl = false;
  bool boy = false;

  @override
  void initState() {
    super.initState();
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

                data == null
                    ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.transparent,
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(
                                    left: 16 * w,
                                    right: 16 * w,
                                    bottom: 16 * h,
                                    top: 16 * h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(12 * o),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15 * h,
                                      ),
                                      Text(
                                        "photos",
                                        style: TextStyle(
                                          color: AppTheme.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15 * h,
                                      ),
                                      Container(
                                        height: 1,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        color: AppTheme.grey,
                                      ),

                                      GestureDetector(onTap: (){
                                        getGalleryData();
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 15 * h,
                                          ),
                                          Text(
                                            "From Photos",
                                            style: TextStyle(
                                              color: AppTheme.blue,
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 15 * h,
                                          ),
                                        ],
                                      ),
                                      ),

                                      Container(
                                        height: 1,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        color: AppTheme.grey,
                                      ),


                                      GestureDetector(
                                        onTap: (){
                                       getCameraData();
                                        },
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15 * h,
                                            ),



                                            Text(
                                              "Take Picture",
                                              style: TextStyle(
                                                color: AppTheme.blue,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                              GestureDetector(
                                onTap:  (){
                                  Navigator.pop(context);
                                },
                                child:    Container(height: 56*h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: BorderRadius.circular(10*o),

                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 16*w),
                                  child:



                                  Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        color: AppTheme.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),

                                ),
                              ),

                            ],
                          );
                        });
                  },
                  child: Container(
                    height: 128 * h,
                    width: 128 * h,
                    decoration: BoxDecoration(
                      color: AppTheme.greyD2,
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
                        )
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
                  children: [
                    const Spacer(),
                    Container(
                      height: 108 * h,
                      width: 72 * w,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  boy = true;
                                  girl = false;
                                });
                              },
                              child: boy
                                  ? SvgPicture.asset(
                                      "assets/icons/boy_blue.svg",
                                      height: 72 * o,
                                      width: 72 * o,
                                    )
                                  : SvgPicture.asset(
                                      "assets/icons/mask_group1.svg",
                                      height: 72 * o,
                                      width: 72 * o,
                                    ),
                            ),
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                girl = true;
                                boy = false;
                              });
                            },
                            child: girl
                                ? SvgPicture.asset(
                                    "assets/icons/girl_select.svg",
                                    height: 72 * o,
                                    width: 72 * o,
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/mask_group.svg",
                                    height: 72 * o,
                                    width: 72 * o,
                                  ),
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
                      ),
                    ),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const ServiceScreen();
                      },),);

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

  Future<void> getGalleryData() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      data = File(image!.path);
    });
  }

  Future<void> getCameraData() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      data = File(image!.path);
    });
  }
}
