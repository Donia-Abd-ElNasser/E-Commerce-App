import 'package:ecommerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
   
      decoration: BoxDecoration(
  color: Colors.transparent,
  borderRadius: BorderRadius.circular(40)

      ),
    
      child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: kButtonColor,
             // disabledColor: kButtonColor,
              onPressed: () {
                setState(() {
                  if (counter > 1) {
                    counter--;
                  }
                });
              },
              icon: Icon(FontAwesomeIcons.minus,size: 15,)
            ),
           SizedBox(width: 8,),
            Text(
              counter.toString(),
              style: TextStyle(
                color: kButtonColor,
                fontSize: 20,
        
                fontWeight: FontWeight.bold,
              ),
            ),  SizedBox(width: 8,),
           IconButton(
            color: kButtonColor,
            hoverColor: kButtonColor,
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              icon: Icon(FontAwesomeIcons.plus,size: 15,)
            ),
          ],
        ),
    );
  }}














// }Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
//       color: Colors.grey[200],
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (counter > 1) {
//                     counter--;
//                   }
//                 });
//               },
//               child: Text(
//                 '-',
//                 style: TextStyle(
//                   color: kButtonColor,
//                   fontSize: 18,
                 
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//            SizedBox(width: 8,),
//             Text(
//               counter.toString(),
//               style: TextStyle(
//                 color: kButtonColor,
//                 fontSize: 20,
        
//                 fontWeight: FontWeight.bold,
//               ),
//             ),  SizedBox(width: 8,),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   counter++;
//                 });
//               },
//               child: Text(
//                 '+',
//                 style: TextStyle(
//                   color: kButtonColor,
//                   fontSize: 18,
               
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );