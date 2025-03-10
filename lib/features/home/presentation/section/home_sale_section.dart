import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/helpers/extinsions.dart';

import '../../../../widget/sale_widget.dart';
import '../widgets/home_sale_dots.dart';

class HomeSaleSection extends StatefulWidget {
  const HomeSaleSection({super.key});

  @override
  State<HomeSaleSection> createState() => _HomeSaleSectionState();
}

class _HomeSaleSectionState extends State<HomeSaleSection> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.25,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          FadeInRight(
            child: CarouselSlider(
              carouselController: _controller,
              items: [0, 1, 2].map((i) {
                return Builder(builder: (BuildContext context) {
                  return SaleWidget(
                    i: i,
                  );
                });
              }).toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                height: context.screenHeight * 0.25,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
          ),
          FadeInUpBig(
              child: HomeSaleDots(controller: _controller, current: _current)),
        ],
      ),
    );
  }
}
