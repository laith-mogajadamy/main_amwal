import 'package:mainamwal/model/customers_and_suppliers/details.dart';

class DetailsModel extends Details {
  const DetailsModel({
    required super.remarks,
    required super.quantity,
    required super.debit,
    required super.unitPrice,
    required super.credit,
  });

  factory DetailsModel.fromJson(Map<String, dynamic> json) => DetailsModel(
        remarks: json['Remarks'] ?? '',
        quantity: json['Qty1'] ?? 0,
        debit: json['Debit'] ?? '',
        unitPrice: json['UNITPRICE'] ?? 0,
        credit: json['Credit'] ?? '',
      );
}
