import 'package:ecommerce/screens/home/view/widgets/products_item.dart';
import 'package:ecommerce/screens/home/view_model/cubit/home_cubit.dart';
import 'package:ecommerce/screens/product_details/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          print('===========> productsuccess');
          return GridView.builder(
            itemCount: state.products.length,
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
              return GestureDetector(onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsPage(productId: state.products[index].id)));
              },
                child: ProductItem(
                 productModel: state.products[index],
                ),
              );
            },
          );
        } else if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeFailure) {
          return Text(state.errMessage);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
