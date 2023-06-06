import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Order {
  String id, name, address, noHP, nameProduct, addNote;

  Order({
    required this.id,
    required this.name,
    required this.address,
    required this.noHP,
    required this.nameProduct,
    required this.addNote,
  });
}

class Orders with ChangeNotifier {
  List<Order> _products = [];

  List<Order> get allProduct => _products;

  int get allProducts => _products.length;

  Order selectById(String id) =>
      _products.firstWhere((orderId) => orderId.id == id);

  Future<void> addOrder(String name, String address, String noHP,
      String nameProduct, String addNote) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/order.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "name": name,
          "address": address,
          "noHP": noHP,
          "nameProduct": nameProduct,
          "addNote": addNote,
        },
      ),
    )
        .then(
      (response) {
        _products.add(
          Order(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            address: address,
            noHP: noHP,
            nameProduct: nameProduct,
            addNote: addNote,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editOrder(String id, String name, String address, String noHP,
      String nameProduct, String addNote) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/order/$id.json");
    return http
        .put(
      url,
      body: json.encode(
        {
          "name": name,
          "address": address,
          "noHP": noHP,
          "nameProduct": nameProduct,
          "addNote": addNote,
        },
      ),
    )
        .then(
      (response) {
        Order selectOrder = _products.firstWhere((orderId) => orderId.id == id);
        selectOrder.name = name;
        selectOrder.address = address;
        selectOrder.noHP = noHP;
        selectOrder.nameProduct = nameProduct;
        selectOrder.addNote = addNote;
        notifyListeners();
      },
    );
  }

  Future<void> deleteOrder(String id) {
    Uri url = Uri.parse(
        "https://cat-shop-9d342-default-rtdb.firebaseio.com/order/$id.json");
    return http.delete(url).then(
      (response) {
        _products.removeWhere((orderId) => orderId.id == id);
        notifyListeners();
      },
    );
  }
}
