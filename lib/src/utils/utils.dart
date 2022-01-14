import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static double windowHeight(BuildContext context) {
    return MediaQuery.of(context).size.height / 812;
  }

  static double windowWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 375;
  }

  static String socialImage(int id) {
    switch (id) {
      case 1:
        {
          return "assets/images/instagram.png";
        }
      case 2:
        {
          return "assets/images/tiktok.png";
          break;
        }
      case 3:
        {
          return "assets/images/youtube.png";
          break;
        }
      case 4:
        {
          return "assets/images/twitter.png";
          break;
        }
      case 5:
        {
          return "assets/images/steam.png";
          break;
        }
      case 6:
        {
          return "assets/images/facebook.png";
          break;
        }
      default:
        {
          return "";
        }
    }
  }

  static String socialName(int id) {
    switch (id) {
      case 1:
        {
          return "instagram";
        }
      case 2:
        {
          return "Tiktok";
          break;
        }
      case 3:
        {
          return "Youtube";
          break;
        }
      case 4:
        {
          return "Twitter";
          break;
        }
      case 5:
        {
          return "Steam";
          break;
        }
      case 6:
        {
          return "Facebook";
          break;
        }
      default:
        {
          return "";
        }
    }
  }

  static String weekDay(int day) {
    switch (day) {
      case 1:
        {
          return "Mon";
        }
      case 2:
        {
          return "Tue";
          break;
        }
      case 3:
        {
          return "Wed";
          break;
        }
      case 4:
        {
          return "Thu";
          break;
        }
      case 5:
        {
          return "Fri";
          break;
        }
      case 6:
        {
          return "Sat";
          break;
        }
      default:
        {
          return "Sun";
        }
    }
  }
  static void showSheet(
      BuildContext context, {
        required Widget child,
        required VoidCallback onClicked,
      }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );
  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
