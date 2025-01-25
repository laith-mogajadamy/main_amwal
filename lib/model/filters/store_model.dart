import 'package:mainamwal/model/filters/store.dart';

class StoreModel extends Store {
  const StoreModel({
    required super.guid,
    required super.code,
    required super.name,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
      );
}
