import 'package:flutter/material.dart';
import 'package:statemanagement_3d/helpers/dbhelper.dart';
import 'package:statemanagement_3d/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = [];

  // List<Product> get items {
  //   return _items;
  // }

  Future<List<Product>> get items async {
    //convert
    var listFromDb = await DbHelper.fetchProducts();
    _items = listFromDb.map((item) => Product.fromMap(item)).toList();
    print('convert from map');
    return _items;
  }

  //from db: List<Map<String, dynamic>>
  //store List<Product>

  int get totalNoItems => _items.length;

  Product item(int index) => _items[index];

  void add(Product p) {
    // _items.add(p);
    DbHelper.insertProduct(p);
    notifyListeners();
  }

  void edit(Product p, int index) {
    _items[index] = p;
    notifyListeners();
  }

  void toggleFavorite(int index) {
    _items[index].isFavorite = !_items[index].isFavorite;
    notifyListeners();
  }
}
