import 'package:commerce/components/rowshim_container.dart';
import 'package:commerce/components/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.2,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.2,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: Colors.white,
                  height: screenHeight * 0.01,
                  width: screenWidth * 0.2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ShimmerContainer(),
              ),
              SizedBox(
                width: 5,
              ),
              ShimmerContainer(),
              SizedBox(
                width: 30,
              ),
              ShimmerContainer(),
              SizedBox(
                width: 30,
              ),
              ShimmerContainer(),
              SizedBox(
                width: 30,
              ),
              ShimmerContainer(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: Colors.white,
                  height: screenHeight * 0.01,
                  width: screenWidth * 0.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: Colors.white,
                  height: screenHeight * 0.01,
                  width: screenWidth * 0.2,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Container(
                
                height: screenHeight * 0.3,
                width: screenWidth * 1,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                   Column(
                     children: [
                       RowshimContainer(),
                       SizedBox(height: 20,),
                         RowshimContainer(), 
                     ],
                   ),
                                                     
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
