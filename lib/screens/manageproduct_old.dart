import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statemanagement_3d/models/product.dart';

class ManageProduct extends StatefulWidget {
  ManageProduct({
    super.key,
    this.addProduct,
    this.editProduct,
    this.product,
    this.index,
  });

  final Function(Product p)? addProduct;
  final Function(Product p, int index)? editProduct;

  Product? product;
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
    codeController.text = widget.product?.productCode ?? '';
    nameController.text = widget.product?.nameDesc ?? '';
    priceController.text = widget.product?.price.toString() ?? '';
    // if(widget.product != null){
    //   codeController.text = widget.product!.productCode;
    // }
  }

//ADD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            // enabled: false,
            readOnly: widget.product != null,
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
              if (widget.product == null) {
                widget.addProduct!(p);
              } else {
                widget.editProduct!(p, widget.index!);
              }
              Navigator.of(context).pop();
            },
            child: Text(widget.product == null ? 'ADD' : "EDIT"),
          ),
        ],
      ),
    );
  }
}
