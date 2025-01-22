part of 'filters_bloc.dart';

class FiltersState extends Equatable {
  final String message;
  //
  final String page;

  //
  final List<Currency> currencys;
  final Currency selectedcurrency;
  //
  final List<Company> companys;
  final Company selectedcompany;
  //
  final List<AccountType> accounttypes;
  final AccountType selectedaccounttype;
  //
  final List<String> citys;
  final String selectedcity;
  //
  final List<Agent> agents;
  final Agent selectedagent;
  //
  const FiltersState({
    this.message = '',
    this.page = '',

    //
    this.currencys = const [],
    this.selectedcurrency = const Currency(guid: '', code: '', iddefault: ''),
    //
    this.companys = const [],
    this.selectedcompany =
        const Company(guid: '', code: '', name: '', iddefault: ''),
    //
    this.accounttypes = const [],
    this.selectedaccounttype = const AccountType(name: '', val: ''),
    //
    this.citys = const [],
    this.selectedcity = '',
    //
    this.agents = const [],
    this.selectedagent = const Agent(guid: '', code: '', name: ''),
    //
  });

  FiltersState copyWith({
    String? message,
    //
    String? page,

    //
    String? companyname,
    String? currentFiscalYearCode,
    //
    List<Currency>? currencys,
    Currency? selectedcurrency,
    //
    List<Company>? companys,
    Company? selectedcompany,
    //
    List<AccountType>? accounttypes,
    AccountType? selectedaccounttype,
    //
    List<String>? citys,
    String? selectedcity,
    //
    List<Agent>? agents,
    Agent? selectedagent,
    //
  }) {
    return FiltersState(
      message: message ?? this.message,
      //
      page: page ?? this.page,
      //
      currencys: currencys ?? this.currencys,
      selectedcurrency: selectedcurrency ?? this.selectedcurrency,
      //
      companys: companys ?? this.companys,
      selectedcompany: selectedcompany ?? this.selectedcompany,
      //
      accounttypes: accounttypes ?? this.accounttypes,
      selectedaccounttype: selectedaccounttype ?? this.selectedaccounttype,
      //
      citys: citys ?? this.citys,
      selectedcity: selectedcity ?? this.selectedcity,
      //
      agents: agents ?? this.agents,
      selectedagent: selectedagent ?? this.selectedagent,
      //
    );
  }

  @override
  List<Object?> get props => [
        message,
        //
        page,
        //
        currencys,
        selectedcurrency,
        //
        companys,
        selectedcompany,
        //
        accounttypes,
        selectedaccounttype,
        //
        citys,
        selectedcity,
        //
        agents,
        selectedagent,
        //
      ];
}
