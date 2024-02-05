import 'package:flutter/material.dart';
import 'package:statemanagement_3d/models/cartitem.dart';

class CartItems extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void add(CartItem cartItem) {
    //find the productCode
    //List<CartItem> -> List<String> productCode
    var codeList = _items.map((item) => item.productCode).toList();
    var index = codeList.indexOf(cartItem.productCode);
    if (index < 0) {
      _items.add(cartItem);
    } else {
      _items[index].quantity++;
    }
    notifyListeners();
  }
}
