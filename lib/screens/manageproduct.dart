import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3d/models/product.dart';
import 'package:statemanagement_3d/providers/productsprovider.dart';

class ManageProduct extends StatefulWidget {
  ManageProduct({
    super.key,
    this.index,
  });

  int? index;

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  var codeController = TextEditingController();

  var nameController = TextEditingController();

  var priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//ADD
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Products>(context, listen: false);
    if (widget.index != null) {
      var product = provider.item(widget.index!);
      codeController.text = product.productCode;
      nameController.text = product.nameDesc;
      priceController.text = product.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.index == null ? 'Add Product' : 'Edit Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            // enabled: false,
            readOnly: widget.index != null,
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
              var p = Product(
                productCode: codeController.text,
                nameDesc: nameController.text,
                price: double.parse(priceController.text),
              );
              if (widget.index == null) {
                provider.add(p);
              } else {
                provider.edit(p, widget.index!);
              }

              Navigator.of(context).pop();
            },
            child: Text(widget.index == null ? 'ADD' : "EDIT"),
          ),
        ],
      ),
    );
  }
}
