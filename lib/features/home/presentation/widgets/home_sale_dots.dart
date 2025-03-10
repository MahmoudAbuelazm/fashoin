import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeSaleDots extends StatelessWidget {
  const HomeSaleDots({
    super.key,
    required CarouselSliderController controller,
    required int current,
  }) : _controller = controller, _current = current;

  final CarouselSliderController _controller;
  final int _current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1, 2].map((i) {
        return GestureDetector(
          onTap: () => _controller.animateToPage(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(
                vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == i
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).cardColor,
            ),
          ),
        );
      }).toList(),
    );
  }
}