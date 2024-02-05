import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3d/providers/cartprovider.dart';
import 'package:statemanagement_3d/providers/productsprovider.dart';
import 'package:statemanagement_3d/screens/viewproducts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProductsApp());
}

class ProductsApp extends StatelessWidget {
  const ProductsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ViewProductsScreen(),
      ),
    );
  }
}
