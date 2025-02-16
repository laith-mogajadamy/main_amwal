part of 'purchases_and_sales_bloc.dart';

abstract class PurchasesAndSalesEvent extends Equatable {}

class GetDailyPruchasAndSale extends PurchasesAndSalesEvent {
  final String type;
  final String firstStoreGuid;
  final String customerGuid;
  final String agentGuid;
  final String documentGuid;
  final String categoriesGuid;
  final String projectDefaultGuid;
  final String companiesGuid;
  final String transportCompaniesGuid;
  final String dueDated;
  final String secondStoreGuid;
  final String dateFrom;
  final String dateTo;
  final String currGuid;

  GetDailyPruchasAndSale({
    required this.type,
    required this.firstStoreGuid,
    required this.customerGuid,
    required this.agentGuid,
    required this.documentGuid,
    required this.categoriesGuid,
    required this.projectDefaultGuid,
    required this.companiesGuid,
    required this.transportCompaniesGuid,
    required this.dueDated,
    required this.secondStoreGuid,
    required this.dateFrom,
    required this.dateTo,
    required this.currGuid,
  });

  @override
  List<Object?> get props => [
        type,
        firstStoreGuid,
        customerGuid,
        agentGuid,
        documentGuid,
        categoriesGuid,
        projectDefaultGuid,
        companiesGuid,
        transportCompaniesGuid,
        dueDated,
        secondStoreGuid,
        dateFrom,
        dateTo,
        currGuid,
      ];
}

class ClearDailyPruchasAndSale extends PurchasesAndSalesEvent {
  ClearDailyPruchasAndSale();

  @override
  List<Object?> get props => [];
}

class GetDefDates extends PurchasesAndSalesEvent {
  final BuildContext context;
  GetDefDates({required this.context});
  @override
  List<Object?> get props => [];
}

//
class FromDateChanged extends PurchasesAndSalesEvent {
  final String? fromdate;

  FromDateChanged({this.fromdate});

  @override
  List<Object?> get props => [fromdate];
}

class ToDateChanged extends PurchasesAndSalesEvent {
  final String? todate;

  ToDateChanged({this.todate});

  @override
  List<Object?> get props => [todate];
}

class DueDateChanged extends PurchasesAndSalesEvent {
  final String? duedate;

  DueDateChanged({this.duedate});

  @override
  List<Object?> get props => [duedate];
}

class LoadMoreDailyPruchasAndSale extends PurchasesAndSalesEvent {
  final String type;
  final String firstStoreGuid;
  final String customerGuid;
  final String agentGuid;
  final String documentGuid;
  final String categoriesGuid;
  final String projectDefaultGuid;
  final String companiesGuid;
  final String transportCompaniesGuid;
  final String dueDated;
  final String secondStoreGuid;
  final String dateFrom;
  final String dateTo;
  final String currGuid;

  LoadMoreDailyPruchasAndSale({
    required this.type,
    required this.firstStoreGuid,
    required this.customerGuid,
    required this.agentGuid,
    required this.documentGuid,
    required this.categoriesGuid,
    required this.projectDefaultGuid,
    required this.companiesGuid,
    required this.transportCompaniesGuid,
    required this.dueDated,
    required this.secondStoreGuid,
    required this.dateFrom,
    required this.dateTo,
    required this.currGuid,
  });

  @override
  List<Object?> get props => [
        type,
        firstStoreGuid,
        customerGuid,
        agentGuid,
        documentGuid,
        categoriesGuid,
        projectDefaultGuid,
        companiesGuid,
        transportCompaniesGuid,
        dueDated,
        secondStoreGuid,
        dateFrom,
        dateTo,
        currGuid,
      ];
}
