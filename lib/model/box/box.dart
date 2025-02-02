import 'package:equatable/equatable.dart';

class Box extends Equatable {
  final String guid;
  final String name;
  final String code;
  final String currencyCode;
  final String companyName;
  final String companyGuid;
  final String closeBalance;
  final String differentCurrency;

  const Box({
    required this.guid,
    required this.name,
    required this.code,
    required this.currencyCode,
    required this.companyName,
    required this.companyGuid,
    required this.closeBalance,
    required this.differentCurrency,
  });

  @override
  List<Object?> get props => [
        guid,
        name,
        code,
        currencyCode,
        companyName,
        companyGuid,
        closeBalance,
        differentCurrency,
      ];
}
