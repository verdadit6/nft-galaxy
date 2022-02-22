// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nftgalaxy/src/mvp/tutorial/provider/tutorial_screen_provider.dart';
import 'package:nftgalaxy/src/widgets/view/custom_elevated_button.dart';
import 'package:nftgalaxy/src/widgets/view/custom_text_button.dart';
import 'package:nftgalaxy/utilities/font/font_utilities.dart';
import 'package:nftgalaxy/utilities/route/route_utilities.dart';
import 'package:nftgalaxy/utilities/theme/theme_base.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatefulWidget {
  final int selectedIndex;
  const TutorialScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController? myPage;
  @override
  void initState() {
    myPage = PageController(initialPage: widget.selectedIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeBase().whiteColor,
      body: SafeArea(
        child: Consumer(
          builder: (BuildContext context,
              TutorialScreenProvider tutorialScreenProvider, Widget? child) {
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: tutorialScreenProvider.onPageChange,
                    children:
                        tutorialScreenProvider.tutorialScreenModelList.map((e) {
                      return Column(
                        children: [
                          tutorialScreenProvider.currentSelectedTutorialIndex ==
                                  2
                              ? SizedBox(
                                  height: 70,
                                )
                              : Column(children: [
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CustomTextButton(
                                          buttonName: "Skip",
                                          onPressed: () {
                                            tutorialScreenProvider
                                                .moveToNextPage();
                                          },
                                        ),
                                        SizedBox(
                                          width: 20,
                                        )
                                      ]),
                                  SizedBox(
                                    height: 20,
                                  )
                                ]),
                          Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(e.imageUrl ?? ""),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Consumer(
                            builder: (BuildContext context,
                                TutorialScreenProvider tutorialScreenProvider,
                                Widget? child) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  tutorialScreenProvider
                                      .tutorialScreenModelList.length,
                                  (index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: tutorialScreenProvider
                                                  .currentSelectedTutorialIndex ==
                                              index
                                          ? Container(
                                              height: 10,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: ThemeBase().primaryColor,
                                              ),
                                            )
                                          : Icon(
                                              Icons.circle,
                                              color: ThemeBase()
                                                  .tutorialCircleColor,
                                              size: 12,
                                            ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            e.tutorialName ?? "",
                            style: FontUtilities.h20(
                              fontColor: ThemeBase().tutorialNameColor,
                              fontWeight: FWT.semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            e.tutorialDiscription ?? "",
                            style: FontUtilities.h16(
                              fontColor: ThemeBase().tutorialTextColor,
                              fontWeight: FWT.regular,
                            ),
                          ),
                        ],
                      );
                    }).toList(),

                    controller: tutorialScreenProvider.pageController,
                    // ignore: prefer_const_literals_to_create_immutables
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Consumer(
                  builder: (BuildContext context,
                      TutorialScreenProvider tutorialScreenProvider,
                      Widget? child) {
                    return tutorialScreenProvider
                                .currentSelectedTutorialIndex ==
                            2
                        ? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: CustomElevatedButton(
                              height: 45,
                              width: MediaQuery.of(context).size.width - 40,
                              child: Center(
                                child: Text(
                                  "Get Started",
                                  style: FontUtilities.h18(
                                    fontColor: ThemeBase().whiteColor,
                                    fontWeight: FWT.semiBold,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  RouteUtilities.tutorialScreen,
                                  (route) =>
                                      route.toString() == RouteUtilities.route,
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomElevatedButton(
                                height: 50,
                                width: MediaQuery.of(context).size.width - 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Next',
                                      style: FontUtilities.h18(
                                          fontColor: ThemeBase().whiteColor,
                                          fontWeight: FWT.semiBold),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: ThemeBase().whiteColor,
                                      size: 25,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  tutorialScreenProvider.moveToNextPage();
                                },
                              ),
                            ),
                          );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
