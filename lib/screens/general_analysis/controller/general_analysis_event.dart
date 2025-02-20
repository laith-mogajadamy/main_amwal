part of 'general_analysis_bloc.dart';

abstract class GeneralAnalysisEvent extends Equatable {}

class GetChiledGeneralAnalysis extends GeneralAnalysisEvent {
  final String parentGuid;
  final String aLER;
  final String mainDTL;

  GetChiledGeneralAnalysis({
    required this.parentGuid,
    required this.aLER,
    required this.mainDTL,
  });

  @override
  List<Object?> get props => [
        parentGuid,
        aLER,
        mainDTL,
      ];
}

class GetParentsGeneralAnalysis extends GeneralAnalysisEvent {
  final String parentGuid;
  final String aLER;
  final String mainDTL;

  GetParentsGeneralAnalysis({
    required this.parentGuid,
    required this.aLER,
    required this.mainDTL,
  });

  @override
  List<Object?> get props => [
        parentGuid,
        aLER,
        mainDTL,
      ];
}

class ClearGeneralAnalysis extends GeneralAnalysisEvent {
  ClearGeneralAnalysis();

  @override
  List<Object?> get props => [];
}

//
class FromDateChanged extends GeneralAnalysisEvent {
  final String? fromdate;

  FromDateChanged({this.fromdate});

  @override
  List<Object?> get props => [fromdate];
}

class ToDateChanged extends GeneralAnalysisEvent {
  final String? todate;

  ToDateChanged({this.todate});

  @override
  List<Object?> get props => [todate];
}

class DueDateChanged extends GeneralAnalysisEvent {
  final String? duedate;

  DueDateChanged({this.duedate});

  @override
  List<Object?> get props => [duedate];
}

class LoadMoreGeneralAnalysis extends GeneralAnalysisEvent {
  final String parentGuid;
  final String aLER;
  final String mainDTL;

  LoadMoreGeneralAnalysis({
    required this.parentGuid,
    required this.aLER,
    required this.mainDTL,
  });

  @override
  List<Object?> get props => [
        parentGuid,
        aLER,
        mainDTL,
      ];
}

class AddToPath extends GeneralAnalysisEvent {
  final AccountData? accountData;

  AddToPath({this.accountData});

  @override
  List<Object?> get props => [accountData];
}

class RemoveUtilPath extends GeneralAnalysisEvent {
  final AccountData? accountData;

  RemoveUtilPath({this.accountData});

  @override
  List<Object?> get props => [accountData];
}

class GetGeneralAnalysisCompanys extends GeneralAnalysisEvent {
  GetGeneralAnalysisCompanys();

  @override
  List<Object?> get props => [];
}

class CompanyChanged extends GeneralAnalysisEvent {
  final Company? company;

  CompanyChanged({this.company});

  @override
  List<Object?> get props => [company];
}
