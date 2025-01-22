// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/account_type.dart';
import 'package:mainamwal/model/filters/account_type_model.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent_model.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/model/filters/currency.dart';
import 'package:mainamwal/model/filters/currency_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/model/filters/customers_filter.dart';
import 'package:mainamwal/model/filters/customers_filter_model.dart';
import 'package:mainamwal/model/filters/documents.dart';
import 'package:mainamwal/model/filters/documents_categories.dart';
import 'package:mainamwal/model/filters/documents_categories_model.dart';
import 'package:mainamwal/model/filters/documents_model.dart';
import 'package:mainamwal/model/filters/payment_methode.dart';
import 'package:mainamwal/model/filters/project.dart';
import 'package:mainamwal/model/filters/project_model.dart';
import 'package:mainamwal/model/filters/transport_companies.dart';
import 'package:mainamwal/model/filters/transport_companies_model.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltesBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltesBloc() : super(const FiltersState()) {
    //
    on<PageChanged>((event, emit) async {
      emit(state.copyWith(
        page: event.page,
      ));
    });
    //
    on<GetCurrency>((event, emit) async {
      print("GetCurrency");
      http.Response response = await VeriabelsRequest.getcurrency();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            currencys: List<CurrencyModel>.from(
              (responsemap['data'] as List).map(
                (e) => CurrencyModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
        emit(
          state.copyWith(
            selectedcurrency: state.currencys.firstWhere(
              (element) => element.iddefault == '1',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<CurrencyChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcurrency: event.currency,
      ));
    });
    //
    on<GetCompanys>((event, emit) async {
      print("GetCompanys");

      http.Response response = await VeriabelsRequest.getcompanys();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            companys: List<CompanyModel>.from(
              (responsemap['data'] as List).map(
                (e) => CompanyModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
        emit(
          state.copyWith(
              selectedcompany: state.companys.firstWhere(
            (element) => element.iddefault == '1',
          )),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<CompanyChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcompany: event.company,
      ));
    });
    //
    on<GetCitys>((event, emit) async {
      print("GetCitys");

      http.Response response = await VeriabelsRequest.getcitys();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            citys: List<String>.from((responsemap['data'] as List)),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcity: event.city,
      ));
    });
    //
    on<GetAccountTybe>((event, emit) async {
      print("GetAccountTybe");

      http.Response response = await VeriabelsRequest.getaccounttype();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            accounttypes: List<AccountTypeModel>.from(
              (responsemap['data'] as List).map(
                (e) => AccountTypeModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
        emit(
          state.copyWith(
            selectedaccounttype: state.accounttypes.firstWhere(
              (element) => element.val == '0',
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<AccountTybeChanged>((event, emit) async {
      emit(state.copyWith(
        selectedaccounttype: event.accounttype,
      ));
    });
    //
    on<GetAgets>((event, emit) async {
      print("GetAgets");

      http.Response response = await VeriabelsRequest.getagents();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            agents: List<AgentModel>.from(
              (responsemap['data'] as List).map(
                (e) => AgentModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<AgentChanged>((event, emit) async {
      emit(state.copyWith(
        selectedagent: event.agent,
      ));
    });
    //
    on<ClearCustomerAndSupliersFilters>((event, emit) async {
      add(GetCurrency());
      add(GetCompanys());
      add(GetCitys());
      add(GetAccountTybe());
      add(GetAgets());
      emit(
        state.copyWith(
          selectedcurrency: state.currencys.firstWhere(
            (element) => element.iddefault == '1',
          ),
          selectedcompany: state.companys.firstWhere(
            (element) => element.iddefault == '1',
          ),
          selectedcity: '',
          selectedaccounttype: state.accounttypes.firstWhere(
            (element) => element.val == '0',
          ),
          selectedagent: Agent(guid: '', code: '', name: ''),
        ),
      );
    });

    //
    on<GetTransportCompanies>((event, emit) async {
      print("GetTransportCompanies");

      http.Response response = await VeriabelsRequest.gettransportCompanies();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            transportCompanies: List<TransportCompaniesModel>.from(
              (responsemap['data'] as List).map(
                (e) => TransportCompaniesModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<TransportCompaniesChanged>((event, emit) async {
      emit(state.copyWith(
        selectedtransportCompanie: event.transportCompanie,
      ));
    });
    //
    on<GetProjects>((event, emit) async {
      print("GetProjects");

      http.Response response = await VeriabelsRequest.getproject();
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            projects: List<ProjectModel>.from(
              (responsemap['data'] as List).map(
                (e) => ProjectModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<ProjectChanged>((event, emit) async {
      emit(state.copyWith(
        selectedproject: event.project,
      ));
    });
    //
    on<GetDocumentsCategories>((event, emit) async {
      print("GetDocumentsCategories");

      http.Response response =
          await VeriabelsRequest.getdocumentscategories(event.tybe);
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            documentsCategories: List<DocumentsCategoriesModel>.from(
              (responsemap['data'] as List).map(
                (e) => DocumentsCategoriesModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
        emit(
          state.copyWith(
              selectedDocumentsCategorie: state.documentsCategories.firstWhere(
            (element) => element.iddefault == 'true',
          )),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<DocumentsCategoriesChanged>((event, emit) async {
      emit(state.copyWith(
        selectedDocumentsCategorie: event.documentsCategorie,
      ));
    });
    //
    on<GetDocuments>((event, emit) async {
      print("GetDocuments");

      http.Response response = await VeriabelsRequest.getdocuments(event.tybe);
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            documents: List<DocumentsModel>.from(
              (responsemap['data'] as List).map(
                (e) => DocumentsModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<DocumentChanged>((event, emit) async {
      emit(state.copyWith(
        selectedDocument: event.document,
      ));
    });
    //
    on<GetCustomersFilter>((event, emit) async {
      print("GetCustomersFilter");

      http.Response response =
          await VeriabelsRequest.getfiltercustomers(event.tybe);
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            customersFilter: List<CustomersFilterModel>.from(
              (responsemap['data'] as List).map(
                (e) => CustomersFilterModel.fromJson(e),
              ),
            ),
            message: responsemap['message'],
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: responsemap['message'],
          ),
        );
      }
    });
    //
    on<CustomersFilterChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcustomer: event.customer,
      ));
    });
    //
    on<PaymentMethodeChanged>((event, emit) async {
      emit(state.copyWith(
        selectedpaymentMethodes: event.paymentMethode,
      ));
    });
    //
    on<ClearPurchasesAndSalesFilters>((event, emit) async {
      emit(state.copyWith(
        paymentMethodes: [
          PaymentMethode(code: '0', name: S().all),
          PaymentMethode(code: '1', name: S().delayed),
          PaymentMethode(code: '2', name: S().cash),
        ],
      ));
      add(GetTransportCompanies());
      add(GetCompanys());
      add(GetProjects());
      add(GetDocumentsCategories(tybe: event.tybe));
      add(GetDocuments(tybe: event.tybe));
      add(GetAgets());
      emit(
        state.copyWith(
          selectedtransportCompanie:
              TransportCompanies(guid: '', code: '', name: ''),
          selectedcompany: state.companys.firstWhere(
            (element) => element.iddefault == '1',
          ),
          selectedproject: Project(guid: '', code: '', name: ''),
          selectedDocumentsCategorie:
              DocumentsCategories(guid: '', code: '', name: '', iddefault: ''),
          selectedDocument:
              Documents(guid: '', code: '', name: '', categoriesGuid: ''),
          selectedagent: Agent(guid: '', code: '', name: ''),
          selectedpaymentMethodes: PaymentMethode(code: '0', name: S().all),
        ),
      );
    });
  }
}
