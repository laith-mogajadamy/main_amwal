// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/model/warehouses/warehouses_model.dart';
import 'package:mainamwal/screens/warehouses/data/warehouses_reqwest.dart';

part 'warehouses_event.dart';
part 'warehouses_state.dart';

class WarehousesBloc extends Bloc<WarehousesEvent, WarehousesState> {
  WarehousesBloc() : super(const WarehousesState()) {
    on<FromDateChanged>((event, emit) async {
      emit(state.copyWith(
        fromDate: event.fromdate,
      ));
    });
    //
    on<ToDateChanged>((event, emit) async {
      emit(state.copyWith(
        toDate: event.todate,
      ));
    });
    //
    on<DueDateChanged>((event, emit) async {
      emit(state.copyWith(
        dueDate: event.duedate,
      ));
    });
    //

    // on<GetDefDates>((event, emit) async {
    //   print("GetDefDates");
    //   http.Response response = await PurchasesAndSalesReqwest.getdefdates();
    //   var responsemap = jsonDecode(response.body);

    //   if (response.statusCode == 200) {
    //     emit(state.copyWith(
    //       fromDate: responsemap['data']?['CurrentPeriodStartDate'] ?? '',
    //       toDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
    //     ));
    //     DateTime now = DateTime.now();
    //     DateTime fromDate = DateTime.parse(state.fromDate);
    //     DateTime toDate = DateTime.parse(state.toDate);
    //     if (now.isBefore(toDate) && now.isAfter(fromDate)) {
    //       emit(state.copyWith(
    //         fromDate: DateFormat('yyyy-MM-dd', "en").format(now),
    //         toDate: DateFormat('yyyy-MM-dd', "en").format(now),
    //       ));
    //     } else {
    //       emit(state.copyWith(
    //         fromDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
    //         toDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
    //       ));
    //     }
    //     print("state.fromDate=");
    //     print(state.fromDate);
    //     print("state.toDate=");
    //     print(state.toDate);
    //   } else {
    //     emit(state.copyWith());
    //   }
    // });
    on<ClearWarehouses>((event, emit) async {
      emit(state.copyWith(
        warehouses: [],
        warehousesState: RequestState.loaded,
      ));
    });
    //
    on<GetWarehouses>((event, emit) async {
      print("GetWarehouses");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
          warehouses: [],
          warehousesState: RequestState.loading,
        ));

        http.Response response = await WarehousesReqwest.getWarehouses(
          event.search,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            warehouses: List<WarehousesModel>.from(
              (responsemap['data'] as List).map(
                (e) => WarehousesModel.fromJson(e),
              ),
            ),
            warehousesState: RequestState.loaded,
            warehousesMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.warehouses=");
          print(state.warehouses);
        } else {
          emit(state.copyWith(
            warehousesState: RequestState.error,
            warehousesMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          warehousesState: RequestState.error,
          warehousesMessage: "Unauthenticated",
        ));
      }
    });
    //
  }
}
