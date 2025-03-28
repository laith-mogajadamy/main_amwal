import 'package:mainamwal/model/customers_and_suppliers/agent_card.dart';

class AgentCardModel extends AgentCard {
  const AgentCardModel({
    required super.guid,
    required super.code,
    required super.name,
    required super.city,
    required super.currentBalance,
    required super.address,
    required super.salesDebtLimit,
    required super.dealingCurrencyGuid,
    required super.creditRestrictions,
    required super.cycleDay,
    required super.cycleDayName,
    required super.cycleNumber,
    required super.debitRestrictions,
    required super.mobilephonenumber,
    required super.openingBalance,
    required super.payments,
    required super.purchases,
    required super.receipts,
    required super.salePriceCategory,
    required super.salePriceCategoryName,
    required super.sales,
    required super.salesReturned,
    required super.purchasesReturned,
    required super.workPhoneNumber,
    required super.notes,
    required super.buyDebtLimit,
  });

  factory AgentCardModel.fromJson(Map<String, dynamic> json) => AgentCardModel(
        guid: json['Guid'] ?? '',
        code: json['Code'] ?? '',
        name: json['Name'] ?? '',
        city: json['City'] ?? '',
        address: json['Address'] ?? '',
        mobilephonenumber: json['MobilePhoneNumber'] ?? '',
        workPhoneNumber: json['WorkPhoneNumber'] ?? '',
        salesDebtLimit: json['SalesDebtLimit'] ?? '',
        buyDebtLimit: json['BuyDebtLimit'] ?? '',
        dealingCurrencyGuid: json['DealingCurrencyGuid'] ?? '',
        cycleDay: json['CycleDay'] ?? '',
        notes: json['Notes'] ?? '',
        cycleDayName: json['CycleDayName'] ?? '',
        cycleNumber: json['CycleNumber'] ?? '',
        salePriceCategory: json['SalePriceCategory'] ?? '',
        salePriceCategoryName: json['SalePriceCategoryName'] ?? '',
        openingBalance: json['OpeningBalance'] ?? '',
        sales: json['Sales'] ?? '',
        purchases: json['Purchases'] ?? '',
        salesReturned: json['SalesReturned'] ?? '',
        purchasesReturned: json['PurchasesReturned'] ?? '',
        payments: json['Payments'] ?? '',
        receipts: json['Receipts'] ?? '',
        debitRestrictions: json['DebitRestrictions'] ?? '',
        creditRestrictions: json['CreditRestrictions'] ?? '',
        currentBalance: json['CurrentBalance'] ?? '',
      );
}
