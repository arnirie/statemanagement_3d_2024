import 'package:flutter/material.dart';
import 'package:statemanagement_3d/models/product.dart';
import 'package:statemanagement_3d/providers/productsprovider.dart';
import 'package:statemanagement_3d/screens/manageproduct.dart';

class ViewProductsScreen extends StatefulWidget {
  ViewProductsScreen({super.key});

  @override
  State<ViewProductsScreen> createState() => _ViewProductsScreenState();
}

class _ViewProductsScreenState extends State<ViewProductsScreen> {
  List<Product> listProducts = [];

  void addProduct(Product p) {
    setState(() {
      listProducts.add(p);
    });
  }

  void editProduct(Product p, int index) {
    setState(() {
      listProducts[index].nameDesc = p.nameDesc;
      listProducts[index].price = p.price;
    });
  }

  void openAddScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProduct(
            // addProduct: addProduct,
            ),
      ),
    );
  }

  void openEditScreen(Product p, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProduct(
          // editProduct: editProduct,
          // product: p,
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Products'),
        actions: [
          IconButton(
            onPressed: openAddScreen,
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              onTap: () => openEditScreen(listProducts[index], index),
              title: Text(listProducts[index].nameDesc),
              subtitle: Text(listProducts[index].productCode),
            ),
          );
        },
        itemCount: listProducts.length,
      ),
    );
  }
}
