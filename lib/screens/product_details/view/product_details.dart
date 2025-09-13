import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/product_details/view_model/product_cubit/product_cubit.dart';
import 'package:ecommerce/screens/product_details/view_model/product_cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';




class ProductDetailsPage extends StatefulWidget {
  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavourite = false;
  int _currentIndex = 0;

  @override
  // void initState() {
  //   super.initState();
  //  BlocProvider.of<ProductCubit>(context).fetchProductDetails(widget.productId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is ProductLoaded) {
            final product = state.product;

            return Column(
              children: [
                /// --- Images ---
                Stack(
                  children: [
                    CarouselSlider(
                      items: product.images.map((img) {
                        return Container(
                          margin: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 350,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),

                    /// --- Back button ---
                    Positioned(
                      top: 40,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          icon: Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: const Icon(Icons.arrow_back_ios, color: kButtonColor),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                    /// --- Fav button ---
                    Positioned(
                      top: 40,
                      right: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: IconButton(
                          icon: Icon(
                            isFavourite ? Icons.favorite : Icons.favorite_border,
                            color: isFavourite ? Colors.red : kButtonColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                        ),
                      ),
                    ),

                    /// --- Dots indicators ---
                    Positioned(
                      left: 8,
                      top: 140,
                      child: Column(
                        children: List.generate(
                          product.images.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? kButtonColor
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// --- Product Info ---
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         ' product.title',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            Text("{product.rating} ({product.reviews} Reviews)"),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "£{product.price}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.favorite_border,color: kButtonColor,),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share,color: kButtonColor,),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Add to basket logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kButtonColor,
                                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
