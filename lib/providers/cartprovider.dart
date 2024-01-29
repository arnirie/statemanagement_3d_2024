import 'package:flutter/material.dart';
import 'package:statemanagement_3d/models/product.dart';

class CartItems extends ChangeNotifier {
  List<Product> _items = [];

  void add(Product p) {
    _items.add(p);
    notifyListeners();
  }
}
