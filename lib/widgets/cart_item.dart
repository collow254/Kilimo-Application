import 'dart:async';

import 'package:agric/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItem});
  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(IconlyLight.delete, color: Colors.white),

      ),
      confirmDismiss: (direction) async{

        final completer = Completer<bool>();

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Item removed from cart"),
              action: SnackBarAction(label: "Undo", onPressed: (){
                completer.complete(false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },),
            )
        );

        Timer(Duration(seconds: 3), (){
          if(!completer.isCompleted){
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        });

        return await completer.future;
      },
      child: SizedBox(
        height: 130,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.1,
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              side: BorderSide(
                width: 0.2,
                color: Colors.green.shade400,
      
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                //Product Image
                Container(
                  margin: EdgeInsets.only(right: 15),
                  width: 100,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartItem.image)
                    )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 2,),
                      Text(
                        cartItem.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Ksh ${cartItem.price}",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              onPressed: (index){
                                if (index == 0){
                                    //Decrease item
                                }else if(index==2){
                                  //Increase item
      
                                }
                              },
                              borderRadius: BorderRadius.circular(99),
                              isSelected: [true, false, true],
                              selectedColor: Theme.of(context).colorScheme.primary,
                              constraints: BoxConstraints(
                                minHeight: 30,
                                minWidth: 30,
                              ),
                              children: [
                                Icon(Icons.remove, size: 20,),
                                Text("2"),
                                Icon(Icons.add, size: 20,),
                              ],
      
                            ),
                          ),
      
                        ],
                      )
      
                    ],
                  ),
                )
              ],
            ),
          ),
      
        ),
      ),
    );
  }
}
