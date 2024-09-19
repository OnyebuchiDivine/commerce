
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Categoryshimmer extends StatelessWidget {
  
  const Categoryshimmer({super.key});

  @override
  Widget build(BuildContext context) {
   
    double screenHeight = MediaQuery.of(context).size.height;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
        height:screenHeight *0.5 ,
      )
      );
  }
}