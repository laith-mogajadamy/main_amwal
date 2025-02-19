import 'package:equatable/equatable.dart';

class AccountData extends Equatable {
  final String accountGuid;
  final String parentGuid;
  final String accountCode;
  final String accountName;
  final String currencyCode;
  final String openBalance;
  final String closeBalance;
  final String accountType;
  final String typeName;
  final String aler;
  final String alerName;
  final String natural;
  final String naturalName;
  final String grossLevel;
  final String grossLevelName;
  final String mainDTL;
  final String mainDTLName;
  final String totalLevel;
  final String totalLevelName;
  final String companyGuid;
  final String companyName;
  final String projectGuid;
  final String projectName;
  final String costcenterGuid;
  final String costcenterName;
  final String number;

  const AccountData({
    required this.accountGuid,
    required this.parentGuid,
    required this.accountCode,
    required this.accountName,
    required this.currencyCode,
    required this.openBalance,
    required this.closeBalance,
    required this.accountType,
    required this.typeName,
    required this.aler,
    required this.alerName,
    required this.natural,
    required this.naturalName,
    required this.grossLevel,
    required this.grossLevelName,
    required this.mainDTL,
    required this.mainDTLName,
    required this.totalLevel,
    required this.totalLevelName,
    required this.companyGuid,
    required this.companyName,
    required this.projectGuid,
    required this.projectName,
    required this.costcenterGuid,
    required this.costcenterName,
    required this.number,
  });

  @override
  List<Object?> get props => [
        accountGuid,
        parentGuid,
        accountCode,
        accountName,
        currencyCode,
        openBalance,
        closeBalance,
        accountType,
        typeName,
        aler,
        alerName,
        natural,
        naturalName,
        grossLevel,
        grossLevelName,
        mainDTL,
        mainDTLName,
        totalLevel,
        totalLevelName,
        companyGuid,
        companyName,
        projectGuid,
        projectName,
        costcenterGuid,
        costcenterName,
        number,
      ];
}
