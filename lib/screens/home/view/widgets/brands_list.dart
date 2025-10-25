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
        if (state is HomeSuccess) {
          print('===========> brandssuccess');
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.brands.length,
                itemBuilder: (context, index) {
                  return CircularItem(itemModel: state.brands[index]);
                },
              ),
            ),
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
