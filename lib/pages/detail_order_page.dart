import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/order.dart';

class DetailOrderPage extends StatelessWidget {
  const DetailOrderPage({super.key});
  static const routeName = "/updateOrder";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context, listen: false);
    final String orderID =
        ModalRoute.of(context)!.settings.arguments.toString();
    // final orderID = ModalRoute.of(context)!.settings.arguments as String?;
    final selectOrder = orders.selectById(orderID);

    final TextEditingController nameController =
        TextEditingController(text: selectOrder.name);
    final TextEditingController addressController =
        TextEditingController(text: selectOrder.address);
    final TextEditingController noHPController =
        TextEditingController(text: selectOrder.noHP);
    final TextEditingController nameProdController =
        TextEditingController(text: selectOrder.nameProduct);
    final TextEditingController addNoteController =
        TextEditingController(text: selectOrder.addNote);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          'Update Order',
          style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                child: Icon(Icons.person_rounded, size: 50),
                radius: 50,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Name"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Address"),
                textInputAction: TextInputAction.next,
                controller: addressController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Telephone"),
                textInputAction: TextInputAction.next,
                controller: noHPController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Name Product"),
                textInputAction: TextInputAction.next,
                controller: nameProdController,
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Add Notes"),
                textInputAction: TextInputAction.done,
                controller: addNoteController,
                onEditingComplete: () {
                  orders
                      .editOrder(
                    orderID,
                    nameController.text,
                    addressController.text,
                    noHPController.text,
                    nameProdController.text,
                    addNoteController.text,
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
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(height: 65),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: OutlinedButton(
                  onPressed: () {
                    orders
                        .editOrder(
                      orderID,
                      nameController.text,
                      addressController.text,
                      noHPController.text,
                      nameProdController.text,
                      addNoteController.text,
                    )
                        .then((value) {
                      final snackBar = SnackBar(
                        content: const Text(
                          'Update Successful !',
                          style: TextStyle(fontFamily: 'RussoOne'),
                        ),
                        backgroundColor: Colors.pink.shade500,
                        showCloseIcon: true,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
