import 'package:equatable/equatable.dart';

class AccountData extends Equatable {
  final String accountGuid;
  final String parentGuid;
  final String accountCode;
  final String accountName;
  final String currencyCode;
  final String closeBalance;
  final String closeBalanceFC;
  final String mainDTL;

  const AccountData({
    required this.accountGuid,
    required this.parentGuid,
    required this.accountCode,
    required this.accountName,
    required this.currencyCode,
    required this.closeBalance,
    required this.closeBalanceFC,
    required this.mainDTL,
  });

  @override
  List<Object?> get props => [
        accountGuid,
        parentGuid,
        accountCode,
        accountName,
        currencyCode,
        closeBalance,
        closeBalanceFC,
        mainDTL,
      ];
}
