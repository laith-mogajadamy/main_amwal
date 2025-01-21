import 'package:mainamwal/model/customers_and_suppliers/details_model.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';

class StatmentDetailedModel extends StatmentDetailed {
  const StatmentDetailedModel({
    required super.securitiesDocumentGuid,
    required super.securitiesDate,
    required super.code,
    required super.docName,
    required super.docCatCode,
    required super.details,
  });

  factory StatmentDetailedModel.fromJson(Map<String, dynamic> json) =>
      StatmentDetailedModel(
        securitiesDocumentGuid: json['SecuritiesDocumentGuid'] ?? '',
        securitiesDate: json['SecuritiesDate'] ?? '',
        code: json['Code'] ?? '',
        docName: json['DocName'] ?? '',
        docCatCode: json['DocCatCode'] ?? '',
        details: List<DetailsModel>.from(
          ((json['Details'] ?? []) as List).map(
            (e) => DetailsModel.fromJson(e),
          ),
        ),
        // location: json["lawyer"]?['location'] ?? '',
      );
}
