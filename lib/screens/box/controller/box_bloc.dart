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
import 'package:mainamwal/screens/box/data/box_reqwest.dart';

part 'box_event.dart';
part 'box_state.dart';

class BoxBloc extends Bloc<BoxEvent, BoxState> {
  BoxBloc() : super(const BoxState()) {
    on<GetBoxs>((event, emit) async {
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
    });
    //
    on<GetBoxStatment>((event, emit) async {
      print("GetBoxStatment");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          boxStatmentState: RequestState.loading,
          token: ptoken,
        ));

        http.Response response = await BoxReqwest.getboxstatment(
          state.token,
          event.guid!,
          event.fromDate!,
          event.toDate!,
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
    });
    //
    on<GetDefDates>((event, emit) async {
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
    });

    on<ChangeFromDate>((event, emit) async {
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
    });
    on<ChangeToDate>((event, emit) async {
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
    });
    //
    on<ChangeStateDate>((event, emit) async {
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
    });
    //
    //
    on<GetBoxOpeningBalance>((event, emit) async {
      print("GetBoxOpeningBalance");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
        ));

        http.Response response = await BoxReqwest.getboxopeningbalance(
          event.guid!,
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
    });
    //
    on<GetBoxCreditDebitSum>((event, emit) async {
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
    });
  }
}
