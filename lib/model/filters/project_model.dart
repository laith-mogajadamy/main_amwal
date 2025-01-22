import 'package:mainamwal/model/filters/project.dart';

class ProjectModel extends Project {
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
