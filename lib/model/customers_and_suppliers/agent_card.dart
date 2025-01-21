import 'package:equatable/equatable.dart';

class AgentCard extends Equatable {
  final String guid;
  final String name;
  final String code;
  final String city;
  final String address;
  final String mobilephonenumber;
  final String workPhoneNumber;
  final String salesDebtLimit;
  final String buyDebtLimit;
  final String dealingCurrencyGuid;
  final String cycleDay;
  final String notes;
  final String cycleDayName;
  final String cycleNumber;
  final String salePriceCategory;
  final String salePriceCategoryName;
  final String openingBalance;
  final String sales;
  final String purchases;
  final String salesReturned;
  final String purchasesReturned;
  final String payments;
  final String receipts;
  final String debitRestrictions;
  final String creditRestrictions;
  final String currentBalance;

  const AgentCard({
    required this.guid,
    required this.code,
    required this.name,
    required this.city,
    required this.currentBalance,
    required this.address,
    required this.salesDebtLimit,
    required this.buyDebtLimit,
    required this.dealingCurrencyGuid,
    required this.creditRestrictions,
    required this.cycleDay,
    required this.notes,
    required this.cycleDayName,
    required this.cycleNumber,
    required this.debitRestrictions,
    required this.mobilephonenumber,
    required this.workPhoneNumber,
    required this.openingBalance,
    required this.payments,
    required this.purchases,
    required this.receipts,
    required this.salePriceCategory,
    required this.salePriceCategoryName,
    required this.sales,
    required this.salesReturned,
    required this.purchasesReturned,
  });

  @override
  List<Object?> get props => [
        guid,
        name,
        code,
        city,
        address,
        mobilephonenumber,
        workPhoneNumber,
        salesDebtLimit,
        buyDebtLimit,
        dealingCurrencyGuid,
        cycleDay,
        notes,
        cycleDayName,
        cycleNumber,
        salePriceCategory,
        salePriceCategoryName,
        openingBalance,
        sales,
        purchases,
        salesReturned,
        purchasesReturned,
        payments,
        receipts,
        debitRestrictions,
        creditRestrictions,
        currentBalance,
      ];
}
