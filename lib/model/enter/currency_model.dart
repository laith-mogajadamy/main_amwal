import 'package:mainamwal/model/enter/currency.dart';

class CurrencyModel extends Currency {
  const CurrencyModel({
    required super.guid,
    required super.code,
    required super.iddefault,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        iddefault: json['id_default'] ?? '',
      );
}
