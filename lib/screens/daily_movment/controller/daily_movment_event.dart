part of 'daily_movment_bloc.dart';

abstract class DailyMovmentEvent extends Equatable {}

class GetDailyMovment extends DailyMovmentEvent {
  GetDailyMovment();

  @override
  List<Object?> get props => [];
}

class ClearDailyMovment extends DailyMovmentEvent {
  ClearDailyMovment();

  @override
  List<Object?> get props => [];
}

class GetDefDates extends DailyMovmentEvent {
  GetDefDates();
  @override
  List<Object?> get props => [];
}

//
class FromDateChanged extends DailyMovmentEvent {
  final String? fromdate;

  FromDateChanged({this.fromdate});

  @override
  List<Object?> get props => [fromdate];
}

class ToDateChanged extends DailyMovmentEvent {
  final String? todate;

  ToDateChanged({this.todate});

  @override
  List<Object?> get props => [todate];
}

class DueDateChanged extends DailyMovmentEvent {
  final String? duedate;

  DueDateChanged({this.duedate});

  @override
  List<Object?> get props => [duedate];
}

class LoadMoreDailyMovment extends DailyMovmentEvent {
  LoadMoreDailyMovment();

  @override
  List<Object?> get props => [];
}

class GetCompanys extends DailyMovmentEvent {
  GetCompanys();

  @override
  List<Object?> get props => [];
}

class CompanyChanged extends DailyMovmentEvent {
  final Company? company;

  CompanyChanged({this.company});

  @override
  List<Object?> get props => [company];
}

class GetDocumentsCategories extends DailyMovmentEvent {
  final String tybe;

  GetDocumentsCategories({required this.tybe});

  @override
  List<Object?> get props => [tybe];
}

class DocumentsCategoriesChanged extends DailyMovmentEvent {
  final DocumentsCategories? documentsCategorie;

  DocumentsCategoriesChanged({this.documentsCategorie});

  @override
  List<Object?> get props => [documentsCategorie];
}
