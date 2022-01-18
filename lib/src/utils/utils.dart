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

        }
      case 3:
        {
          return "assets/images/youtube.png";

        }
      case 4:
        {
          return "assets/images/twitter.png";

        }
      case 5:
        {
          return "assets/images/steam.png";

        }
      case 6:
        {
          return "assets/images/facebook.png";

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

        }
      case 3:
        {
          return "Youtube";
        }
      case 4:
        {
          return "Twitter";
        }
      case 5:
        {
          return "Steam";
        }
      case 6:
        {
          return "Facebook";
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
        }
      case 3:
        {
          return "Wed";
        }
      case 4:
        {
          return "Thu";
        }
      case 5:
        {
          return "Fri";
        }
      case 6:
        {
          return "Sat";
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
            child: const Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text, style: const TextStyle(fontSize: 24)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static String getWeek(int now) {
    if (now == 1) {
      return "Du";
    } else if (now == 2) {
      return "Se";
    } else if (now == 3) {
      return "Chor";
    } else if (now == 4) {
      return "Pay";
    } else if (now == 5) {
      return "Ju";
    } else if (now == 6) {
      return "Sha";
    } else {
      return "Yak";
    }
  }

  static String getMonth(int now) {
    if (now == 1) {
      return "Yanvar";
    } else if (now == 2) {
      return "Fevral";
    } else if (now == 3) {
      return "Mart";
    } else if (now == 4) {
      return "April";
    } else if (now == 5) {
      return "May";
    } else if (now == 6) {
      return "Iyun";
    } else if (now == 7) {
      return "Iyul";
    } else if (now == 8) {
      return "Avgust";
    } else if (now == 9) {
      return "Sentabr";
    } else if (now == 10) {
      return "Octabr";
    } else if (now == 11) {
      return "Noyabr";
    } else {
      return "Dekabr";
    }
  }

  static Color getColor(int id) {
    if (id == 1) {
      return AppTheme.white;
    } else if (id == 2) {
      return AppTheme.lightGrey;
    } else if (id == 3) {
      return AppTheme.lightBlue;
    } else if (id == 4) {
      return AppTheme.lightGreen;
    } else if (id == 5) {
      return AppTheme.lightYellow;
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
