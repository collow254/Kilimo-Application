import 'package:agric/models/products.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../data/products.dart';

class  ProductDetailsPage  extends StatefulWidget {
  const ProductDetailsPage ({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}


class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool showingMore = false;
  late TapGestureRecognizer readMoreGestureRecognizer;


  @override
  void initState() {
    readMoreGestureRecognizer = TapGestureRecognizer()..onTap = (){
       setState(() {
          showingMore = !showingMore;
       });
    };
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    readMoreGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(IconlyLight.bookmark),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  widget.product.image,
                ),
              ),
            ),
          ),
          Text(widget.product.name, style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Available in stock", style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),),
              RichText(text: TextSpan(
                children: [
                  TextSpan(
                      text: '\$${widget.product.price}',
                      style: Theme.of(context).textTheme.titleLarge
                  ),
                  TextSpan(
                      text: "/${widget.product.unit}",
                      style: Theme.of(context).textTheme.bodySmall
                  )
                ],

              )),
            ],
          ),
          const SizedBox(height: 10,),

          Row(
            children: [
              Icon(
                Icons.star,
                size: 16,
                color: Colors.yellow.shade600,
              ),
              Text('${widget.product.rating}(192)'),
              Spacer(),

              SizedBox(
                  width:30,
                  height: 30,
                  child: IconButton.filled(onPressed: (){},
                      padding: EdgeInsets.zero,
                      iconSize: 18,
                      icon: Icon(Icons.remove))),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,),
                child: Text('5 ${widget.product.unit}', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
              ),

              SizedBox(
                  width:30,
                  height: 30,
                  child: IconButton.filled(onPressed: (){},
                      padding: EdgeInsets.zero,
                      iconSize: 18,
                      icon: Icon(Icons.add))),
            ],
          ),
          const SizedBox(height: 20,),
          Text("Description", style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 5,),
          RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                        text: showingMore
                            ?widget.product.description
                            :"${widget.product.description.substring(0,widget.product.description.length - 100)}...",
                    ),
                    TextSpan(
                      recognizer: readMoreGestureRecognizer,
                      text: showingMore? ' Read Less': 'Read More',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary )
                    )
                  ]
              )),
          const SizedBox(height: 20,),
          Text("Related Products", style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 10,),
          SizedBox(
            height: 90,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
              return Container(
                height: 90,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                  image: AssetImage(products[index].image
                  )
                  )
                ),
              );
            }, separatorBuilder: (context, index)=> SizedBox(width: 10,), itemCount: products.length),
          ),
          const SizedBox(height: 20,),
          FilledButton.icon(onPressed: (){}, label: Text("Add To Cart"), icon: Icon(IconlyLight.bag2),),


        ],
      ),
    );
  }
}












