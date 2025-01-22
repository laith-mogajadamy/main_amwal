import 'package:mainamwal/model/filters/documents.dart';

class DocumentsModel extends Documents {
  const DocumentsModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.categoriesGuid,
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) => DocumentsModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
        categoriesGuid: json['CategoriesGuid'] ?? '',
      );
}
