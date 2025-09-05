// import 'dart:convert';
// import 'package:flutter/material.dart';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:http/http.dart' as http;

// class ProductDetailsView extends StatefulWidget {
//   final String productId; // هنبعته من صفحة تانية

//   const ProductDetailsView({super.key, required this.productId});

//   @override
//   State<ProductDetailsView> createState() => _ProductDetailsViewState();
// }

// class _ProductDetailsViewState extends State<ProductDetailsView> {
//   Map<String, dynamic>? product;
//   bool isFavourite = false;
//   int _currentIndex = 0;

//   Future<void> fetchProductDetails() async {
//     final url =
//         Uri.parse("https://ecommerce.routemisr.com/api/v1/products/${widget.productId}");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         product = data['data'];
//       });
//     } else {
//       throw Exception("Failed to load product");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchProductDetails();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: product == null
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 /// --- Images with Slider ---
//                 Stack(
//                   children: [
//                     CarouselSlider(
//                       items: (product!['images'] as List)
//                           .map((img) => Container(
//                                 margin: const EdgeInsets.all(6),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                     image: NetworkImage(img),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ))
//                           .toList(),
//                       options: CarouselOptions(
//                         autoPlay: true,
//                         height: 350,
//                         viewportFraction: 1.0,
//                         onPageChanged: (index, reason) {
//                           setState(() {
//                             _currentIndex = index;
//                           });
//                         },
//                       ),
//                     ),

//                     /// --- Back button & Favourite ---
//                     Positioned(
//                       top: 40,
//                       left: 16,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         child: IconButton(
//                           icon: const Icon(Icons.arrow_back, color: Colors.black),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 40,
//                       right: 16,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         child: IconButton(
//                           icon: Icon(
//                             isFavourite ? Icons.favorite : Icons.favorite_border,
//                             color: isFavourite ? Colors.red : Colors.black,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               isFavourite = !isFavourite;
//                             });
//                           },
//                         ),
//                       ),
//                     ),

//                     /// --- Dots indicators (على الشمال) ---
//                     Positioned(
//                       left: 8,
//                       top: 140,
//                       child: Column(
//                         children: List.generate(
//                           (product!['images'] as List).length,
//                           (index) => Container(
//                             margin: const EdgeInsets.symmetric(vertical: 4),
//                             width: 8,
//                             height: 8,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: _currentIndex == index
//                                   ? Colors.black
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 /// --- Product Details Section ---
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           product!['title'] ?? "",
//                           style: const TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Row(
//                           children: [
//                             const Icon(Icons.star, color: Colors.amber, size: 20),
//                             const SizedBox(width: 4),
//                             Text("${product!['ratingsAverage']} (${product!['ratingsQuantity']} Reviews)"),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         Text(
//                           "£${product!['price']}",
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                         const Spacer(),

//                         /// --- Buttons (Favourite + Share + Add to Basket) ---
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 IconButton(
//                                   icon: const Icon(Icons.favorite_border),
//                                   onPressed: () {},
//                                 ),
//                                 IconButton(
//                                   icon: const Icon(Icons.share),
//                                   onPressed: () {},
//                                 ),
//                               ],
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // TODO: Add to basket logic
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                                 padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               child: const Text(
//                                 "Add to Cart",
//                                 style: TextStyle(color: Colors.white, fontSize: 16),
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//     );
//   }
// }
