import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Application",
          style: TextStyle(fontFamily: 'Acme', color: Colors.black),
        ),
        backgroundColor: Colors.pink.shade200,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const Text(
              "UAS Pemrograman Mobile\nInformatika C-2020",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Acme',
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/asril.jpg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "2009106109\nAsril M. Fahroji",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/adrian.jpeg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "2009106112\nAdrian Tasmin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/silvia.jpg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "2009106120\nSilvia Ananda",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/riana.jpg"),
                          radius: 50,
                        ),
                      ),
                      Text(
                        "2009106132\nRianawati",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
