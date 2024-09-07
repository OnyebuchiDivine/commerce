import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  //list of items on sale
  final List _shopItems = [
    // itemname, itemprice,imagepath

    [
      'Mug',
      "199.99",
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/cup.png?alt=media&token=6d01f669-535b-4a5f-8f0f-c07ac924d981",
      Colors.blue
    ],
    [
      'Monitor LG 22inc 4k...',
      "299.99",
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/desktop.png?alt=media&token=e8fe9e61-2e9d-4abe-92d7-d9ba3396a810",
      Colors.yellow
    ],
    [
      'Head Phones',
      "39.99",
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/headphone.png?alt=media&token=11ac5bf5-7b2f-4fcf-9c0b-2a9af1252f98",
      Colors.red
    ],

    [
      'Ear pods',
      "4.99",
      "https://firebasestorage.googleapis.com/v0/b/ecommerce-7b7f0.appspot.com/o/pod.png?alt=media&token=a9144c01-8b85-44c8-92b3-40b1b2b14c8f",
      Colors.green
    ],
  ];

  // list of cart

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  // add item to cart

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  //remove item from cart

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
