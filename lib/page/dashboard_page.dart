import 'package:e_commerce_admin/page/category_page.dart';
import 'package:e_commerce_admin/page/new_product_page.dart';
import 'package:e_commerce_admin/page/order_page.dart';
import 'package:e_commerce_admin/page/product_page.dart';
import 'package:e_commerce_admin/page/report_page.dart';
import 'package:e_commerce_admin/page/settings_page.dart';
import 'package:e_commerce_admin/page/user_page.dart';
import 'package:e_commerce_admin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/dashboard_item.dart';
import '../widgets/dashboard_item_view.dart';

class DashBoardPage extends StatelessWidget {
  static const String routeName = '/dashboard';
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductProvider>(context, listen: false).getAllCategories();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: dashboardItems.length,
        itemBuilder: (context, index) => DashboardItemView(
          item: dashboardItems[index],
          onPressed: (value) {
            final route = selectedRoute(value);
            Navigator.pushNamed(context, route);
          },
        ),
      ),
    );
  }

  String selectedRoute(String value) {
    String route = '';
    switch (value) {
      case DashboardItem.product:
        route = ProductPage.routeName;
        break;
      case DashboardItem.category:
        route = CategoryPage.routeName;
        break;

      case DashboardItem.orders:
        route = OrderPage.routeName;
        break;

      case DashboardItem.users:
        route = UserPage.routeName;
        break;

      case DashboardItem.setting:
        route = SettingsPage.routeName;
        break;

      case DashboardItem.report:
        route = ReportPage.routeName;
        break;
    }

    return route;
  }
}
