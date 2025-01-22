import 'package:mainamwal/model/filters/customers_filter.dart';

class ProjectModel extends CustomersFilter {
  const ProjectModel({
    required super.guid,
    required super.code,
    required super.name,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
