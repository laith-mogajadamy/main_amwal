import 'package:mainamwal/model/daily_movment/daily_movment.dart';

class DailyMovmentModel extends DailyMovment {
  const DailyMovmentModel({
    required super.guid,
    required super.name,
    required super.securitiesDate,
    required super.securitiesNumber,
    required super.customerName,
    required super.currcode,
    required super.ageL,
    required super.debet,
    required super.credit,
    required super.remarks,
    required super.code,
  });

  factory DailyMovmentModel.fromJson(Map<String, dynamic> json) {
    return DailyMovmentModel(
      guid: json['guid'] ?? '',
      name: json['Name'] ?? '',
      securitiesDate: json['SecuritiesDate'] ?? '',
      securitiesNumber: json['SecuritiesNumber'] ?? '',
      customerName: json['CustomerName'] ?? '',
      currcode: json['currcode'] ?? '',
      ageL: json['AgeL'] ?? '',
      debet: json['Debet'] ?? '',
      credit: json['Credit'] ?? '',
      remarks: json['Remarks'] ?? '',
      code: json['Code'] ?? '',
    );
  }
}
