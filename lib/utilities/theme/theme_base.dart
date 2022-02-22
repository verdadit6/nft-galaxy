// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class ThemeBase {
  final Color primaryColor;
  final Color whiteColor;
  final Color blackColor;
  final Color tutorialCircleColor;
  final Color tutorialNameColor;
  final Color tutorialTextColor;
  ThemeBase({
    this.primaryColor = const Color(0xff5F5FFF),
    this.whiteColor = const Color(0xffffffff),
    this.blackColor = const Color(0xff000000),
    this.tutorialCircleColor = const Color(0xffcfcfcf),
    this.tutorialNameColor = const Color(0xff333333),
    this.tutorialTextColor = const Color(0xff888888),
  });
}
