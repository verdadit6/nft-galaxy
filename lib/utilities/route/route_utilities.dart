import 'package:flutter/material.dart';
import 'package:nftgalaxy/src/mvp/splash/view/splash_screen.dart';
import 'package:nftgalaxy/src/mvp/tutorial/view/tutorial_screen.dart';

class RouteUtilities {
  static const String route = '/';
  static const String splashScreen = '/splashScreen';
  static const String tutorialScreen = '/tutorialScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name ?? RouteUtilities.route;
    switch (routeName) {
      case RouteUtilities.route:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteUtilities.tutorialScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const TutorialScreen(),
        );
    }
  }
}
