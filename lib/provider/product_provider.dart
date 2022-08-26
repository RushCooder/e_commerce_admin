import 'package:e_commerce_admin/db/db_helper.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<CategoryModel> categoryList = [];

  Future<void> addCategory(CategoryModel categoryModel) =>
      DBHelper.addNewCategory(categoryModel);

  getAllCategories() {
    DBHelper.getAllCategories().listen((event) {
      categoryList = List.generate(event.docs.length,
          (index) => CategoryModel.fromMap(event.docs[index].data()));
      notifyListeners();
    });
  }
}
