import 'package:mainamwal/model/warehouses/warehouses.dart';

class WarehousesModel extends Warehouses {
  const WarehousesModel({
    required super.storeGuid,
    required super.storeCode,
    required super.storeName,
    required super.companiesGuid,
    required super.companiesCode,
    required super.companiesName,
    required super.currentCost,
    required super.number,
  });

  factory WarehousesModel.fromJson(Map<String, dynamic> json) =>
      WarehousesModel(
        storeGuid: json['StoreGuid'] ?? '',
        storeCode: json['StoreCode'] ?? '',
        storeName: json['StoreName'] ?? '',
        companiesGuid: json['CompaniesGuid'] ?? '',
        companiesCode: json['CompaniesCode'] ?? '',
        companiesName: json['CompaniesName'] ?? '',
        currentCost: json['CurrentCost'] ?? '',
        number: json['Number'] ?? '',
      );
}
