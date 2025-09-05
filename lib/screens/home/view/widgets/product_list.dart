import 'package:ecommerce/screens/home/view/widgets/products_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
            itemCount: 20,
            clipBehavior: Clip.none,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductItem();
            },
          );
  }
}
