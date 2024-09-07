import 'package:flutter/material.dart';

class RowshimContainer extends StatelessWidget {
  const RowshimContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            width: screenWidth * 0.4,
            height: screenHeight * 0.2,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          width: screenWidth * 0.4,
          height: screenHeight * 0.2,
        ),
      ],
    );
  }
}
