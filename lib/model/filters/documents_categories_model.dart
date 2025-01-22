import 'package:mainamwal/model/filters/documents_categories.dart';

class DocumentsCategoriesModel extends DocumentsCategories {
  const DocumentsCategoriesModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.iddefault,
  });

  factory DocumentsCategoriesModel.fromJson(Map<String, dynamic> json) =>
      DocumentsCategoriesModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
        iddefault: json['id_default'] ?? '',
      );
}
