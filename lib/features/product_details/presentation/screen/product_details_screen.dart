import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

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
  final titleStyle = const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 18,
              ),
              const BackButton(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Category",
                      style:
                          TextStyles.font20w500(context),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Text(
                            "Lorem Ipsum",
                            textAlign: TextAlign.start,
                            style: titleStyle,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            child: RichText(
                              text: const TextSpan(
                                  text: '\$',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Color.fromRGBO(33, 150, 243, 1)),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "168.00",
                                        style: TextStyle(
                                            color:ColorsManagers. charcoal,
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: _controller,

                      items: [0, 1, 2].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return FancyShimmerImage(
                              width: double.infinity,
                              imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                              boxFit: BoxFit.contain,
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
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
                              color: _current == i ? Colors.red : Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description', style: titleStyle),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 25),
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
