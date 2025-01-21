import 'package:mainamwal/model/enter/date.dart';

class DateModel extends Date {
  const DateModel({
    required super.stateDate,
    required super.currentPeriodStartDate,
    required super.currentPeriodEndDate,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        stateDate: json['StateDate'] ?? '',
        currentPeriodStartDate: json['CurrentPeriodStartDate'] ?? '',
        currentPeriodEndDate: json['CurrentPeriodEndDate'] ?? '',
      );
}
