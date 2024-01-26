import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statemanagement_3d/models/product.dart';

class ManageProduct extends StatelessWidget {
  ManageProduct({super.key, required this.addProduct});

  final Function(Product p) addProduct;
  var codeController = TextEditingController();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
//ADD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: codeController,
            decoration: InputDecoration(
                label: Text('Product Code'), border: OutlineInputBorder()),
          ),
          Gap(6),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                label: Text('Name/Description'), border: OutlineInputBorder()),
          ),
          Gap(6),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                label: Text('Price'), border: OutlineInputBorder()),
          ),
          Gap(6),
          ElevatedButton(
            onPressed: () {
              addProduct(Product(
                productCode: codeController.text,
                nameDesc: nameController.text,
                price: double.parse(priceController.text),
              ));
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
