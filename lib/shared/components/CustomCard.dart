import 'package:flutter/material.dart';
import 'package:store_app/models/ProductModel.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.productModel,required this.onTap});

  ProductModel productModel;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 150,
            width: 220,
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Text(
                        '${productModel.title}',maxLines: 2,
                        style: TextStyle(color: Colors.grey, fontSize: 18, overflow: TextOverflow.ellipsis,),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModel.price}',
                            style: TextStyle(color: Colors.black, fontSize: 12), overflow: TextOverflow.ellipsis,),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: -50,
            child: Image.network(
                productModel.image,
                width: 100,
                height: 100),
          )
        ],
      ),
    );
  }
}
