import 'package:e_commerce_admin/models/category_model.dart';
import 'package:e_commerce_admin/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const String routeName = '/category';
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) => productProvider
                .categoryList.isEmpty
            ? const Center(
                child: Text('No item found'),
              )
            : ListView.builder(
                itemCount: productProvider.categoryList.length,
                itemBuilder: (context, index) {
                  final category = productProvider.categoryList[index];
                  return ListTile(
                    title:
                        Text('${category.catName} (${category.productCount})'),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCategoryDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    final nameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add category'),
        content: Card(
          elevation: 10,
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter new category',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context
                  .read<ProductProvider>()
                  .addCategory(
                    CategoryModel(catName: nameController.text),
                  )
                  .then((value) {
                nameController.clear();
              });
            },
            child: const Text('ADD'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}
