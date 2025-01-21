// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mainamwal/core/services/auth.dart';
import 'package:mainamwal/core/utils/formstatus.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/enter/account_type.dart';
import 'package:mainamwal/model/enter/account_type_model.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent_model.dart';
import 'package:mainamwal/model/enter/company.dart';
import 'package:mainamwal/model/enter/company_model.dart';
import 'package:mainamwal/model/enter/currency.dart';
import 'package:mainamwal/model/enter/currency_model.dart';
import 'package:mainamwal/model/enter/user.dart';
import 'package:mainamwal/model/enter/usermodel.dart';
import 'package:mainamwal/welcome/data/veriabels_request.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<Getuser>((event, emit) async {
      String? api = Preferences.getAPI();
      if (api!.isEmpty) {
        emit(
          state.copyWith(
              message: "login failed",
              formStatus: SubmissionFailed("login failed"),
              islogedin: "false"),
        );
        print(state.formStatus);
      } else {
        print("getuser");
        String? useremail = Preferences.getemail();
        String? userpassword = Preferences.getpassword();
        print("-------------------");
        print(useremail);
        print(userpassword);
        print("-------------------");
        emit(state.copyWith(
          formStatus: FormSubmitting(),
        ));

        http.Response response = await Auth.login(useremail!, userpassword!);
        var responsemap = await jsonDecode(response.body);
        print("message==${state.message}");
        print("*********");
        print(responsemap);
        print("statusCode==${response.statusCode}");
        print("*********");
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              user: UserModel.fromJson(responsemap['data']?['user']),
              companyname: responsemap['data']?['company_name'],
              currentFiscalYearCode: responsemap['data']
                  ?['CurrentFiscalYearCode'],
              token: responsemap['data']?['token'],
              message: responsemap['message'],
              formStatus: SubmissionSuccess(),
              islogedin: "true",
            ),
          );
          Preferences.removeToken();
          print("save new token");
          Preferences.savetoken(responsemap['data']?['token']);
          print("token:${responsemap['data']?['token']}");
          print("user:${state.user}");

          Preferences.saveemail(state.email);
          Preferences.savepassword(state.password);

          print(state.formStatus);
        } else {
          emit(
            state.copyWith(
                formStatus: SubmissionFailed(state.message),
                message: responsemap['message'],
                islogedin: "false"),
          );
          print(state.formStatus);
        }
        print("state.user");
        print(state.user);
      }
      add(GetCurrency());
      add(GetCompanys());
      add(GetCitys());
      add(GetAccountTybe());
      add(GetAgets());
    });
    //

    //
    on<LanguageChanged>((event, emit) async {
      emit(
        state.copyWith(
          language: event.language,
        ),
      );
    });
    //

    on<LoginEmailChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        email: event.email,
      ));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        password: event.password,
      ));
    });

    on<LoginNameChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        name: event.name,
      ));
    });

    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        city: event.city,
      ));
    });

    //
    on<LoginSubmitted>((event, emit) async {
      emit(
        state.copyWith(
            formStatus: FormSubmitting(),
            email: state.email,
            password: state.password),
      );
      print("========");
      print(state.email);
      print(state.password);
      String? api = Preferences.getAPI();
      if (api!.isEmpty) {
        emit(
          state.copyWith(
              message: "login failed",
              formStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.formStatus);
      } else {
        print('Auth.login');
        http.Response response = await Auth.login(state.email, state.password);
        var responsemap = await jsonDecode(response.body);
        print("message==${state.message}");
        print("*********");
        print(responsemap);
        print("statusCode==${response.statusCode}");
        print("*********");
        if (response.statusCode == 200) {
          emit(
            state.copyWith(
              user: UserModel.fromJson(responsemap['data']?['user']),
              companyname: responsemap['data']?['company_name'],
              currentFiscalYearCode: responsemap['data']
                  ?['CurrentFiscalYearCode'],
              token: responsemap['data']?['token'],
              message: responsemap['message'],
              formStatus: SubmissionSuccess(),
              islogedin: "true",
            ),
          );
          Preferences.removeToken();
          print("save new token");
          Preferences.savetoken(responsemap['data']?['token']);
          print("token:${responsemap['data']?['token']}");
          print("user:${state.user}");

          Preferences.saveemail(state.email);
          Preferences.savepassword(state.password);

          print(state.formStatus);
        } else {
          emit(
            state.copyWith(
                formStatus: SubmissionFailed(state.message),
                message: responsemap['message'],
                islogedin: "false"),
          );
          print(state.formStatus);
        }
        add(GetCurrency());
        add(GetCompanys());
        add(GetCitys());
        add(GetAccountTybe());
        add(GetAgets());
      }
    });

    on<Logout>((event, emit) async {
      emit(
        state.copyWith(
          logoutStatus: FormSubmitting(),
        ),
      );
      http.Response response = await Auth.logout(state.token);
      Map responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        Preferences.clear();
        emit(
          state.copyWith(
              user: const User(
                guid: '',
                name: "",
                code: "",
                number: "",
                isAdmin: false,
              ),
              logoutStatus: SubmissionSuccess(),
              message: responsemap["message"],
              email: "",
              password: "",
              token: "",
              islogedin: "false"),
        );
      } else {
        emit(
          state.copyWith(
              message: responsemap["message"],
              logoutStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.logoutStatus);
      }
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
    on<SelectedCityChanged>((event, emit) async {
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
    on<PageChanged>((event, emit) async {
      emit(state.copyWith(
        page: event.page,
      ));
    });
    //
    on<ClearFilters>((event, emit) async {
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
  }
}
