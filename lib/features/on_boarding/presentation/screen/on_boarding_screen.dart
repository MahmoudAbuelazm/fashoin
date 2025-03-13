import 'dart:async';

import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/core/routing/routes.dart';
import 'package:store_app/core/theme/colors.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/on_boarding_data.dart';
import '../section/images_shape.dart';
import '../section/title_and_description.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  bool isOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpacing(30),
            ImagesShape(
              index: currentIndex,
              isOut: isOut,
            ),
            verticalSpacing(30),
            Expanded(
              child: TitleAndDescription(
                currentIndex: currentIndex,
                isOut: isOut,
                onBoardingData: OnBoardingData.onBoardingData,
              ),
            ),
            verticalSpacing(30),
            GestureDetector(
              onTap: () {
                setState(() {
                  isOut = !isOut;
                });
                Timer(const Duration(milliseconds: 300), () {
                  currentIndex > 2
                      ? {
                          saveOnBoardingState(),
                          context.pushReplacementNamed(Routes.homeScreen),
                        }
                      : currentIndex = currentIndex + 1;

                  setState(() {
                    isOut = !isOut;
                  });
                });
              },
              child: SizedBox(
                height: 56,
                width: 56,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorsManagers.darkSkyBlue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: currentIndex == 0 || currentIndex == 3 ? 1 : null,
                      right: currentIndex == 1 || currentIndex == 0 ? 1 : null,
                      bottom: currentIndex == 1 || currentIndex == 2 ? 1 : null,
                      left: currentIndex == 2 || currentIndex == 3 ? 1 : null,
                      child: Image.asset(
                          "assets/images/${486 + currentIndex}.png"),
                    ),
                    Image.asset("assets/images/Ellipse 486.png")
                  ],
                ),
              ),
            ),
            verticalSpacing(30),
          ],
        ),
      ),
    );
  }
}

saveOnBoardingState() async {
  await CacheServices.instance.setOnBoarding(true);
}
