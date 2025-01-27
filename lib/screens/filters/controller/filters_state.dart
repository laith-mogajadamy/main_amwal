part of 'filters_bloc.dart';

class FiltersState extends Equatable {
  final String message;
  //
  final String page;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
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
  final List<TransportCompanies> transportCompanies;
  final TransportCompanies selectedtransportCompanie;
  //
  final List<Project> projects;
  final Project selectedproject;
  //
  final List<Store> stores;
  final RequestState storesState;
  final Store firstSelectedStores;
  final Store secondSelectedStores;
  //
  final List<DocumentsCategories> documentsCategories;
  final DocumentsCategories selectedDocumentsCategorie;
  //
  final List<Documents> documents;
  final Documents selectedDocument;
  //
  final List<CustomersFilter> customersFilter;
  final CustomersFilter selectedcustomer;
  //
  final List<PaymentMethode> paymentMethodes;
  final PaymentMethode selectedpaymentMethodes;
  const FiltersState({
    this.message = '',
    this.page = '',
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
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
    this.transportCompanies = const [],
    this.selectedtransportCompanie =
        const TransportCompanies(guid: '', code: '', name: ''),
    //
    this.projects = const [],
    this.selectedproject = const Project(guid: '', code: '', name: ''),
    //
    this.stores = const [],
    this.storesState = RequestState.loading,
    this.firstSelectedStores = const Store(guid: '', code: '', name: ''),
    this.secondSelectedStores = const Store(guid: '', code: '', name: ''),
    //
    this.documentsCategories = const [],
    this.selectedDocumentsCategorie = const DocumentsCategories(
        guid: '', code: '', name: '', iddefault: false),
    //
    this.documents = const [],
    this.selectedDocument =
        const Documents(guid: '', code: '', name: '', categoriesGuid: ''),
    //
    this.customersFilter = const [],
    this.selectedcustomer = const CustomersFilter(guid: '', code: '', name: ''),
    //
    this.paymentMethodes = const [],
    this.selectedpaymentMethodes = const PaymentMethode(code: '', name: ''),
  });

  FiltersState copyWith({
    String? message,
    //
    String? page,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
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
    List<TransportCompanies>? transportCompanies,
    TransportCompanies? selectedtransportCompanie,
    //
    List<Project>? projects,
    Project? selectedproject,
    //
    List<Store>? stores,
    RequestState? storesState,
    Store? firstSelectedStores,
    Store? secondSelectedStores,
    //
    List<DocumentsCategories>? documentsCategories,
    DocumentsCategories? selectedDocumentsCategorie,
    //

    List<Documents>? documents,
    Documents? selectedDocument,
    //

    List<CustomersFilter>? customersFilter,
    CustomersFilter? selectedcustomer,
    //
    List<PaymentMethode>? paymentMethodes,
    PaymentMethode? selectedpaymentMethodes,
  }) {
    return FiltersState(
      message: message ?? this.message,
      //
      page: page ?? this.page,
      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
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
      transportCompanies: transportCompanies ?? this.transportCompanies,
      selectedtransportCompanie:
          selectedtransportCompanie ?? this.selectedtransportCompanie,
      //
      projects: projects ?? this.projects,
      selectedproject: selectedproject ?? this.selectedproject,
      //
      stores: stores ?? this.stores,
      storesState: storesState ?? this.storesState,
      firstSelectedStores: firstSelectedStores ?? this.firstSelectedStores,
      secondSelectedStores: secondSelectedStores ?? this.secondSelectedStores,

      //
      documentsCategories: documentsCategories ?? this.documentsCategories,
      selectedDocumentsCategorie:
          selectedDocumentsCategorie ?? this.selectedDocumentsCategorie,
      //
      documents: documents ?? this.documents,
      selectedDocument: selectedDocument ?? this.selectedDocument,
      //
      customersFilter: customersFilter ?? this.customersFilter,
      selectedcustomer: selectedcustomer ?? this.selectedcustomer,
      //
      paymentMethodes: paymentMethodes ?? this.paymentMethodes,
      selectedpaymentMethodes:
          selectedpaymentMethodes ?? this.selectedpaymentMethodes,
    );
  }

  @override
  List<Object?> get props => [
        message,
        //
        page,
        //
        fromDate,
        toDate,
        dueDate,
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
        transportCompanies,
        selectedtransportCompanie,
        //
        projects,
        selectedproject,
        //
        stores,
        storesState,
        firstSelectedStores,
        secondSelectedStores,
        //
        documentsCategories,
        selectedDocumentsCategorie,
        //
        documents,
        selectedDocument,
        //
        customersFilter,
        selectedcustomer,
        //
        paymentMethodes,
        selectedpaymentMethodes,
      ];
}
