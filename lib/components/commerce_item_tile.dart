import 'package:commerce/components/my_qty_selector.dart';
import 'package:commerce/model/cart_model.dart';
import 'package:flutter/material.dart';

class CommerceItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  CommerceItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(
            imagePath,
            height: 100,
          ),
          Text(itemName),
          Text('\$' + itemPrice),
          MaterialButton(
            onPressed: onPressed,
            color: Color.fromARGB(255, 101, 233, 193),
            child: Text('Add to cart'),
          ),
          // MyQtySelector(
          //     quantity: cartItems.quantity,
          //     cartModel: cartItems.cartModel,
          //     onIncrement:(){
          //       cartItems.removeItemFromCart(cartItems);
          //     },
               
          //     onDecrement: (){
          //       cartItems.addItemFromCart(cartItems);
          //     })
        ],
      ),
    );
  }
  // get cartItems => cartItems;
}
