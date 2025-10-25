import 'package:ecommerce/core/constants.dart';

import 'package:ecommerce/screens/favourite/view/widgets/fav_app_bar.dart';
import 'package:ecommerce/screens/favourite/view/widgets/fav_card.dart';
import 'package:ecommerce/screens/favourite/view_model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FavAppBar(),
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              if (state is FavLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FavSuccess) {
                if (state.items.isEmpty) {
                  return const Center(child: Text("No favourites yet."));
                }
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return FavouriteCard(
                      productModel: state.items[index],
                    );
                  },
                );
              } else if (state is FavFailure) {
                print('henaaaaaaaaaaaaaaaa${state.errMessage}');
                return Center(child: Text(state.errMessage));
              } else {
                return const Center(child: Text('No data'));
              }
            },
          ),
        ),
      ),
    );
  }
}
