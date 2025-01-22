import 'package:mainamwal/model/filters/customers_filter.dart';

class CustomersFilterModel extends CustomersFilter {
  const CustomersFilterModel({
    required super.guid,
    required super.code,
    required super.name,
  });

  factory CustomersFilterModel.fromJson(Map<String, dynamic> json) =>
      CustomersFilterModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
