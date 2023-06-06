import 'package:catshop/widgets/crud_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'models/theme.dart';
import 'pages/order_page.dart';
import 'pages/detail_order_page.dart';
import 'pages/splash_screen.dart';
import 'models/order.dart';
// import 'models/auth_service.dart';
import 'models/product.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkMode>(
          create: (_) => DarkMode(),
        ),
        ChangeNotifierProvider<Orders>(
          create: (_) => Orders(),
        ),
        ChangeNotifierProvider<Products>(
          create: (_) => Products(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AuthService>(
//           create: (_) => AuthService(),
//         ),
//         ChangeNotifierProvider<DarkMode>(
//           create: (_) => DarkMode(),
//         ),
//         ChangeNotifierProvider<Orders>(
//           create: (_) => Orders(),
//         ),
//         ChangeNotifierProvider<Products>(
//           create: (_) => Products(),
//         ),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var mainTheme = ThemeData.light();
  var darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode.darkMode ? mainTheme : darkTheme,
      home: const SplashScreen(),
      routes: {
        OrderPage.routeName: (context) => OrderPage(),
        DetailOrderPage.routeName: (context) => const DetailOrderPage(),
        AddProduct.routeName: (context) => AddProduct(),
        UpdateProduct.routeName: (context) => const UpdateProduct(),
      },
    );
  }
}
