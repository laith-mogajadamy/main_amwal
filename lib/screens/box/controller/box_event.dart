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
  final String? companyGuid;

  GetBoxStatment({
    required this.guid,
    required this.fromDate,
    required this.toDate,
    required this.companyGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
        companyGuid,
      ];
}

//
class LoadMoreBoxStatment extends BoxEvent {
  final String? guid;

  final String? companyGuid;

  LoadMoreBoxStatment({
    required this.guid,
    required this.companyGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        companyGuid,
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
  final String? companyGuid;

  GetBoxOpeningBalance({
    this.guid,
    this.fromDate,
    this.toDate,
    this.isCurrency,
    this.companyGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
        isCurrency,
        companyGuid,
      ];
}

//
class GetBoxCreditDebitSum extends BoxEvent {
  final String? guid;
  final String? fromDate;
  final String? toDate;
  final bool? isCurrency;
  final String? companyGuid;

  GetBoxCreditDebitSum({
    this.guid,
    this.fromDate,
    this.toDate,
    this.isCurrency,
    this.companyGuid,
  });

  @override
  List<Object?> get props => [
        guid,
        fromDate,
        toDate,
        isCurrency,
        companyGuid,
      ];
}

class GetBoxsCompanys extends BoxEvent {
  GetBoxsCompanys();

  @override
  List<Object?> get props => [];
}

class CompanyChanged extends BoxEvent {
  final Company? company;

  CompanyChanged({this.company});

  @override
  List<Object?> get props => [company];
}
