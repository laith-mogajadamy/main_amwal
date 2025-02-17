import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/model/box/box_model.dart';
import 'package:mainamwal/model/box/box_statment.dart';
import 'package:mainamwal/model/box/box_statment_model.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/screens/box/data/box_reqwest.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';

part 'box_event.dart';
part 'box_state.dart';

class BoxBloc extends Bloc<BoxEvent, BoxState> {
  BoxBloc() : super(const BoxState()) {
    // Refactored event handlers:
    on<GetBoxs>(_getBoxs);
    on<GetBoxStatment>(_getBoxStatment);
    on<GetDefDates>(_getDefDates);
    on<ChangeFromDate>(_changeFromDate);
    on<ChangeToDate>(_changeToDate);
    on<ChangeStateDate>(_changeStateDate);
    on<GetBoxOpeningBalance>(_getBoxOpeningBalance);
    on<GetBoxCreditDebitSum>(_getBoxCreditDebitSum);
    on<GetBoxsCompanys>(_getBoxsCompanys);
    on<CompanyChanged>(_companyChanged);
    on<LoadMoreBoxStatment>(_loadMoreBoxStatment);
  }

  Future<void> _getBoxs(GetBoxs event, Emitter<BoxState> emit) async {
    print("GetBoxs");
    String? ptoken = Preferences.getToken();
    if (ptoken!.isNotEmpty) {
      emit(state.copyWith(
        boxsState: RequestState.loading,
        token: ptoken,
      ));

      http.Response response = await BoxReqwest.getboxs(state.token);
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          boxs: List<BoxModel>.from(
            (responsemap['data'] as List).map(
              (e) => BoxModel.fromJson(e),
            ),
          ),
          boxsState: RequestState.loaded,
          boxsMessage: responsemap['message'] ?? '',
          //
        ));
        print("state.boxs=");
        print(state.boxs);
        List<Box> filterdBox = [];
        for (var i = 0; i < state.boxs.length; i++) {
          if (state.boxs[i].companyGuid == state.selectedcompany.guid) {
            filterdBox.add(state.boxs[i]);
          }
        }
        print('filterdBox');
        print(filterdBox);
        emit(
          state.copyWith(
            filterdBoxs: filterdBox,
          ),
        );
      } else {
        emit(state.copyWith(
          boxsState: RequestState.error,
          boxsMessage: responsemap["message"] ?? '',
        ));
      }
    } else {
      emit(state.copyWith(
        boxsState: RequestState.error,
        boxsMessage: "Unauthenticated",
      ));
    }
  }

  Future<void> _getBoxStatment(
      GetBoxStatment event, Emitter<BoxState> emit) async {
    print("GetBoxStatment");
    String? ptoken = Preferences.getToken();
    if (ptoken!.isNotEmpty) {
      emit(state.copyWith(
        boxStatmentState: RequestState.loading,
        token: ptoken,
        page: 1,
      ));

      http.Response response = await BoxReqwest.getboxstatment(
        state.token,
        event.guid!,
        event.companyGuid!,
        event.fromDate!,
        event.toDate!,
        1,
      );
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          boxStatment: List<BoxStatmentModel>.from(
            (responsemap['data'] as List).map(
              (e) => BoxStatmentModel.fromJson(e),
            ),
          ),
          boxStatmentState: RequestState.loaded,
          boxStatmentMessage: responsemap['message'] ?? '',
          //
        ));
        print("state.boxStatment=");
        print(state.boxStatment);
      } else {
        emit(state.copyWith(
          boxStatmentState: RequestState.error,
          boxStatmentMessage: responsemap["message"] ?? '',
        ));
      }
    } else {
      emit(state.copyWith(
        boxStatmentState: RequestState.error,
        boxStatmentMessage: "Unauthenticated",
      ));
    }
  }

  Future<void> _getDefDates(GetDefDates event, Emitter<BoxState> emit) async {
    emit(
      state.copyWith(
        boxStatment: const [],
        boxStatmentState: RequestState.error,
        boxStatmentMessage: '',
      ),
    );
    print("GetDefDates");
    String? ptoken = Preferences.getToken();
    if (ptoken!.isNotEmpty) {
      emit(state.copyWith(
        token: ptoken,
      ));
      http.Response response = await BoxReqwest.getboxsstatmentdefdates(
        state.token,
        event.guid!,
      );
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
  }

  void _changeFromDate(ChangeFromDate event, Emitter<BoxState> emit) {
    emit(
      state.copyWith(
        fromdate: event.fromdate,
        boxStatment: const [],
        boxStatmentState: RequestState.error,
        boxStatmentMessage: '',
        statmentOpeningBalance: '',
        statmentCreditsum: '',
        statmentDebitsum: '',
        statmentBalance: '',
      ),
    );
  }

  void _changeToDate(ChangeToDate event, Emitter<BoxState> emit) {
    emit(
      state.copyWith(
        todate: event.todate,
        boxStatment: const [],
        boxStatmentState: RequestState.error,
        boxStatmentMessage: '',
        statmentOpeningBalance: '',
        statmentCreditsum: '',
        statmentDebitsum: '',
        statmentBalance: '',
      ),
    );
  }

  void _changeStateDate(ChangeStateDate event, Emitter<BoxState> emit) {
    emit(
      state.copyWith(
        statedate: event.statedate,
        boxStatment: const [],
        boxStatmentState: RequestState.error,
        boxStatmentMessage: '',
        statmentOpeningBalance: '',
        statmentCreditsum: '',
        statmentDebitsum: '',
        statmentBalance: '',
      ),
    );
  }

  Future<void> _getBoxOpeningBalance(
      GetBoxOpeningBalance event, Emitter<BoxState> emit) async {
    print("GetBoxOpeningBalance");
    String? ptoken = Preferences.getToken();
    if (ptoken!.isNotEmpty) {
      emit(state.copyWith(
        token: ptoken,
      ));

      http.Response response = await BoxReqwest.getboxopeningbalance(
        event.guid!,
        event.companyGuid!,
        event.fromDate!,
        event.toDate!,
      );
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (event.isCurrency!) {
          emit(state.copyWith(
            statmentOpeningBalance:
                responsemap["data"]?['OpenBalCur'].toString() ?? '',
            //
          ));
          print("state.statmentOpeningBalancecurrency=");
          print(state.statmentOpeningBalance);
          double o = double.parse(state.statmentOpeningBalance);
          double c = double.parse(state.statmentCreditsum);
          double d = double.parse(state.statmentDebitsum);
          double b = o + (d - c);
          emit(state.copyWith(
            statmentBalance: b.toString(),
          ));
        } else {
          emit(state.copyWith(
            statmentOpeningBalance:
                responsemap["data"]?['OpenBal'].toString() ?? '',
            //
          ));
          print("state.statmentOpeningBalance=");
          print(state.statmentOpeningBalance);
          double o = double.parse(state.statmentOpeningBalance);
          double c = double.parse(state.statmentCreditsum);
          double d = double.parse(state.statmentDebitsum);
          double b = o + (d - c);
          emit(state.copyWith(
            statmentBalance: b.toString(),
          ));
        }
      }
    } else {
      emit(state.copyWith());
    }
  }

  Future<void> _getBoxCreditDebitSum(
      GetBoxCreditDebitSum event, Emitter<BoxState> emit) async {
    print("GetBoxCreditDebitSum");
    String? ptoken = Preferences.getToken();
    if (ptoken!.isNotEmpty) {
      emit(state.copyWith(
        token: ptoken,
      ));

      http.Response response = await BoxReqwest.getboxcreditDebitSum(
        event.guid!,
        event.fromDate!,
        event.toDate!,
        event.companyGuid!,
      );
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (event.isCurrency!) {
          emit(state.copyWith(
            statmentCreditsum:
                responsemap["data"]?['CreditcurrencyAmount'].toString() ?? '',
            statmentDebitsum:
                responsemap["data"]?['DebitcurrencyAmount'].toString() ?? '',

            //
          ));
          print("state.DebitcurrencyAmount=");
          print(state.statmentCreditsum);
          print("state.DebitcurrencyAmount=");
          print(state.statmentDebitsum);
          double o = double.parse(state.statmentOpeningBalance);
          double c = double.parse(state.statmentCreditsum);
          double d = double.parse(state.statmentDebitsum);
          double b = o + (d - c);
          emit(state.copyWith(
            statmentBalance: b.toString(),
          ));
        } else {
          emit(state.copyWith(
            statmentCreditsum:
                responsemap["data"]?['CreditAmount'].toString() ?? '',
            statmentDebitsum:
                responsemap["data"]?['DebitAmount'].toString() ?? '',

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
        }
      } else {
        emit(state.copyWith());
      }
    } else {
      emit(state.copyWith());
    }
  }

  Future<void> _getBoxsCompanys(
      GetBoxsCompanys event, Emitter<BoxState> emit) async {
    print("GetBoxsCompanys");
    http.Response response = await VeriabelsRequest.getcompanys();
    var responsemap = await jsonDecode(response.body);
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
        ),
      );
      emit(
        state.copyWith(
            selectedcompany: state.companys.firstWhere(
          (element) => element.iddefault == '1',
        )),
      );
      add(GetBoxs());
    } else {
      emit(
        state.copyWith(
          boxsMessage: 'error',
        ),
      );
    }
  }

  void _companyChanged(CompanyChanged event, Emitter<BoxState> emit) {
    emit(state.copyWith(
      selectedcompany: event.company,
    ));
    List<Box> filterdBox = [];
    for (var i = 0; i < state.boxs.length; i++) {
      if (state.boxs[i].companyGuid == state.selectedcompany.guid) {
        filterdBox.add(state.boxs[i]);
      }
    }
    print('filterdBox');
    print(filterdBox);
    emit(
      state.copyWith(
        filterdBoxs: filterdBox,
      ),
    );
  }

  Future<void> _loadMoreBoxStatment(
      LoadMoreBoxStatment event, Emitter<BoxState> emit) async {
    print("LoadMoreBoxStatment");
    emit(state.copyWith(
      loadMoreState: RequestState.loading,
      page: state.page + 1,
    ));
    http.Response response = await BoxReqwest.getboxstatment(
      state.token,
      event.guid!,
      event.companyGuid!,
      state.fromdate,
      state.todate,
      state.page,
    );
    var responsemap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(state.boxStatment.length);
      List<BoxStatment> boxStatment = state.boxStatment;
      List<BoxStatment> newboxStatment = List<BoxStatmentModel>.from(
        (responsemap['data'] as List).map(
          (e) => BoxStatmentModel.fromJson(e),
        ),
      );
      boxStatment.addAll(newboxStatment);
      emit(state.copyWith(
        boxStatment: boxStatment,
        loadMoreState: RequestState.loaded,
        boxStatmentMessage: responsemap['message'] ?? '',
        //
      ));
      print(state.boxStatment.length);
      print("state.boxStatment=");
      print(state.boxStatment);
    } else {
      emit(state.copyWith(
        loadMoreState: RequestState.error,
        boxStatmentMessage: responsemap["message"] ?? '',
      ));
    }
  }
}
