import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/styles.dart';
import '../../data/model/on_boarding_model.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.isOut,
    required this.onBoardingData,
    required this.currentIndex,
  });

  final bool isOut;
  final int currentIndex;
  final List<OnBoardingModel> onBoardingData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isOut ? 0 : 1,
            child: RichText(
              text: TextSpan(
                text: onBoardingData[currentIndex].title1,
                style: TextStyles.font24Blackw600Inter(context),
                children: [
                  TextSpan(
                    text: onBoardingData[currentIndex].title2,
                    style: currentIndex == 1 || currentIndex == 0
                        ? TextStyles.font24DarkSkyBluew600Inter(context)
                        : TextStyles.font24Blackw600Inter(context),
                  ),
                  TextSpan(
                    text: onBoardingData[currentIndex].title3,
                    style: currentIndex == 2 || currentIndex == 3
                        ? TextStyles.font24DarkSkyBluew600Inter(context)
                        : TextStyles.font24Blackw600Inter(context),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: verticalSpacing(10.h(context))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: isOut ? 0 : 1,
              child: Text(
                onBoardingData[currentIndex].description,
                style: TextStyles.font15SpanishGrayw600Inter(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
