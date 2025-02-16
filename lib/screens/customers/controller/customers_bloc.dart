import 'dart:convert';

import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed_model.dart';
import 'package:mainamwal/model/filters/account_type.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent_card.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent_card_model.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/currency.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer_model.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total_model.dart';
import 'package:mainamwal/screens/customers/data/customersrqwest.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc() : super(const CustomersState()) {
    on<ClearCustomers>((event, emit) async {
      emit(
        state.copyWith(
          customers: [],
          customerState: RequestState.loading,
        ),
      );
    });
    on<GetCustomers>((event, emit) async {
      print("GetCustomers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          customerState: RequestState.loading,
          token: ptoken,
          customerPage: 1,
        ));
        List filters = [];
        if (event.currency != null) {
          filters.add(
            {
              "id": "DealingCurrencyGuid",
              "filterFns": "equals",
              "value": event.currency?.guid ?? "",
            },
          );
        }
        if (event.name != '' && event.name != null) {
          filters.add(
            {
              "id": "Name",
              "filterFns": "contains",
              "value": event.name ?? "",
            },
          );
        }
        if (event.city != '' && event.city != null) {
          filters.add(
            {
              "id": "City",
              "filterFns": "equals",
              "value": event.city ?? "",
            },
          );
        }
        if (event.company != null) {
          filters.add(
            {
              "id": "CompaniesGuid",
              "filterFns": "equals",
              "value": event.company?.guid ?? "",
            },
          );
        }
        if (event.accountType != null) {
          filters.add(
            {
              "id": "AccountType",
              "filterFns": "equals",
              "value": event.accountType?.val ?? "",
            },
          );
        }
        if (event.agent != null &&
            event.agent != Agent(guid: '', code: '', name: '')) {
          filters.add(
            {
              "id": "AgentGuid",
              "filterFns": "equals",
              "value": event.agent?.guid ?? "",
            },
          );
        }

        print(filters);
        http.Response response = await CustomersReqwest.getcustomers(
          state.token,
          filters,
          1,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            customers: List<CustomerModel>.from(
              (responsemap['data'] as List).map(
                (e) => CustomerModel.fromJson(e),
              ),
            ),
            customerState: RequestState.loaded,
            customerMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.customers=");
          print(state.customers);
        } else {
          emit(state.copyWith(
            customerState: RequestState.error,
            customerMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          customerState: RequestState.error,
          customerMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetSuppliers>((event, emit) async {
      print("GetSuppliers");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          customerState: RequestState.loading,
          token: ptoken,
        ));
        List filters = [];
        if (event.currency != null) {
          filters.add(
            {
              "id": "DealingCurrencyGuid",
              "filterFns": "equals",
              "value": event.currency?.guid ?? "",
            },
          );
        }
        if (event.name != '' && event.name != null) {
          filters.add(
            {
              "id": "Name",
              "filterFns": "contains",
              "value": event.name ?? "",
            },
          );
        }
        if (event.city != '' && event.city != null) {
          filters.add(
            {
              "id": "City",
              "filterFns": "equals",
              "value": event.city ?? "",
            },
          );
        }
        if (event.company != null) {
          filters.add(
            {
              "id": "CompaniesGuid",
              "filterFns": "equals",
              "value": event.company?.guid ?? "",
            },
          );
        }
        if (event.accountType != null) {
          filters.add(
            {
              "id": "AccountType",
              "filterFns": "equals",
              "value": event.accountType?.val ?? "",
            },
          );
        }
        if (event.agent != null &&
            event.agent != Agent(guid: '', code: '', name: '')) {
          filters.add(
            {
              "id": "AgentGuid",
              "filterFns": "equals",
              "value": event.agent?.guid ?? "",
            },
          );
        }

        print(filters);
        http.Response response = await CustomersReqwest.getsuppliers(
          state.token,
          filters,
          1,
        );
        var responsemap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            customers: List<CustomerModel>.from(
              (responsemap['data'] as List).map(
                (e) => CustomerModel.fromJson(e),
              ),
            ),
            customerState: RequestState.loaded,
            customerMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.customers=");
          print(state.customers);
        } else {
          emit(state.copyWith(
            customerState: RequestState.error,
            customerMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          customerState: RequestState.error,
          customerMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetAgentCardCustomer>((event, emit) async {
      print("GetAgentCard");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          agentCardState: RequestState.loading,
          token: ptoken,
        ));
        http.Response response =
            await CustomersReqwest.getagentcardcustomer(event.guid!);
        var responsemap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            acountstatmentpage: false,
            agentCard: AgentCardModel.fromJson(responsemap['data']),
            agentCardState: RequestState.loaded,
            customerMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.agentCard=");
          print(state.agentCard);
        } else {
          emit(state.copyWith(
            agentCardState: RequestState.error,
            customerMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          agentCardState: RequestState.error,
          customerMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<GetAgentCardSupplier>((event, emit) async {
      print("GetAgentCardSupplier");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          agentCardState: RequestState.loading,
          token: ptoken,
        ));
        http.Response response =
            await CustomersReqwest.getagentcardsupplier(event.guid!);
        var responsemap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            acountstatmentpage: false,
            agentCard: AgentCardModel.fromJson(responsemap['data']),
            agentCardState: RequestState.loaded,
            customerMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.agentCard=");
          print(state.agentCard);
        } else {
          emit(state.copyWith(
            agentCardState: RequestState.error,
            customerMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          agentCardState: RequestState.error,
          customerMessage: "Unauthenticated",
        ));
      }
    });
    on<ShowFilter>((event, emit) async {
      emit(
        state.copyWith(
          filter: event.filter,
        ),
      );
    });
    on<ChangeFromDate>((event, emit) async {
      emit(
        state.copyWith(
          fromdate: event.fromdate,
          statmentTotal: const [],
          statmentTotalState: RequestState.error,
          statmentTotalMessage: '',
          statmentDetailed: const [],
          statmentDetailedState: RequestState.error,
          statmentDetailedMessage: '',
          statmentOpeningBalance: '',
          statmentCreditsum: '',
          statmentDebitsum: '',
          statmentBalance: '',
        ),
      );
    });
    on<ChangeToDate>((event, emit) async {
      emit(
        state.copyWith(
          todate: event.todate,
          statmentTotal: const [],
          statmentTotalState: RequestState.error,
          statmentTotalMessage: '',
          statmentDetailed: const [],
          statmentDetailedState: RequestState.error,
          statmentDetailedMessage: '',
          statmentOpeningBalance: '',
          statmentCreditsum: '',
          statmentDebitsum: '',
          statmentBalance: '',
        ),
      );
    });
    //
    on<ChangeStateDate>((event, emit) async {
      emit(
        state.copyWith(
          statedate: event.statedate,
          statmentTotal: const [],
          statmentTotalState: RequestState.error,
          statmentTotalMessage: '',
          statmentDetailed: const [],
          statmentDetailedState: RequestState.error,
          statmentDetailedMessage: '',
          statmentOpeningBalance: '',
          statmentCreditsum: '',
          statmentDebitsum: '',
          statmentBalance: '',
        ),
      );
    });
    on<ChangeTotalFilter>((event, emit) async {
      emit(
        state.copyWith(
          totalfiter: event.totalfilter,
          statmentTotal: const [],
          statmentTotalState: RequestState.error,
          statmentTotalMessage: '',
          statmentDetailed: const [],
          statmentDetailedState: RequestState.error,
          statmentDetailedMessage: '',
          statmentOpeningBalance: '',
          statmentCreditsum: '',
          statmentDebitsum: '',
          statmentBalance: '',
        ),
      );
    });
    //
    on<ChangeAcountStatmentPage>((event, emit) async {
      emit(
        state.copyWith(
          acountstatmentpage: event.acountstatmentpage,
        ),
      );
    });
    //
    //
    on<GetDefDates>((event, emit) async {
      emit(
        state.copyWith(
          statmentTotal: const [],
          statmentTotalState: RequestState.error,
          statmentTotalMessage: '',
          statmentDetailed: const [],
          statmentDetailedState: RequestState.error,
          statmentDetailedMessage: '',
        ),
      );
      print("GetDefDates");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
        ));
        http.Response response = await CustomersReqwest.getdefdate(event.guid!);
        var responsemap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          emit(state.copyWith(
            fromdate: responsemap['data']?['CurrentPeriodStartDate'] ?? '',
            todate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
            statedate: responsemap['data']?['StateDate'] ?? '',
            statmentOpeningBalance: '',
            statmentCreditsum: '',
            statmentDebitsum: '',
            statmentBalance: '',
          ));
        } else {
          emit(state.copyWith());
        }
      } else {
        emit(state.copyWith());
      }
    });
    on<GetStatment>((event, emit) async {
      print("GetStatment");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        if (event.tybe == '0') {
          emit(state.copyWith(
            statmentTotalState: RequestState.loading,
            token: ptoken,
            statmentPage: 1,
          ));
        } else {
          emit(state.copyWith(
            statmentDetailedState: RequestState.loading,
            token: ptoken,
            statmentPage: 1,
          ));
        }

        http.Response response = await CustomersReqwest.getstatment(
          event.guid!,
          event.tybe!,
          event.fromDate!,
          event.toDate!,
          1,
          25,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          if (event.tybe == '0') {
            emit(state.copyWith(
              statmentTotal: List<StatmentTotalModel>.from(
                (responsemap['data'] as List).map(
                  (e) => StatmentTotalModel.fromJson(e),
                ),
              ),
              statmentTotalState: RequestState.loaded,
              statmentTotalMessage: responsemap['message'] ?? '',
              //
            ));
            print("state.statmentTotal=");
            print(state.statmentTotal);
          } else {
            emit(state.copyWith(
              statmentDetailed: List<StatmentDetailedModel>.from(
                (responsemap['data'] as List).map(
                  (e) => StatmentDetailedModel.fromJson(e),
                ),
              ),
              statmentDetailedState: RequestState.loaded,
              statmentDetailedMessage: responsemap['message'] ?? '',
              //
            ));
            print("state.statmentDetailed=");
            print(state.statmentDetailed);
          }
        } else {
          if (event.tybe == '0') {
            emit(state.copyWith(
              statmentTotalState: RequestState.error,
              statmentTotalMessage: responsemap["message"] ?? '',
            ));
          } else {
            emit(state.copyWith(
              statmentDetailedState: RequestState.error,
              statmentDetailedMessage: responsemap["message"] ?? '',
            ));
          }
        }
      } else {
        if (event.tybe == '0') {
          emit(state.copyWith(
            statmentTotalState: RequestState.error,
            statmentTotalMessage: 'Unauthenticated',
          ));
        } else {
          emit(state.copyWith(
            statmentDetailedState: RequestState.error,
            statmentDetailedMessage: 'Unauthenticated',
          ));
        }
      }
    });
    //
    on<GetStatmentOpeningBalance>((event, emit) async {
      print("GetStatmentOpeningBalance");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
        ));

        http.Response response =
            await CustomersReqwest.getstatmentopeningbalance(
          event.guid!,
          event.tybe!,
          event.fromDate!,
          event.toDate!,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            statmentOpeningBalance: responsemap["data"] ?? '',
            //
          ));
          print("state.statmentOpeningBalance=");
          print(state.statmentOpeningBalance);
        } else {
          emit(state.copyWith());
        }
        double o = double.parse(state.statmentOpeningBalance);
        double c = double.parse(state.statmentCreditsum);
        double d = double.parse(state.statmentDebitsum);
        double b = o + (d - c);
        emit(state.copyWith(
          statmentBalance: b.toString(),
        ));
      } else {
        emit(state.copyWith());
      }
    });
    //
    on<GetStatmentCreditDebitSum>((event, emit) async {
      print("GetStatmentCreditDebitSum");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
        ));

        http.Response response =
            await CustomersReqwest.getstatmentcreditDebitSum(
          event.guid!,
          event.tybe!,
          event.fromDate!,
          event.toDate!,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            statmentCreditsum:
                responsemap["data"]?['Credit_sum'].toString() ?? '',
            statmentDebitsum:
                responsemap["data"]?['Debit_sum'].toString() ?? '',

            //
          ));
          print("state.statmentCreditsum=");
          print(state.statmentCreditsum);
          print("state.statmentDebitsum=");
          print(state.statmentDebitsum);
          double o = double.parse(state.statmentOpeningBalance);
          double c = double.parse(state.statmentCreditsum);
          double d = double.parse(state.statmentDebitsum);
          double b = o + (d - c);
          emit(state.copyWith(
            statmentBalance: b.toString(),
          ));
        } else {
          emit(state.copyWith());
        }
      } else {
        emit(state.copyWith());
      }
    });
    //
    on<LoadMoreStatment>((event, emit) async {
      print("LoadMoreStatment");
      emit(state.copyWith(
        statmentLoadMoreState: RequestState.loading,
        statmentPage: state.statmentPage + 1,
      ));
      http.Response response = await CustomersReqwest.getstatment(
        event.guid!,
        event.tybe!,
        state.fromdate,
        state.todate,
        state.statmentPage,
        event.perPage,
      );
      var responsemap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (event.tybe == '0') {
          print(state.statmentTotal.length);

          List<StatmentTotal> statmentTotal = state.statmentTotal;
          List<StatmentTotal> newstatmentTotal = List<StatmentTotalModel>.from(
            (responsemap['data'] as List).map(
              (e) => StatmentTotalModel.fromJson(e),
            ),
          );
          statmentTotal.addAll(newstatmentTotal);
          emit(state.copyWith(
            statmentTotal: statmentTotal,
            statmentLoadMoreState: RequestState.loaded,
            //
          ));
          print("state.statmentTotal=");
          print(state.statmentTotal);
          print(state.statmentTotal.length);
        } else {
          print(state.statmentDetailed.length);

          List<StatmentDetailed> statmentDetailed = state.statmentDetailed;
          List<StatmentDetailed> newstatmentDetailed =
              List<StatmentDetailedModel>.from(
            (responsemap['data'] as List).map(
              (e) => StatmentDetailedModel.fromJson(e),
            ),
          );
          statmentDetailed.addAll(newstatmentDetailed);
          emit(state.copyWith(
            statmentDetailed: statmentDetailed,
            statmentLoadMoreState: RequestState.loaded,
            //
          ));
          print("state.statmentDetailed=");
          print(state.statmentDetailed);
          print(state.statmentDetailed.length);
        }
      } else {
        emit(state.copyWith(
          statmentLoadMoreState: RequestState.error,
          statmentTotalMessage: responsemap["message"] ?? '',
        ));
      }
    });
    //
    on<LoadMoreCustomers>((event, emit) async {
      print("LoadMoreCustomers");

      emit(state.copyWith(
        customerLoadMoreState: RequestState.loading,
        customerPage: state.customerPage + 1,
      ));
      List filters = [];
      if (event.currency != null) {
        filters.add(
          {
            "id": "DealingCurrencyGuid",
            "filterFns": "equals",
            "value": event.currency?.guid ?? "",
          },
        );
      }
      if (event.name != '' && event.name != null) {
        filters.add(
          {
            "id": "Name",
            "filterFns": "contains",
            "value": event.name ?? "",
          },
        );
      }
      if (event.city != '' && event.city != null) {
        filters.add(
          {
            "id": "City",
            "filterFns": "equals",
            "value": event.city ?? "",
          },
        );
      }
      if (event.company != null) {
        filters.add(
          {
            "id": "CompaniesGuid",
            "filterFns": "equals",
            "value": event.company?.guid ?? "",
          },
        );
      }
      if (event.accountType != null) {
        filters.add(
          {
            "id": "AccountType",
            "filterFns": "equals",
            "value": event.accountType?.val ?? "",
          },
        );
      }
      if (event.agent != null &&
          event.agent != Agent(guid: '', code: '', name: '')) {
        filters.add(
          {
            "id": "AgentGuid",
            "filterFns": "equals",
            "value": event.agent?.guid ?? "",
          },
        );
      }

      print(filters);
      http.Response response = await CustomersReqwest.getcustomers(
        state.token,
        filters,
        state.customerPage,
      );
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Customer> customers = state.customers;
        List<CustomerModel> newcustomers = List<CustomerModel>.from(
          (responsemap['data'] as List).map(
            (e) => CustomerModel.fromJson(e),
          ),
        );
        customers.addAll(newcustomers);
        emit(state.copyWith(
          customers: customers,
          customerLoadMoreState: RequestState.loaded,
          //
        ));
        print("state.customers=");
        print(state.customers);
        print(state.customers.length);
      } else {
        emit(state.copyWith(
          customerLoadMoreState: RequestState.error,
          customerMessage: responsemap["message"] ?? '',
        ));
      }
    });
    //
    on<LoadMoreSuppliers>((event, emit) async {
      print("LoadMoreSuppliers");

      emit(state.copyWith(
        customerLoadMoreState: RequestState.loading,
        customerPage: state.customerPage + 1,
      ));
      List filters = [];
      if (event.currency != null) {
        filters.add(
          {
            "id": "DealingCurrencyGuid",
            "filterFns": "equals",
            "value": event.currency?.guid ?? "",
          },
        );
      }
      if (event.name != '' && event.name != null) {
        filters.add(
          {
            "id": "Name",
            "filterFns": "contains",
            "value": event.name ?? "",
          },
        );
      }
      if (event.city != '' && event.city != null) {
        filters.add(
          {
            "id": "City",
            "filterFns": "equals",
            "value": event.city ?? "",
          },
        );
      }
      if (event.company != null) {
        filters.add(
          {
            "id": "CompaniesGuid",
            "filterFns": "equals",
            "value": event.company?.guid ?? "",
          },
        );
      }
      if (event.accountType != null) {
        filters.add(
          {
            "id": "AccountType",
            "filterFns": "equals",
            "value": event.accountType?.val ?? "",
          },
        );
      }
      if (event.agent != null &&
          event.agent != Agent(guid: '', code: '', name: '')) {
        filters.add(
          {
            "id": "AgentGuid",
            "filterFns": "equals",
            "value": event.agent?.guid ?? "",
          },
        );
      }

      print(filters);
      http.Response response = await CustomersReqwest.getsuppliers(
        state.token,
        filters,
        state.customerPage,
      );
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<Customer> customers = state.customers;
        List<CustomerModel> newcustomers = List<CustomerModel>.from(
          (responsemap['data'] as List).map(
            (e) => CustomerModel.fromJson(e),
          ),
        );
        customers.addAll(newcustomers);
        emit(state.copyWith(
          customers: customers,
          customerLoadMoreState: RequestState.loaded,
          //
        ));
        print("state.supliers=");
        print(state.customers);
        print(state.customers.length);
      } else {
        emit(state.copyWith(
          customerLoadMoreState: RequestState.error,
          customerMessage: responsemap["message"] ?? '',
        ));
      }
    });
  }
}
