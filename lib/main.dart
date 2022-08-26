import 'package:e_commerce_admin/page/category_page.dart';
import 'package:e_commerce_admin/page/category_page.dart';
import 'package:e_commerce_admin/page/dashboard_page.dart';
import 'package:e_commerce_admin/page/launcher_page.dart';
import 'package:e_commerce_admin/page/launcher_page.dart';
import 'package:e_commerce_admin/page/login_page.dart';
import 'package:e_commerce_admin/page/login_page.dart';
import 'package:e_commerce_admin/page/login_page.dart';
import 'package:e_commerce_admin/page/new_product_page.dart';
import 'package:e_commerce_admin/page/new_product_page.dart';
import 'package:e_commerce_admin/page/order_page.dart';
import 'package:e_commerce_admin/page/order_page.dart';
import 'package:e_commerce_admin/page/product_page.dart';
import 'package:e_commerce_admin/page/product_page.dart';
import 'package:e_commerce_admin/page/report_page.dart';
import 'package:e_commerce_admin/page/report_page.dart';
import 'package:e_commerce_admin/page/settings_page.dart';
import 'package:e_commerce_admin/page/settings_page.dart';
import 'package:e_commerce_admin/page/user_page.dart';
import 'package:e_commerce_admin/page/user_page.dart';
import 'package:e_commerce_admin/provider/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (context) => const LauncherPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        DashBoardPage.routeName: (context) => const DashBoardPage(),
        ProductPage.routeName: (context) => const ProductPage(),
        NewProductPage.routeName: (context) => const NewProductPage(),
        OrderPage.routeName: (context) => const OrderPage(),
        UserPage.routeName: (context) => const UserPage(),
        SettingsPage.routeName: (context) => const SettingsPage(),
        CategoryPage.routeName: (context) => const CategoryPage(),
        ReportPage.routeName: (context) => const ReportPage(),
      },
    );
  }
}
