import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';

class ImagesShape extends StatelessWidget {
  final int index;
  final bool isOut;
  const ImagesShape({
    super.key,
    required this.index,
    required this.isOut,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h(context),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: 260.h(context),
            left: 72.w(context),
            child: Image.asset(
              "assets/images/third_shape.png",
              fit: BoxFit.fill,
              height: 112.h(context),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: 24.h(context),
            left: isOut ? -200 : 32.w(context),
            child: Image.asset(
              images[index],
              fit: BoxFit.fill,
              height: 330.h(context),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            top: isOut ? -100 : 0.h(context),
            left: 47.w(context),
            child: FadeInDown(
              child: Image.asset(
                "assets/images/first_shape.png",
                fit: BoxFit.fill,
                height: 330.h(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> images = [
  "assets/images/first_image.png",
  "assets/images/second_image.png",
  "assets/images/third_image.png",
  "assets/images/fourth_image.png",
];
