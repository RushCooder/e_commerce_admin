import 'package:e_commerce_admin/models/date_model.dart';

const purchaseModelId = 'id';
const purchaseModelProductId = 'product_id';
const purchaseModelPurchaseDateModel = 'purchase_date';
const purchaseModelPurchasePrice = 'purchase_price';
const purchaseModelQuantity = 'quantity';

class PurchaseModel {
  String? id;
  String? productId;
  DateModel? dateModel;
  num purchasePrice;
  num quantity;

  PurchaseModel({
    this.id,
    this.productId,
    this.dateModel,
    this.purchasePrice = 0.0,
    this.quantity = 0.0,
  });

  Map<String, dynamic> toMap() => {
        purchaseModelId: id,
        purchaseModelProductId: productId,
        purchaseModelPurchaseDateModel: dateModel,
        purchaseModelPurchasePrice: purchasePrice,
        purchaseModelQuantity: quantity,
      };

  factory PurchaseModel.fromMap(Map<String, dynamic> map) => PurchaseModel(
        id: map[purchaseModelId],
        productId: map[purchaseModelProductId],
        dateModel: DateModel.fromMap(map[purchaseModelPurchaseDateModel]),
        purchasePrice: map[purchaseModelPurchasePrice],
        quantity: map[purchaseModelQuantity],
      );
}
