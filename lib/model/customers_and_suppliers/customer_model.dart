import 'package:mainamwal/model/customers_and_suppliers/customer.dart';

class CustomerModel extends Customer {
  const CustomerModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.city,
    required super.currentBalance,
    required super.address,
    required super.salesDebtLimit,
    required super.dealingCurrencyGuid,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
        city: json['City'] ?? '',
        currentBalance: json['CurrentBalance'] ?? '',
        address: json['Address'] ?? '',
        salesDebtLimit: json['SalesDebtLimit'] ?? '',
        dealingCurrencyGuid: json['DealingCurrencyGuid'] ?? '',
      );
}
