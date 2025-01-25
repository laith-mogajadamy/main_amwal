part of 'filters_bloc.dart';

abstract class FiltersEvent extends Equatable {}

//
class PageChanged extends FiltersEvent {
  final String? page;

  PageChanged({this.page});

  @override
  List<Object?> get props => [page];
}

//
class FromDateChanged extends FiltersEvent {
  final String? fromdate;

  FromDateChanged({this.fromdate});

  @override
  List<Object?> get props => [fromdate];
}

class ToDateChanged extends FiltersEvent {
  final String? todate;

  ToDateChanged({this.todate});

  @override
  List<Object?> get props => [todate];
}

class DueDateChanged extends FiltersEvent {
  final String? duedate;

  DueDateChanged({this.duedate});

  @override
  List<Object?> get props => [duedate];
}

//
class GetCurrency extends FiltersEvent {
  GetCurrency();

  @override
  List<Object?> get props => [];
}

class CurrencyChanged extends FiltersEvent {
  final Currency? currency;

  CurrencyChanged({this.currency});

  @override
  List<Object?> get props => [currency];
}

class GetCompanys extends FiltersEvent {
  GetCompanys();

  @override
  List<Object?> get props => [];
}

class CompanyChanged extends FiltersEvent {
  final Company? company;

  CompanyChanged({this.company});

  @override
  List<Object?> get props => [company];
}

class GetCitys extends FiltersEvent {
  GetCitys();

  @override
  List<Object?> get props => [];
}

class CityChanged extends FiltersEvent {
  final String? city;

  CityChanged({this.city});

  @override
  List<Object?> get props => [city];
}
//

class GetAccountTybe extends FiltersEvent {
  GetAccountTybe();

  @override
  List<Object?> get props => [];
}

class AccountTybeChanged extends FiltersEvent {
  final AccountType? accounttype;

  AccountTybeChanged({this.accounttype});

  @override
  List<Object?> get props => [accounttype];
}
//

class GetAgets extends FiltersEvent {
  GetAgets();

  @override
  List<Object?> get props => [];
}

class AgentChanged extends FiltersEvent {
  final Agent? agent;

  AgentChanged({this.agent});

  @override
  List<Object?> get props => [agent];
}

class ClearCustomerAndSupliersFilters extends FiltersEvent {
  ClearCustomerAndSupliersFilters();

  @override
  List<Object?> get props => [];
}

class GetTransportCompanies extends FiltersEvent {
  GetTransportCompanies();

  @override
  List<Object?> get props => [];
}

class TransportCompaniesChanged extends FiltersEvent {
  final TransportCompanies? transportCompanie;

  TransportCompaniesChanged({this.transportCompanie});

  @override
  List<Object?> get props => [transportCompanie];
}

class GetProjects extends FiltersEvent {
  GetProjects();

  @override
  List<Object?> get props => [];
}

class ProjectChanged extends FiltersEvent {
  final Project? project;

  ProjectChanged({this.project});

  @override
  List<Object?> get props => [project];
}

class Getstores extends FiltersEvent {
  Getstores();

  @override
  List<Object?> get props => [];
}

class FirstStoreChanged extends FiltersEvent {
  final Store? store;

  FirstStoreChanged({this.store});

  @override
  List<Object?> get props => [store];
}

class ScondeStoreChanged extends FiltersEvent {
  final Store? store;

  ScondeStoreChanged({this.store});

  @override
  List<Object?> get props => [store];
}

class GetDocumentsCategories extends FiltersEvent {
  final String tybe;

  GetDocumentsCategories({required this.tybe});

  @override
  List<Object?> get props => [tybe];
}

class DocumentsCategoriesChanged extends FiltersEvent {
  final DocumentsCategories? documentsCategorie;

  DocumentsCategoriesChanged({this.documentsCategorie});

  @override
  List<Object?> get props => [documentsCategorie];
}

class GetDocuments extends FiltersEvent {
  final String tybe;

  GetDocuments({required this.tybe});

  @override
  List<Object?> get props => [tybe];
}

class DocumentChanged extends FiltersEvent {
  final Documents? document;

  DocumentChanged({this.document});

  @override
  List<Object?> get props => [document];
}

class GetCustomersFilter extends FiltersEvent {
  final String tybe;

  GetCustomersFilter({required this.tybe});

  @override
  List<Object?> get props => [tybe];
}

class CustomersFilterChanged extends FiltersEvent {
  final CustomersFilter? customer;

  CustomersFilterChanged({this.customer});

  @override
  List<Object?> get props => [customer];
}

class PaymentMethodeChanged extends FiltersEvent {
  final PaymentMethode? paymentMethode;

  PaymentMethodeChanged({this.paymentMethode});

  @override
  List<Object?> get props => [paymentMethode];
}

class ClearPurchasesAndSalesFilters extends FiltersEvent {
  final String tybe;

  ClearPurchasesAndSalesFilters({required this.tybe});

  @override
  List<Object?> get props => [tybe];
}
