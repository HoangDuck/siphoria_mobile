
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils {
  static double screenWidthSize = 1080;
  static double screenHeightSize = 2160;
  static double screenWidthDesignSize = 1080;
  static double screenHeightDesignSize = 2160; //Pixel 3XL

  static double width(double value) {
    return (screenWidthSize * value) / screenWidthDesignSize;
  }

  static double height(double value) {
    return (screenHeightSize * value) / screenHeightDesignSize;
  }

  static void getScreenSize(BuildContext context) {
    screenWidthSize = MediaQuery.of(context).size.width;
    screenHeightSize = MediaQuery.of(context).size.height;
  }
  static void closeKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static BuildContext? getContext(){
    return Get.context;
  }
}