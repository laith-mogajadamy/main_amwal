import 'package:mainamwal/model/filters/company.dart';

class CompanyModel extends Company {
  const CompanyModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.iddefault,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
        iddefault: json['id_default'] ?? '',
      );
}
