const categoryModelCatId = 'id';
const categoryModelCatName = 'name';
const categoryModelProductCount = 'product_count';
const categoryModelAvailable = 'available';

class CategoryModel {
  String? catId;
  String? catName;
  num productCount;
  bool available;

  CategoryModel({
    this.catId,
    this.catName,
    this.productCount = 0,
    this.available = true,
  });

  Map<String, dynamic> toMap() => {
        categoryModelCatId: catId,
        categoryModelCatName: catName,
        categoryModelProductCount: productCount,
        categoryModelAvailable: available,
      };

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        catId: map[categoryModelCatId],
        catName: map[categoryModelCatName],
        productCount: map[categoryModelProductCount],
        available: map[categoryModelAvailable],
      );
}
