import 'package:mainamwal/model/box/box.dart';

class BoxModel extends Box {
  const BoxModel({
    required super.guid,
    required super.name,
    required super.code,
    required super.currencyCode,
    required super.companyName,
    required super.companyGuid,
    required super.closeBalance,
    required super.differentCurrency,
  });

  factory BoxModel.fromJson(Map<String, dynamic> json) => BoxModel(
        guid: json['Guid'] ?? '',
        name: json['Name'] ?? '',
        code: json['Code'] ?? '',
        currencyCode: json['CurrencyCode'] ?? '',
        companyName: json['CompanyName'] ?? '',
        companyGuid: json['CompanyGuid'] ?? '',
        closeBalance: json['CLOSEBALANCE'] ?? '',
        differentCurrency: json['DifferentCurrency'] ?? '',
      );
}
