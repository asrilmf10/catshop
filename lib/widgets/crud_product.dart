import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class AddProduct extends StatelessWidget {
  static const routeName = "/addProduct";

  final TextEditingController productController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          'Add Product',
          style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Name Product"),
                textInputAction: TextInputAction.next,
                controller: productController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                controller: priceController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  productProvider
                      .addProduct(
                    productController.text,
                    priceController.text,
                    imageController.text,
                  )
                      .then((respones) {
                    final snackBar = SnackBar(
                      content: const Text(
                        'Successful !',
                        style: TextStyle(fontFamily: 'RussoOne'),
                      ),
                      backgroundColor: Colors.pink.shade500,
                      showCloseIcon: true,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  });
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'RussoOne',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateProduct extends StatelessWidget {
  const UpdateProduct({super.key});
  static const routeName = "/updateProduct";
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final String prodID = ModalRoute.of(context)!.settings.arguments.toString();
    final selectProd = products.selectById(prodID);

    final TextEditingController productController =
        TextEditingController(text: selectProd.title);
    final TextEditingController priceController =
        TextEditingController(text: selectProd.price);
    final TextEditingController imageController =
        TextEditingController(text: selectProd.imageURL);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          'Update Product',
          style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Name Product"),
                textInputAction: TextInputAction.next,
                controller: productController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                controller: priceController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Image URL"),
                textInputAction: TextInputAction.done,
                controller: imageController,
                onEditingComplete: () {
                  products
                      .editProduct(
                    prodID,
                    productController.text,
                    priceController.text,
                    imageController.text,
                  )
                      .then(
                    (value) {
                      final snackBar = SnackBar(
                        content: const Text(
                          'Update Successful !',
                          style: TextStyle(fontFamily: 'RussoOne'),
                        ),
                        backgroundColor: Colors.pink.shade500,
                        showCloseIcon: true,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  products
                      .editProduct(
                    prodID,
                    productController.text,
                    priceController.text,
                    imageController.text,
                  )
                      .then(
                    (value) {
                      final snackBar = SnackBar(
                        content: const Text(
                          'Update Successful !',
                          style: TextStyle(fontFamily: 'RussoOne'),
                        ),
                        backgroundColor: Colors.pink.shade500,
                        showCloseIcon: true,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                },
                child: const Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'RussoOne',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
