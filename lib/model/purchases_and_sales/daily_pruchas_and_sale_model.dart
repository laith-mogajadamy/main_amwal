import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';

class DailyPruchasAndSaleModel extends DailyPruchasAndSale {
  const DailyPruchasAndSaleModel({
    required super.guid,
    required super.name,
    required super.securitiesDate,
    required super.securitiesNumber,
    required super.customerName,
    required super.remarks,
    required super.referenceNumber,
    required super.orderNumber,
    required super.agentName,
    required super.grossValue,
    required super.discount,
    required super.freight,
    required super.netAfterTax,
    required super.totalAmount,
    required super.net,
    required super.categoriesGuid,
  });

  factory DailyPruchasAndSaleModel.fromJson(Map<String, dynamic> json) =>
      DailyPruchasAndSaleModel(
        guid: json['Guid'] ?? '',
        name: json['Name'] ?? '',
        securitiesDate: json['SecuritiesDate'] ?? '',
        securitiesNumber: json['SecuritiesNumber'] ?? '',
        customerName: json['CustomerName'] ?? '',
        remarks: json['Remarks'] ?? '',
        referenceNumber: json['ReferenceNumber'] ?? '',
        orderNumber: json['OrderNumber'] ?? '',
        agentName: json['AgentName'] ?? '',
        grossValue: json['GrossValue'] ?? '',
        discount: json['Discount'] ?? '',
        freight: json['Freight'] ?? '',
        netAfterTax: json['NetAfterTax'] ?? '',
        totalAmount: json['TotalAmount'] ?? '',
        net: json['Net'] ?? '',
        categoriesGuid: json['CategoriesGuid'] ?? '',
      );
}
