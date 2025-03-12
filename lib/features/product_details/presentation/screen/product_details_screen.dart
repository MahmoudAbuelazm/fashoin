import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app/core/helpers/extinsions.dart';
import 'package:store_app/core/helpers/spacing.dart';
import 'package:store_app/features/product_details/data/models/product.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  bool isOut = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        isOut = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              verticalSpacing(
                18,
              ),
              FadeInRight(
                child: const BackButton(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInDown(
                      child: Text(
                        product.category.name,
                        style: TextStyles.font25w500(context),
                      ),
                    ),
                    verticalSpacing(
                      18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: FadeInLeft(
                            child: Text(
                              product.title,
                              textAlign: TextAlign.start,
                              style: TextStyles.font24wBold(context),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: FadeInRight(
                            child: FittedBox(
                              child: RichText(
                                text: TextSpan(
                                    text: '\$',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        color: Color.fromRGBO(33, 150, 243, 1)),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: product.price.toString(),
                                          style: const TextStyle(
                                              color: ColorsManagers.charcoal,
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(
                      18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.4,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: _controller,
                      items: product.images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: i,
                              boxFit: BoxFit.contain,
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: context.screenHeight * 0.4,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: product.images.map((i) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(
                            product.images.indexOf(i),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == product.images.indexOf(i)
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              verticalSpacing(
                18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description', style: TextStyles.font24wBold(context)),
                    verticalSpacing(
                      8,
                    ),
                    AnimatedOpacity(
                      opacity: isOut ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        product.description,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize:
                                getResponsiveFontSize(context, fontSize: 25)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
