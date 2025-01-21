import 'package:mainamwal/model/box/box_statment.dart';

class BoxStatmentModel extends BoxStatment {
  const BoxStatmentModel({
    required super.securitiesDocumentGuid,
    required super.securitiesDate,
    required super.docCode,
    required super.docName,
    required super.remarks,
    required super.debitAmount,
    required super.creditAmount,
    required super.debitcurrencyAmount,
    required super.creditcurrencyAmount,
    required super.docCatCode,
  });

  factory BoxStatmentModel.fromJson(Map<String, dynamic> json) =>
      BoxStatmentModel(
        securitiesDocumentGuid: json['SecuritiesDocumentGuid'] ?? '',
        securitiesDate: json['SecuritiesDate'] ?? '',
        docCode: json['DocCode'] ?? '',
        docName: json['DocName'] ?? '',
        remarks: json['Remarks'] ?? '',
        debitAmount: json['DebitAmount'] ?? '',
        creditAmount: json['CreditAmount'] ?? '',
        debitcurrencyAmount: json['DebitcurrencyAmount'] ?? '',
        creditcurrencyAmount: json['CreditcurrencyAmount'] ?? '',
        docCatCode: json['DocCatCode'] ?? '',
      );
}
