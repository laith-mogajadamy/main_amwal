import 'package:mainamwal/model/enter/user.dart';

class UserModel extends User {
  const UserModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.number,
    required super.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        guid: json['guid'] ?? '',
        code: json['code'] ?? '',
        name: json['Name'] ?? '',
        number: json['number'] ?? 0,
        isAdmin: json['isAdmin'] ?? false,
        // languages: List<LanguageModel>.from(
        //   ((json['languages'] ?? []) as List).map(
        //     (e) => LanguageModel.fromJson(e),
        //   ),
        // ),
        // location: json["lawyer"]?['location'] ?? '',
      );
}
