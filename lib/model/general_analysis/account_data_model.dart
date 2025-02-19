import 'package:mainamwal/model/general_analysis/account_data.dart';

class AccountDataModel extends AccountData {
  const AccountDataModel({
    required super.accountGuid,
    required super.parentGuid,
    required super.accountCode,
    required super.accountName,
    required super.currencyCode,
    required super.closeBalance,
    required super.closeBalanceFC,
    required super.mainDTL,
  });

  factory AccountDataModel.fromJson(Map<String, dynamic> json) =>
      AccountDataModel(
        accountGuid: json['AccountGuid'] ?? '',
        parentGuid: json['ParentGuid'] ?? '',
        accountCode: json['AccountCode'] ?? '',
        accountName: json['AccountName'] ?? '',
        currencyCode: json['CurrencyCode'] ?? '',
        closeBalance: json['CloseBalance'] ?? '',
        closeBalanceFC: json['CloseBalanceFC'] ?? '',
        mainDTL: json['MainDTL'] ?? '',
      );
}
