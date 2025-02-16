part of 'customers_bloc.dart';

abstract class CustomersEvent extends Equatable {}

class ClearCustomers extends CustomersEvent {
  ClearCustomers();

  @override
  List<Object?> get props => [];
}

class GetCustomers extends CustomersEvent {
  final Currency? currency;
  final Company? company;
  final String? city;
  final Agent? agent;
  final AccountType? accountType;
  final String? name;

  GetCustomers({
    this.currency,
    this.company,
    this.city,
    this.agent,
    this.accountType,
    this.name,
  });

  @override
  List<Object?> get props => [
        currency,
        company,
        city,
        agent,
        accountType,
        name,
      ];
}

class GetSuppliers extends CustomersEvent {
  final Currency? currency;
  final Company? company;
  final String? city;
  final Agent? agent;
  final AccountType? accountType;
  final String? name;
  GetSuppliers({
    this.currency,
    this.company,
    this.city,
    this.agent,
    this.accountType,
    this.name,
  });

  @override
  List<Object?> get props => [
        currency,
        company,
        city,
        agent,
        accountType,
        name,
      ];
}

class ShowFilter extends CustomersEvent {
  final bool? filter;

  ShowFilter({
    this.filter,
  });

  @override
  List<Object?> get props => [
        filter,
      ];
}

//
class GetDefDates extends CustomersEvent {
  final String? guid;

  GetDefDates({
    this.guid,
  });

  @override
  List<Object?> get props => [
        guid,
      ];
}

class ChangeFromDate extends CustomersEvent {
  final String? fromdate;

  ChangeFromDate({
    this.fromdate,
  });

  @override
  List<Object?> get props => [
        fromdate,
      ];
}

class ChangeToDate extends CustomersEvent {
  final String? todate;

  ChangeToDate({
    this.todate,
  });

  @override
  List<Object?> get props => [
        todate,
      ];
}

class ChangeStateDate extends CustomersEvent {
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
class ChangeTotalFilter extends CustomersEvent {
  final String? totalfilter;

  ChangeTotalFilter({
    this.totalfilter,
  });

  @override
  List<Object?> get props => [
        totalfilter,
      ];
}

class ChangeAcountStatmentPage extends CustomersEvent {
  final bool? acountstatmentpage;

  ChangeAcountStatmentPage({
    this.acountstatmentpage,
  });

  @override
  List<Object?> get props => [
        acountstatmentpage,
      ];
}

//
class GetAgentCardCustomer extends CustomersEvent {
  final String? guid;

  GetAgentCardCustomer({
    this.guid,
  });

  @override
  List<Object?> get props => [
        guid,
      ];
}

//
class GetAgentCardSupplier extends CustomersEvent {
  final String? guid;

  GetAgentCardSupplier({
    this.guid,
  });

  @override
  List<Object?> get props => [
        guid,
      ];
}

//
class GetStatment extends CustomersEvent {
  final String? guid;
  final String? tybe;
  final String? fromDate;
  final String? toDate;

  GetStatment({
    this.guid,
    this.tybe,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Object?> get props => [
        guid,
        tybe,
        fromDate,
        toDate,
      ];
}

//
class GetStatmentOpeningBalance extends CustomersEvent {
  final String? guid;
  final String? tybe;
  final String? fromDate;
  final String? toDate;

  GetStatmentOpeningBalance({
    this.guid,
    this.tybe,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Object?> get props => [
        guid,
        tybe,
        fromDate,
        toDate,
      ];
}

//
class GetStatmentCreditDebitSum extends CustomersEvent {
  final String? guid;
  final String? tybe;
  final String? fromDate;
  final String? toDate;

  GetStatmentCreditDebitSum({
    this.guid,
    this.tybe,
    this.fromDate,
    this.toDate,
  });

  @override
  List<Object?> get props => [
        guid,
        tybe,
        fromDate,
        toDate,
      ];
}

class LoadMoreStatment extends CustomersEvent {
  final String? guid;
  final String? tybe;

  final int perPage;

  LoadMoreStatment({
    this.guid,
    this.tybe,
    required this.perPage,
  });

  @override
  List<Object?> get props => [
        guid,
        tybe,
        perPage,
      ];
}

class LoadMoreCustomers extends CustomersEvent {
  final Currency? currency;
  final Company? company;
  final String? city;
  final Agent? agent;
  final AccountType? accountType;
  final String? name;

  LoadMoreCustomers({
    this.currency,
    this.company,
    this.city,
    this.agent,
    this.accountType,
    this.name,
  });

  @override
  List<Object?> get props => [
        currency,
        company,
        city,
        agent,
        accountType,
        name,
      ];
}

class LoadMoreSuppliers extends CustomersEvent {
  final Currency? currency;
  final Company? company;
  final String? city;
  final Agent? agent;
  final AccountType? accountType;
  final String? name;

  LoadMoreSuppliers({
    this.currency,
    this.company,
    this.city,
    this.agent,
    this.accountType,
    this.name,
  });

  @override
  List<Object?> get props => [
        currency,
        company,
        city,
        agent,
        accountType,
        name,
      ];
}
