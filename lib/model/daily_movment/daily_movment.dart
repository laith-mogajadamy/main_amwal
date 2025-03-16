import 'package:equatable/equatable.dart';

class DailyMovment extends Equatable {
  final String guid;
  final String name;
  final String securitiesDate;
  final String securitiesNumber;
  final String customerName;
  final String currcode;
  final String ageL;
  final String debet;
  final String credit;
  final String remarks;
  final String code;

  const DailyMovment({
    required this.guid,
    required this.name,
    required this.securitiesDate,
    required this.securitiesNumber,
    required this.customerName,
    required this.currcode,
    required this.ageL,
    required this.debet,
    required this.credit,
    required this.remarks,
    required this.code,
  });

  @override
  List<Object?> get props => [
        guid,
        name,
        securitiesDate,
        securitiesNumber,
        customerName,
        currcode,
        ageL,
        debet,
        credit,
        remarks,
        code,
      ];
}
