import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/home/model/product_model.dart';
import 'package:ecommerce/screens/favourite/view_model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final favCubit = BlocProvider.of<FavCubit>(context);
    final isFav = favCubit.isFavourite(productModel.id);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: kwidgetColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
     
            ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.network(
                productModel.imageCover,
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),

        
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      productModel.title,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: kButtonColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: kGtsectrafont,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      productModel.description,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                        fontFamily: kGtsectrafont,
                        color: kButtonColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

        
            CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 20,
              child: IconButton(
                onPressed: () async {
                  await favCubit.toggleFavourite(productModel);
                },
                icon: Icon(
                  isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  color: isFav ? Colors.red : Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
