import 'package:mainamwal/model/filters/transport_companies.dart';

class TransportCompaniesModel extends TransportCompanies {
  const TransportCompaniesModel({
    required super.guid,
    required super.code,
    required super.name,
  });

  factory TransportCompaniesModel.fromJson(Map<String, dynamic> json) =>
      TransportCompaniesModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
