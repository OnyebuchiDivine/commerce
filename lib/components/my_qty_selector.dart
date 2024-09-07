import 'package:commerce/model/cart_model.dart';
import 'package:flutter/material.dart';

class MyQtySelector extends StatelessWidget {
  final int quantity;
  final CartModel cartModel;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyQtySelector(
      {super.key,
      required this.quantity,
      required this.cartModel,
      required this.onIncrement,
      required this.onDecrement
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                quantity.toString(),
              ),
            ),
          ),
           GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
