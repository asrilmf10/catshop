import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';

class OrderPage extends StatelessWidget {
  static const routeName = "/addOrder";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController nameProdController = TextEditingController();
  final TextEditingController addNoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final allOrderProvider = Provider.of<Orders>(context, listen: false);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Customer Name",
                          prefixIcon: const Icon(Icons.person_rounded,
                              color: Colors.pink),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.pink.shade100,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        controller: noHPController,
                        decoration: InputDecoration(
                          hintText: "Phone",
                          prefixIcon: const Icon(Icons.phone_rounded,
                              color: Colors.pink),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.pink.shade100,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        controller: addressController,
                        decoration: InputDecoration(
                          hintText: "Address",
                          prefixIcon: const Icon(Icons.house_rounded,
                              color: Colors.pink),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.pink.shade100,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Product',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextFormField(
                        autocorrect: false,
                        autofocus: true,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        controller: nameProdController,
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          prefixIcon: const Icon(Icons.pets_rounded,
                              color: Colors.pink),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.pink.shade100,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    children: [
                      const Text(
                        'Note (Optional)',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Acme',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      TextFormField(
                        autocorrect: false,
                        maxLines: 3,
                        textInputAction: TextInputAction.done,
                        controller: addNoteController,
                        decoration: InputDecoration(
                          hintText: "Explanation",
                          prefixIcon: const Icon(Icons.post_add_rounded,
                              color: Colors.pink),
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          fillColor: Colors.pink.shade100,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  width: 315,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      allOrderProvider
                          .addOrder(
                        nameController.text,
                        addressController.text,
                        noHPController.text,
                        nameProdController.text,
                        addNoteController.text,
                      )
                          .then((response) {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Order Successful !',
                            style: TextStyle(fontFamily: 'RussoOne'),
                          ),
                          backgroundColor: Colors.pink.shade500,
                          showCloseIcon: true,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) {
                        //     return ListOrderPage();
                        //   }),
                        // );
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Order",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'RussoOne',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
