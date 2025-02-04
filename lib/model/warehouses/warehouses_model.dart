import 'package:mainamwal/model/warehouses/warehouses.dart';

class WarehousesModel extends Warehouses {
  const WarehousesModel({
    required super.tbCategoriesMainCode,
    required super.tbCategoriesMainName,
    required super.tbItemsBarcode,
    required super.tbItemsSubClassMainBarcode,
    required super.itemsName,
    required super.storeName,
    required super.batchNo,
    required super.expiryDate,
    required super.cost,
    required super.costRate,
    required super.currentQuantity,
  });

  factory WarehousesModel.fromJson(Map<String, dynamic> json) =>
      WarehousesModel(
        tbCategoriesMainCode: json['tbCategoriesMainCode'] ?? '',
        tbCategoriesMainName: json['tbCategoriesMainName'] ?? '',
        tbItemsBarcode: json['tbItemsBarcode'] ?? '',
        tbItemsSubClassMainBarcode: json['tbItemsSubClassMainBarcode'] ?? '',
        itemsName: json['ItemsName'] ?? '',
        storeName: json['StoreName'] ?? '',
        batchNo: json['BatchNo'] ?? '',
        expiryDate: json['ExpiryDate'] ?? '',
        cost: json['Cost'] ?? '',
        costRate: json['CostRate'] ?? '',
        currentQuantity: json['CurrentQuantity'] ?? '',
      );
}
