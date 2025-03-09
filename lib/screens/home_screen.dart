import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_app/consts/global_colors.dart';

import '../widget/appbar_icons.dart';
import '../widget/feeds_widget.dart';
import '../widget/sale_widget.dart';
import 'all_products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: AppBarIcons(
            function: () {},
            icon: IconlyBold.category,
          ),
          actions: [
            AppBarIcons(
              function: () {},
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                    },
                    icon: Icon(
                      IconlyLight.search,
                      color: lightIconsColor,
                    ),
                  ),
                  hintText: "Search",
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    CarouselSlider(
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
                        height: size.height * 0.25,
                        autoPlay: true,
                        enlargeCenterPage: true,
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
                              color: _current == i
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).cardColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Latest Products",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    AppBarIcons(
                        function: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllProductsScreen(),
                              ));
                        },
                        icon: IconlyBold.arrowRight2),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  childAspectRatio: 0.7),
                          itemBuilder: (ctx, index) {
                            return const FeedsWidget();
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
