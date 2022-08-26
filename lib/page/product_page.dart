import 'package:e_commerce_admin/page/new_product_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  static const String routeName = '/products';
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NewProductPage.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
