// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TutorialScreenModel {
  final String? tutorialName;
  final String? tutorialDiscription;
  final String? imageUrl;
  final int? index;
  TutorialScreenModel(
      {Key? key,
      this.tutorialName,
      this.tutorialDiscription,
      this.imageUrl,
      this.index});
}
