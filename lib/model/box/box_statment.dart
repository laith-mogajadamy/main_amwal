import 'package:equatable/equatable.dart';

class BoxStatment extends Equatable {
  final String securitiesDocumentGuid;
  final String securitiesDate;
  final String docName;
  final String docCode;
  final String remarks;
  final dynamic debitAmount;
  final dynamic creditAmount;
  final dynamic debitcurrencyAmount;
  final dynamic creditcurrencyAmount;
  final String docCatCode;

  const BoxStatment({
    required this.securitiesDocumentGuid,
    required this.securitiesDate,
    required this.docCode,
    required this.docName,
    required this.remarks,
    required this.debitAmount,
    required this.creditAmount,
    required this.debitcurrencyAmount,
    required this.creditcurrencyAmount,
    required this.docCatCode,
  });

  @override
  List<Object?> get props => [
        securitiesDocumentGuid,
        securitiesDate,
        docCode,
        docName,
        remarks,
        debitAmount,
        creditAmount,
        debitcurrencyAmount,
        creditcurrencyAmount,
        docCatCode,
      ];
}
