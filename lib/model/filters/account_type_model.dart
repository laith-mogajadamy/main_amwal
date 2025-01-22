import 'package:mainamwal/model/filters/account_type.dart';

class AccountTypeModel extends AccountType {
  const AccountTypeModel({
    required super.name,
    required super.val,
  });

  factory AccountTypeModel.fromJson(Map<String, dynamic> json) =>
      AccountTypeModel(
        name: json['Name'] ?? '',
        val: json['Val'] ?? '',
      );
}
