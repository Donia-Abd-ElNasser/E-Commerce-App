import 'package:ecommerce/screens/home/view/widgets/circular_item.dart';
import 'package:flutter/material.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          
          itemBuilder: (context,index){
          
          return GestureDetector(
            onTap: (){},
            child: CircularItem());
        
        }
        ),
      ),
    );
  }
}