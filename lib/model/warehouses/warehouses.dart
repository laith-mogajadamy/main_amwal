import 'package:equatable/equatable.dart';

class Warehouses extends Equatable {
  final String storeGuid;
  final String storeCode;
  final String storeName;
  final String companiesGuid;
  final String companiesCode;
  final String companiesName;
  final String currentCost;
  final String number;

  const Warehouses({
    required this.storeGuid,
    required this.storeCode,
    required this.storeName,
    required this.companiesGuid,
    required this.companiesCode,
    required this.companiesName,
    required this.currentCost,
    required this.number,
  });

  @override
  List<Object?> get props => [
        storeGuid,
        storeCode,
        storeName,
        companiesGuid,
        companiesCode,
        companiesName,
        currentCost,
        number,
      ];
}
