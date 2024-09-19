import 'package:commerce/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class CartPage extends StatelessWidget {
  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-a6o6q4Ge05XSlecL9vS7hA');
    InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _cardNonceRequestSuccess,
        onCardEntryCancel: _cardEntryCancel);
  }

  void _cardEntryCancel() {
    //Cancelled card Entry
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);
    InAppPayments.completeCardEntry(onCardEntryComplete: _cardEntryComplete);
  }
 
 void _cardEntryComplete(){
  //Success
 }
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
  

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.network(value.cartItems[index][2]),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text( '\$' +value.cartItems[index][1]),
                        trailing: IconButton(
                            onPressed: () =>
                                Provider.of<CartModel>(context, listen: false)
                                    .removeItemFromCart(index),
                            icon: Icon(
                              Icons.delete,
                              color: const Color.fromARGB(255, 236, 179, 204),
                            )),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text('Total Price'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text('\$' + value.calculateTotal()),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.7,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 101, 233, 193),
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: _pay, child: Text('Continue for payment')),
              )
            ],
          );
        },
      ),
    );
  }
}
