import 'package:equatable/equatable.dart';

class DailyPruchasAndSale extends Equatable {
  final String guid;
  final String name;
  final String securitiesDate;
  final String securitiesNumber;
  final String customerName;
  final String remarks;
  final String referenceNumber;
  final String orderNumber;
  final String agentName;
  final String grossValue;
  final String discount;
  final String freight;
  final String netAfterTax;
  final String totalAmount;
  final String net;
  final String categoriesGuid;

  const DailyPruchasAndSale({
    required this.guid,
    required this.name,
    required this.securitiesDate,
    required this.securitiesNumber,
    required this.customerName,
    required this.remarks,
    required this.referenceNumber,
    required this.orderNumber,
    required this.agentName,
    required this.grossValue,
    required this.discount,
    required this.freight,
    required this.netAfterTax,
    required this.totalAmount,
    required this.net,
    required this.categoriesGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        name,
        securitiesDate,
        securitiesNumber,
        customerName,
        remarks,
        referenceNumber,
        orderNumber,
        agentName,
        grossValue,
        discount,
        freight,
        netAfterTax,
        totalAmount,
        net,
        categoriesGuid,
      ];
}
