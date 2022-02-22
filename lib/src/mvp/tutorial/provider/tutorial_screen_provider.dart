import 'package:flutter/cupertino.dart';
import 'package:nftgalaxy/src/mvp/tutorial/model/tutorial_screen_model.dart';
import 'package:nftgalaxy/utilities/asset/asset_utilities.dart';

class TutorialScreenProvider extends ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int _currentSelectedTutorialIndex = 0;

  List<TutorialScreenModel> tutorialScreenModelList = [
    TutorialScreenModel(
      imageUrl: AssetUtilities.tutorial1Image,
      index: 0,
      tutorialDiscription:
          'Each Idea Instantly Backed\n         to The Blockchain',
      tutorialName: 'Create Your NFT',
    ),
    TutorialScreenModel(
      imageUrl: AssetUtilities.tutorial2Image,
      index: 1,
      tutorialDiscription:
          'Use Trust Wallet or Metamask to\n             connect to the app',
      tutorialName: 'Connect Your Wallet',
    ),
    TutorialScreenModel(
      imageUrl: AssetUtilities.tutorial3Image,
      tutorialDiscription:
          'The Best Platform to Buy and Sell \n            NFT Quickly and Easily',
      tutorialName: 'Search Best NFT with Us',
      index: 2,
    ),
  ];
  int get currentSelectedTutorialIndex => _currentSelectedTutorialIndex;
  set currentSelectedTutorialIndex(int value) {
    _currentSelectedTutorialIndex = value;
    notifyListeners();
  }

  void onPageChange(int currentPageIndex) {
    currentSelectedTutorialIndex = currentPageIndex;
  }

  void moveToNextPage() {
    incrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  void incrementCurrentPageIndex() {
    if (currentSelectedTutorialIndex != tutorialScreenModelList.length - 1) {
      currentSelectedTutorialIndex = currentSelectedTutorialIndex + 1;
    }
  }

  void moveToPreviousPage() {
    decrementCurrentPageIndex();
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }

  void decrementCurrentPageIndex() {
    if (currentSelectedTutorialIndex != 0) {
      currentSelectedTutorialIndex = currentSelectedTutorialIndex - 1;
    }
  }

  void skipTutorialScreen() {
    if (currentSelectedTutorialIndex != tutorialScreenModelList.length - 1) {
      currentSelectedTutorialIndex = tutorialScreenModelList.length - 1;
    }
    pageController.animateToPage(
      currentSelectedTutorialIndex,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
  }
}
