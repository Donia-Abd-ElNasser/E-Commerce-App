import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/utills/services.dart';
import 'package:ecommerce/screens/home/view/widgets/brands_list.dart';
import 'package:ecommerce/screens/home/view/widgets/categories_list.dart';
import 'package:ecommerce/screens/home/view/widgets/custom_navigation_bar.dart';
import 'package:ecommerce/screens/home/view/widgets/header_text.dart';
import 'package:ecommerce/screens/home/view/widgets/home_app_bar.dart';
import 'package:ecommerce/screens/home/view/widgets/product_list.dart';
import 'package:ecommerce/screens/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<String> sliders = [
    'assets/images/sliders/Slider 1.jpg',
    'assets/images/sliders/slider 2.webp',
    'assets/images/sliders/slider 3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(ApiServices())..fetchAllCategories()..fetchAllBrands()..fetchAllProducts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: HomeAppBar(),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
           
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount: sliders.length,
                      itemBuilder:
                          (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) => ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(
                              sliders[itemIndex],
                              fit: BoxFit.cover,
                            ),
                          ),
                      options: CarouselOptions(
                        autoPlay: false,
                        height: 150,
                        aspectRatio: 1,
                        viewportFraction: 0.67,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayCurve: Curves.easeIn,
                      ),
                    ),

                    const HeaderText(text: 'Categories'),
                    const CategoriesList(),
                    const HeaderText(text: 'Brands'),

                    //
                  ],
                ),
              ),
              SliverToBoxAdapter(child: const BrandsList()),
              SliverToBoxAdapter(child: const HeaderText(text: 'All Products')),
              SliverToBoxAdapter(child: ProductList()),
            ],
          ),
        ),
        bottomNavigationBar: const CustomNavigationBar(),
      ),
    );
  }
}
