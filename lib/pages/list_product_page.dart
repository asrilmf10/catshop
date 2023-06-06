import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../widgets/crud_product.dart';

class ListProdukPage extends StatelessWidget {
  const ListProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          "List Product",
          style: TextStyle(
            fontFamily: 'Acme',
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return AddProduct();
                }),
              );
            },
          ),
        ],
      ),
      body: (productProvider.items == 0)
          ? const Center(
              child: Text(
                "No Product",
                style: TextStyle(
                  fontFamily: 'FjallaOne',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              itemCount: productProvider.items,
              itemBuilder: (context, index) {
                var id = productProvider.allItems[index].id;
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide()),
                  ),
                  child: ListTile(
                    leading:
                        Image.network(productProvider.allItems[index].imageURL),
                    title: Text(productProvider.allItems[index].title),
                    subtitle:
                        Text("Rp. ${productProvider.allItems[index].price}"),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.mode_edit_rounded),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                UpdateProduct.routeName,
                                arguments: id,
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              productProvider.deleteProduct(id).then(
                                (_) {
                                  final snakbar = SnackBar(
                                    content: const Text(
                                      "Delete Successful !",
                                      style: TextStyle(fontFamily: 'RussoOne'),
                                    ),
                                    backgroundColor: Colors.pink.shade500,
                                    showCloseIcon: true,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snakbar);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
