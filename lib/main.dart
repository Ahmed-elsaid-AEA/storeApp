import 'package:flutter/material.dart';
import 'package:store_app/pages/Home_Page.dart';
import 'package:store_app/pages/UpdateProductPage.dart';
import 'package:store_app/shared/Constants.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        kHomePage: (context) => Home_Page(),
        kUpdateProductPage: (context) => UpdateProductPage(),
      },
      initialRoute: kHomePage,
    );
  }
}
