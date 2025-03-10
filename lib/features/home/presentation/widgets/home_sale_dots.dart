import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'home_sale_dot.dart';

class HomeSaleDots extends StatelessWidget {
  const HomeSaleDots({
    super.key,
    required CarouselSliderController controller,
    required int current,
  })  : _controller = controller,
        _current = current;

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
          child: HomeSaleDot(current: _current, i: i),
        );
      }).toList(),
    );
  }
}
