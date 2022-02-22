// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nftgalaxy/utilities/asset/asset_utilities.dart';
import 'package:nftgalaxy/utilities/font/font_utilities.dart';
import 'package:nftgalaxy/utilities/route/route_utilities.dart';
import 'package:nftgalaxy/utilities/settings/variable_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      timer.cancel();

      String firstTutorialScreen = RouteUtilities.tutorialScreen;

      Navigator.pushReplacementNamed(context, firstTutorialScreen,
          arguments: {});
    });
  }

  Future<void> initializeSettings() async {
    VariableUtilities.prefs = await SharedPreferences.getInstance();

    startTimer();
  }

  @override
  void initState() {
    initializeSettings();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              AssetUtilities.splashScreenImage,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetUtilities.logo),
              SizedBox(height: 30),
              Text(
                "NFT Galaxy",
                style: FontUtilities.h34(
                  fontColor: Color(0xffb8b8ff),
                  fontWeight: FWT.semiBold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
