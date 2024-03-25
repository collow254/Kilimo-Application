import 'package:agric/models/products.dart';
import 'package:agric/pages/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>ProductDetailsPage(product: product)));
      },
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              alignment: Alignment.topRight,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.image),
                  fit: BoxFit.cover,
      
                )
              ),
              child: SizedBox(
                  width:30,
                  height: 30,
                  child: IconButton.filledTonal(onPressed: (){},
                      padding: EdgeInsets.zero,
                      iconSize: 18,
                      icon: Icon(IconlyLight.bookmark))),
            ),
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name, style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: '\$${product.price}',
                              style: Theme.of(context).textTheme.bodyLarge
                          ),
                          TextSpan(
                              text: "/${product.unit}",
                              style: Theme.of(context).textTheme.bodySmall
                          )
                        ],
      
                      )),
                      SizedBox(
                        width: 25,
                          height: 25,
                          child: IconButton.filled(
                            padding: EdgeInsets.zero,
                              onPressed: (){},
                              icon: Icon(Icons.add)
                          )
                      )
      
                    ],
      
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
