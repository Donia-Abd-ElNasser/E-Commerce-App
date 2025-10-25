import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/screens/home/model/item_model.dart';
import 'package:flutter/material.dart';

class CircularItem extends StatelessWidget {
  const CircularItem({super.key, required this.itemModel});
  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
   
        children: [
          Container(
            width: 100,
            margin: EdgeInsets.only(right: 4),
            padding: EdgeInsets.all(10),
            height: 70,
            decoration: BoxDecoration(
              color: kButtonColor,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(
                  itemModel.image ==
                          "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"
                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDQWYcKwOO3zYaCwX8bCC0uQ1z1oFeZ1zaR1rg2avcxavwdvUFMJ9n01yUOpch31RYc0E&usqp=CAU"
                      : itemModel.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Center(
              child: Text(
                itemModel.name,
                style: TextStyle(
                  fontSize: 16,
                  color: kButtonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
