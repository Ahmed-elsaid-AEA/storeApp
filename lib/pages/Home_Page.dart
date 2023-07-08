  import 'package:flutter/material.dart';
  import 'package:fluttertoast/fluttertoast.dart';

  import 'package:http/http.dart' as http;
  import 'package:store_app/models/ProductModel.dart';
  import 'package:store_app/services/AllProductServices.dart';
  import 'package:store_app/shared/Constants.dart';
  import 'package:store_app/shared/components/CustomCard.dart';

  class Home_Page extends StatelessWidget {
    const Home_Page({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          selectedItemColor: Colors.red,
          currentIndex: 0,
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
          title: Text(
            'New Trend',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: AllProductServices().getAllProdects(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> product = snapshot.data!;
                return GridView.builder(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.only(top: 50),
                    itemCount: product.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10
                    ),
                    itemBuilder: (BuildContext, index) => CustomCard(
                          productModel: product[index],
                      onTap: () {
                            Navigator.pushNamed(context, kUpdateProductPage,arguments: product[index]);
                      },
                        ));
              } else
                return Center(child: CircularProgressIndicator());
            }),
      );
    }
  }
