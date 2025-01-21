import 'package:mainamwal/model/customers_and_suppliers/details.dart';
import 'package:equatable/equatable.dart';

class StatmentDetailed extends Equatable {
  final String securitiesDocumentGuid;
  final String securitiesDate;
  final String docName;
  final String code;
  final String docCatCode;

  final List<Details> details;

  const StatmentDetailed({
    required this.securitiesDocumentGuid,
    required this.securitiesDate,
    required this.code,
    required this.docName,
    required this.docCatCode,
    required this.details,
  });

  @override
  List<Object?> get props => [
        securitiesDocumentGuid,
        securitiesDate,
        code,
        docName,
        docCatCode,
        details,
      ];
}
