import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    return Scaffold(
      body: (productProvider.items == 0)
          ? const Center(
              child: Text(
                "No Product",
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(10),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: productProvider.items,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    margin: const EdgeInsets.all(5),
                    child: GridTile(
                      header: Text(
                        productProvider.allItems[index].title,
                        style: const TextStyle(
                          fontFamily: 'Acme',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      footer: GridTileBar(
                        backgroundColor: Colors.pink.shade100,
                        title: Text(
                            "Rp. ${productProvider.allItems[index].price}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.shopping_cart_rounded),
                          onPressed: () {},
                        ),
                      ),
                      child: Image.network(
                        productProvider.allItems[index].imageURL,
                        fit: BoxFit.fill,
                        width: 100,
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
