import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final String guid;
  final String name;
  final String code;
  final String city;
  final String currentBalance;
  final String address;
  final String salesDebtLimit;
  final String dealingCurrencyGuid;

  const Customer({
    required this.guid,
    required this.code,
    required this.name,
    required this.city,
    required this.currentBalance,
    required this.address,
    required this.salesDebtLimit,
    required this.dealingCurrencyGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        code,
        name,
        city,
        currentBalance,
        address,
        salesDebtLimit,
        dealingCurrencyGuid,
      ];
}
