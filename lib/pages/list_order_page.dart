import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';
import './detail_order_page.dart';

class ListOrderPage extends StatelessWidget {
  const ListOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final allOrderProvider = Provider.of<Orders>(context);
    return Scaffold(
      body: (allOrderProvider.allProducts == 0)
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(5),
              child: const Center(
                child: Text(
                  "No Data",
                  style: TextStyle(
                    fontFamily: 'FjallaOne',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: allOrderProvider.allProducts,
              itemBuilder: (context, index) {
                var id = allOrderProvider.allProduct[index].id;
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide()),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person_rounded),
                      radius: 30,
                    ),
                    title: Text(allOrderProvider.allProduct[index].name),
                    subtitle: Text(
                      "${allOrderProvider.allProduct[index].address}"
                      "\n${allOrderProvider.allProduct[index].noHP}"
                      "\n${allOrderProvider.allProduct[index].nameProduct}",
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_vert_rounded, size: 28),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Checkout"),
                                      Icon(
                                        Icons.shopping_cart_checkout_rounded,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      DetailOrderPage.routeName,
                                      arguments: id,
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Update"),
                                      Icon(
                                        Icons.edit_rounded,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    allOrderProvider.deleteOrder(id).then(
                                      (_) {
                                        final snackBar = SnackBar(
                                          content: const Text(
                                            'Delete Successful !',
                                            style: TextStyle(
                                                fontFamily: 'RussoOne'),
                                          ),
                                          backgroundColor: Colors.pink.shade500,
                                          showCloseIcon: true,
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                    );
                                    // Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text("Delete"),
                                      Icon(
                                        Icons.delete_rounded,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
