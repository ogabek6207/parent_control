import 'package:flutter/cupertino.dart';

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
          return "assets/images/twitter.png";
          break;
        }
      case 4:
        {
          return "assets/images/youtube.png";
          break;
        }
      case 5:
        {
          return "assets/images/twitter.png";
          break;
        }
      case 6:
        {
          return "assets/images/steam.png";
          break;
        }
      default:
        {
          return "";
        }
    }
  }

}
