part of 'box_bloc.dart';

abstract class BoxEvent extends Equatable {}

class GetBoxs extends BoxEvent {
  GetBoxs();

  @override
  List<Object?> get props => [];
}

class GetBoxStatment extends BoxEvent {
  final String? guid;
  final String? fromDate;
  final String? toDate;
  GetBoxStatment({
    required this.guid,
    required this.fromDate,
    required this.toDate,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
      ];
}

//
class GetDefDates extends BoxEvent {
  final String? guid;

  GetDefDates({
    this.guid,
  });

  @override
  List<Object?> get props => [
        guid,
      ];
}

class ChangeFromDate extends BoxEvent {
  final String? fromdate;

  ChangeFromDate({
    this.fromdate,
  });

  @override
  List<Object?> get props => [
        fromdate,
      ];
}

class ChangeToDate extends BoxEvent {
  final String? todate;

  ChangeToDate({
    this.todate,
  });

  @override
  List<Object?> get props => [
        todate,
      ];
}

class ChangeStateDate extends BoxEvent {
  final String? statedate;

  ChangeStateDate({
    this.statedate,
  });

  @override
  List<Object?> get props => [
        statedate,
      ];
}

//
//
class GetBoxOpeningBalance extends BoxEvent {
  final String? guid;
  final String? fromDate;
  final String? toDate;
  final bool? isCurrency;

  GetBoxOpeningBalance({
    this.guid,
    this.fromDate,
    this.toDate,
    this.isCurrency,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
        isCurrency,
      ];
}

//
class GetBoxCreditDebitSum extends BoxEvent {
  final String? guid;
  final String? fromDate;
  final String? toDate;
  final bool? isCurrency;
  GetBoxCreditDebitSum({
    this.guid,
    this.fromDate,
    this.toDate,
    this.isCurrency,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
        isCurrency,
      ];
}
