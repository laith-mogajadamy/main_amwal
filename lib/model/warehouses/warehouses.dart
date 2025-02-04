import 'package:equatable/equatable.dart';

class Warehouses extends Equatable {
  final String tbCategoriesMainCode;
  final String tbCategoriesMainName;
  final String tbItemsBarcode;
  final String tbItemsSubClassMainBarcode;
  final String itemsName;
  final String storeName;
  final String batchNo;
  final String expiryDate;
  final String cost;
  final String costRate;
  final String currentQuantity;

  const Warehouses({
    required this.tbCategoriesMainCode,
    required this.tbCategoriesMainName,
    required this.tbItemsBarcode,
    required this.tbItemsSubClassMainBarcode,
    required this.itemsName,
    required this.storeName,
    required this.batchNo,
    required this.expiryDate,
    required this.cost,
    required this.costRate,
    required this.currentQuantity,
  });

  @override
  List<Object?> get props => [
        tbCategoriesMainCode,
        tbCategoriesMainName,
        tbItemsBarcode,
        tbItemsSubClassMainBarcode,
        itemsName,
        storeName,
        batchNo,
        expiryDate,
        cost,
        costRate,
        currentQuantity,
      ];
}
