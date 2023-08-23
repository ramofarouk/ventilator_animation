import 'package:flutter/material.dart';

class Dimension {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
