import 'package:flutter/material.dart';
import 'package:statemanagement_3d/screens/viewproducts.dart';

void main() {
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewProductsScreen(),
    );
  }
}
