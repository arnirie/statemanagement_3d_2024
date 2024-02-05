import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_3d/helpers/dbhelper.dart';
import 'package:statemanagement_3d/models/cartitem.dart';
import 'package:statemanagement_3d/models/product.dart';
import 'package:statemanagement_3d/providers/cartprovider.dart';
import 'package:statemanagement_3d/providers/productsprovider.dart';
import 'package:statemanagement_3d/screens/manageproduct.dart';
import 'package:statemanagement_3d/screens/viewcart.dart';

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
    // DbHelper.openDb();
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
          return FutureBuilder(
            future: provider.items,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              //check if the snapshot is ready
              if (snapshot.data == null) {
                return Center(
                  child: Text('No product records found'),
                );
              }
              var prodList = snapshot.data!;
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
                          prodList[index].isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
                        ),
                      ),
                      title: Text(prodList[index].nameDesc),
                      subtitle: Text(prodList[index].productCode),
                      trailing: IconButton(
                        onPressed: () {
                          Provider.of<CartItems>(context, listen: false)
                              .add(CartItem(
                            productCode: prodList[index].productCode,
                          ));
                        },
                        icon: Icon(Icons.shopping_cart),
                      ),
                    ),
                  );
                },
                itemCount: provider.totalNoItems,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ViewCartScreen(),
        )),
        child: Icon(Icons.shopping_cart_checkout),
      ),
    );
  }
}
