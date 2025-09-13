import 'package:ecommerce/screens/home/view/widgets/products_item.dart';
import 'package:ecommerce/screens/home/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        if(state is HomeProductsSuccess){
           print('===========>productsuccess');
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
        }else if (state is HomeAllProductLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is HomeAllProductsFailure){
          return Text(state.errMessage);
        }else {
          
         
            return Text('state.errMessage');
        }
       
      },
    );
  }
}
