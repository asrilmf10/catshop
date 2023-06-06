import 'package:flutter/material.dart';

import '../models/theme.dart';
import './about_page.dart';
import './landing_page.dart';
import './list_order_page.dart';
import './list_product_page.dart';
import './order_page.dart';
import './product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> navbarItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.add_box_rounded),
      label: "Add Order",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.assignment_rounded),
      label: "Order List",
    ),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _index = 0;
  final List<Widget> _body = [
    ProductPage(),
    OrderPage(),
    const ListOrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          'Cat Shop',
          style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.pink.shade200,
              leading: const Image(
                image: AssetImage("assets/images/petshop_logo.png"),
              ),
              title: const Text(
                'Cat Shop',
                style: TextStyle(color: Colors.black, fontFamily: 'Acme'),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              subtitle: const Text("Application Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const Setting();
                  }),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline_rounded),
              title: const Text("About Application"),
              subtitle: const Text("Application Specifications"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const Tentang();
                  }),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_business_rounded),
              title: const Text("Manage Products"),
              subtitle: const Text("Manage your Products"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return ListProdukPage();
                  }),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log Out"),
              subtitle: const Text("Exit the application"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const LandingPage();
                  }),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
      body: _body.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pink.shade200,
        selectedItemColor: Colors.pink.shade500,
        unselectedItemColor: Colors.white,
        items: navbarItem,
        currentIndex: _index,
        onTap: (i) {
          setState(() {
            _index = i;
          });
        },
      ),
    );
  }
}
