import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';

class StatmentTotalModel extends StatmentTotal {
  const StatmentTotalModel({
    required super.securitiesDate,
    required super.docName,
    required super.debit,
    required super.code,
    required super.credit,
  });

  factory StatmentTotalModel.fromJson(Map<String, dynamic> json) =>
      StatmentTotalModel(
        securitiesDate: json['SecuritiesDate'] ?? '',
        docName: json['DocName'] ?? '',
        debit: json['Debit'] ?? '',
        code: json['Code'] ?? '',
        credit: json['Credit'] ?? '',
        // languages: List<LanguageModel>.from(
        //   ((json['languages'] ?? []) as List).map(
        //     (e) => LanguageModel.fromJson(e),
        //   ),
        // ),
        // location: json["lawyer"]?['location'] ?? '',
      );
}
