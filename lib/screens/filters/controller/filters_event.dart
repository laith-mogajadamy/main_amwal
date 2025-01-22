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
