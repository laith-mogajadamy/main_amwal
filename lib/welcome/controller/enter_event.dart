part of 'enter_bloc.dart';

abstract class EnterEvent extends Equatable {}

class Getuser extends EnterEvent {
  Getuser();

  @override
  List<Object?> get props => [];
}

class LanguageChanged extends EnterEvent {
  final String? language;

  LanguageChanged({this.language});

  @override
  List<Object?> get props => [language];
}

class LoginEmailChanged extends EnterEvent {
  final String? email;

  LoginEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends EnterEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginNameChanged extends EnterEvent {
  final String? name;

  LoginNameChanged({this.name});

  @override
  List<Object?> get props => [name];
}

class CityChanged extends EnterEvent {
  final String? city;

  CityChanged({this.city});

  @override
  List<Object?> get props => [city];
}

class LoginSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends EnterEvent {
  final String? token;
  Logout({this.token});

  @override
  List<Object?> get props => [token];
}

//
class GetCurrency extends EnterEvent {
  GetCurrency();

  @override
  List<Object?> get props => [];
}

class CurrencyChanged extends EnterEvent {
  final Currency? currency;

  CurrencyChanged({this.currency});

  @override
  List<Object?> get props => [currency];
}

class GetCompanys extends EnterEvent {
  GetCompanys();

  @override
  List<Object?> get props => [];
}

class CompanyChanged extends EnterEvent {
  final Company? company;

  CompanyChanged({this.company});

  @override
  List<Object?> get props => [company];
}

class GetCitys extends EnterEvent {
  GetCitys();

  @override
  List<Object?> get props => [];
}

class SelectedCityChanged extends EnterEvent {
  final String? city;

  SelectedCityChanged({this.city});

  @override
  List<Object?> get props => [city];
}
//

class GetAccountTybe extends EnterEvent {
  GetAccountTybe();

  @override
  List<Object?> get props => [];
}

class AccountTybeChanged extends EnterEvent {
  final AccountType? accounttype;

  AccountTybeChanged({this.accounttype});

  @override
  List<Object?> get props => [accounttype];
}
//

class GetAgets extends EnterEvent {
  GetAgets();

  @override
  List<Object?> get props => [];
}

class AgentChanged extends EnterEvent {
  final Agent? agent;

  AgentChanged({this.agent});

  @override
  List<Object?> get props => [agent];
}

//
class PageChanged extends EnterEvent {
  final String? page;

  PageChanged({this.page});

  @override
  List<Object?> get props => [page];
}

class ClearFilters extends EnterEvent {
  ClearFilters();

  @override
  List<Object?> get props => [];
}
