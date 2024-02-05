import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3d/providers/cartprovider.dart';

class ViewCartScreen extends StatelessWidget {
  const ViewCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartItems>(
        builder: (_, cartItems, child) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(cartItems.items[index].productCode),
                  trailing: Text(cartItems.items[index].quantity.toString()),
                ),
              );
            },
            itemCount: cartItems.items.length,
          );
        },
      ),
    );
  }
}
