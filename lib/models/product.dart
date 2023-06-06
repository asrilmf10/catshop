import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  String id, title, price, imageURL;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageURL,
  });
}

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get allItems => _items;

  int get items => _items.length;

  Product selectById(String id) =>
      _items.firstWhere((itemId) => itemId.id == id);

  Future<void> addProduct(String title, String price, String imageURL) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/products.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "title": title,
          "price": price,
          "imageURL": imageURL,
        },
      ),
    )
        .then(
      (response) {
        _items.add(
          Product(
            id: json.decode(response.body)["title"].toString(),
            title: title,
            price: price,
            imageURL: imageURL,
          ),
        );
        notifyListeners();
      },
    );
  }

  Future<void> editProduct(
      String id, String title, String price, String imageURL) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/products/$id.json");
    return http
        .put(
      url,
      body: json.encode(
        {
          "title": title,
          "price": price,
          "imageURL": imageURL,
        },
      ),
    )
        .then(
      (response) {
        Product selectOrder = _items.firstWhere((itemId) => itemId.id == id);
        selectOrder.title = title;
        selectOrder.price = price;
        selectOrder.imageURL = imageURL;
        notifyListeners();
      },
    );
  }

  Future<void> deleteProduct(String id) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/products/$id.json");
    return http.delete(url).then(
      (response) {
        _items.removeWhere((itemId) => itemId.id == id);
        notifyListeners();
      },
    );
  }
}
