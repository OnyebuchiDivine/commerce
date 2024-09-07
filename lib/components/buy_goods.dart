import 'package:commerce/components/buy_button.dart';
import 'package:flutter/material.dart';

class BuyGoods extends StatelessWidget {
  final String image;
  final String nameText;
  final String ammount;
  const BuyGoods(
      {super.key,
      required this.image,
      required this.nameText,
      required this.ammount
      });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      width: screenWidth * 0.4,
      child: Column(
        children: [
          Container(
              child: Image.asset(image,
                  width: screenWidth * 0.7, height: screenHeight * 0.2)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(nameText),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(ammount),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BuyButton(),
        ],
      ),
    );
  }
}
