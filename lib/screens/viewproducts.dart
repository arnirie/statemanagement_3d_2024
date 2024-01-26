import 'package:flutter/material.dart';
import 'package:statemanagement_3d/models/product.dart';
import 'package:statemanagement_3d/providers/products.dart';
import 'package:statemanagement_3d/screens/manageproduct.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  Products productProvider = Products();

  // void addProduct(Product p) {
  //   setState(() {
  //     listProducts.add(p);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    productProvider.products.add(
      Product(productCode: 'productCode', nameDesc: 'nameDesc', price: 500),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => ManageProduct(
              //       addProduct: addProduct,
              //     ),
              //   ),
              // );
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(productProvider.products[index].nameDesc),
            subtitle: Text(productProvider.products[index].productCode),
          );
        },
        itemCount: productProvider.numberOfItems,
      ),
    );
  }
}
