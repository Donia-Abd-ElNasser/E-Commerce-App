import 'package:ecommerce/screens/home/view/widgets/circular_item.dart';
import 'package:ecommerce/screens/home/view_model/cubit/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        if(state is HomeBrandsSuccess){
           print('===========>brandssuccess');
          return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,

              itemBuilder: (context, index) {
                return GestureDetector(onTap: () {}, child: CircularItem());
              },
            ),
          ),
        );
        }else if (state is HomeBrandsLoading){
          return Center(child: CircularProgressIndicator(),);
        }else if (state is HomeBrandsFailure){
          return Text(state.errMessage);
        }
        
        else {
          return Text('data');
        }
        
      },
    );

  }
}
