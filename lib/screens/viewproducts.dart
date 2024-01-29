import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3d/models/product.dart';
import 'package:statemanagement_3d/providers/productsprovider.dart';
import 'package:statemanagement_3d/screens/manageproduct.dart';

class ViewProductsScreen extends StatelessWidget {
  ViewProductsScreen({super.key});

  void openAddScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProduct(),
      ),
    );
  }

  void openEditScreen(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ManageProduct(
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
            onPressed: () => openAddScreen(context),
            icon: Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Consumer<Products>(
        builder: (_, provider, child) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  onTap: () => openEditScreen(context, index),
                  leading: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(index);
                    },
                    icon: Icon(
                      provider.items[index].isFavorite
                          ? Icons.favorite
                          : Icons.favorite_outline,
                    ),
                  ),
                  title: Text(provider.items[index].nameDesc),
                  subtitle: Text(provider.items[index].productCode),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.shopping_cart),
                  ),
                ),
              );
            },
            itemCount: provider.totalNoItems,
          );
        },
      ),
    );
  }
}
