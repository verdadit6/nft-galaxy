import 'package:nftgalaxy/src/mvp/tutorial/provider/tutorial_screen_provider.dart';
import 'package:provider/provider.dart';

class ProviderBind {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<TutorialScreenProvider>(
      create: (context) => TutorialScreenProvider(),
    ),
  ];
}
