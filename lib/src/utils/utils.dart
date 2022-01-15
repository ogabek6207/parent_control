import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_control/src/app%20theme/app_theme.dart';

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

  static String getWeek(int now) {
    if (now == 1) {
      return "Mon";
    } else if (now == 2) {
      return "Tue";
    } else if (now == 3) {
      return "Wed";
    } else if (now == 4) {
      return "Thu";
    } else if (now == 5) {
      return "Fri";
    } else if (now == 6) {
      return "Sat";
    } else {
      return "Sun";
    }
  }

  static String getMonth(int now) {
    if (now == 1) {
      return "January";
    } else if (now == 2) {
      return "February";
    } else if (now == 3) {
      return "March";
    } else if (now == 4) {
      return "April";
    } else if (now == 5) {
      return "May";
    } else if (now == 6) {
      return "June";
    } else if (now == 7) {
      return "July";
    } else if (now == 8) {
      return "August";
    } else if (now == 9) {
      return "September";
    } else if (now == 10) {
      return "October";
    } else if (now == 11) {
      return "November";
    } else {
      return "December";
    }
  }

  static Color getColor(int id) {
    if (id == 1) {
      return AppTheme.white;
    } else if (id == 2) {
      return AppTheme.light_grey;
    } else if (id == 3) {
      return AppTheme.light_blue;
    } else if (id == 4) {
      return AppTheme.light_green;
    } else if (id == 5) {
      return AppTheme.light_yellow;
    } else if (id == 6) {
      return AppTheme.peach;
    } else if (id == 7) {
      return AppTheme.rose;
    } else if (id == 8) {
      return AppTheme.lilac;
    } else if (id == 9) {
      return AppTheme.lilacA2;
    } else {
      return AppTheme.lilac6B;
    }
  }
}
