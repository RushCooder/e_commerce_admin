const productModelId = 'id';
const productModelName = 'product';
const productModelSalePrice = 'sale_price';
const productModelDescription = 'description';
const productModelImageUrl = 'image';
const productModelFeatured = 'featured';
const productModelAvailable = 'available';

class ProductModel {
  String? id;
  String? name;
  String? category;
  String? description;
  String? imageUrl;
  num salePrice;
  bool featured;
  bool available;

  ProductModel({
    this.id,
    this.name,
    this.category,
    this.description,
    this.imageUrl,
    this.salePrice = 0.0,
    this.featured = true,
    this.available = true,
  });

  Map<String, dynamic> toMap() => {
        productModelId: id,
        productModelName: name,
        productModelSalePrice: salePrice,
        productModelDescription: description,
        productModelImageUrl: imageUrl,
        productModelFeatured: featured,
        productModelAvailable: available,
      };

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map[productModelId],
        name: map[productModelName],
        salePrice: map[productModelSalePrice],
        description: map[productModelDescription],
        imageUrl: map[productModelImageUrl],
        featured: map[productModelFeatured],
        available: map[productModelAvailable],
      );
}
