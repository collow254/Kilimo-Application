import 'package:agric/data/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../widgets/product_card.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //search and filter
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search here...",
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(99))
                    ),
                      prefixIcon: Icon(IconlyLight.search)
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton.filled(onPressed: (){}, icon: Icon(IconlyLight.filter)),
                ),
              ],
            ),
          ),

          //Consultation Card
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
                height: 170,
                child: Card(
                  color: Colors.green.shade50,
                  elevation: 0.1,
                  shadowColor: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        //Text
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Text("Consult Us", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                color: Colors.green.shade700
                              ),
                              ),
                              Text("Get 24 hours free support from our customer service"),
                              FilledButton(onPressed: (){}, child: Text("Call now"))
                            ],
                          ),
                        ),
                        //Image

                        Image.asset('assets/contact.jpg', width: 140,)

                      ],
                    ),
                  ),
                )),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured Products", style: Theme.of(context).textTheme.titleMedium,),
              TextButton(onPressed: (){}, child: const Text("See All"))
            ],
          ),

          //Featured products

          GridView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
                childAspectRatio: 0.9,
          ), itemBuilder: (context, index){
            return ProductCard(
              product: products[index],
            );
          })


        ],
      ),
    );
  }
}
