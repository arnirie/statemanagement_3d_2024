import 'package:flutter/material.dart';
import 'package:statemanagement_3d/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  int get numberOfItems => _products.length;

  void add(Product p) {
    _products.add(p);
    notifyListeners();
  }
}
