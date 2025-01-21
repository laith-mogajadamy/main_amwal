import 'package:equatable/equatable.dart';

class Date extends Equatable {
  final String stateDate;
  final String currentPeriodStartDate;
  final String currentPeriodEndDate;

  const Date({
    required this.stateDate,
    required this.currentPeriodStartDate,
    required this.currentPeriodEndDate,
  });

  @override
  List<Object?> get props => [
        stateDate,
        currentPeriodStartDate,
        currentPeriodEndDate,
      ];
}
