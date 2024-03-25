import 'package:agric/data/products.dart';
import 'package:agric/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(4).toList();
    final totalPrice = cartItems
        .map((e) => e.price)
        .reduce((value, element) => value+element);
    return Scaffold(
     body: ListView(
       padding: EdgeInsets.all(16),
       children: [
         //List of Cart Items
         ...List.generate(cartItems.length, (index) {
           return Padding(
             padding: const EdgeInsets.only(bottom: 10),
             child: CartItem(cartItem: cartItems[index]),
           );
         } ),

         SizedBox(height: 15,),
         //Total items in cart and total price
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("Total (${cartItems.length})"),
             Text("Ksh. ${totalPrice}", style: Theme.of(context).textTheme.titleMedium?.copyWith(
               fontWeight: FontWeight.bold,
               color: Theme.of(context).colorScheme.primary,
             ),),
           ],
         ),

         SizedBox(height: 20,),
         FilledButton.icon(onPressed: (){}, icon: Icon(IconlyBold.arrowRight2), label: Text("Proceed to checkout"),)
         //Checkout Button

       ],
     ),
    );
  }
}
