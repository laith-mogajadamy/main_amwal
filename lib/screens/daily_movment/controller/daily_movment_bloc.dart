// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/daily_movment/daily_movment.dart';
import 'package:mainamwal/model/daily_movment/daily_movment_model.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale_model.dart';
import 'package:mainamwal/screens/daily_movment/data/daily_movment_reqwest.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';
import 'package:mainamwal/screens/purchases_and_sales/data/purchases_and_sales_reqwest.dart';

part 'daily_movment_event.dart';
part 'daily_movment_state.dart';

class DailyMovmentBloc extends Bloc<DailyMovmentEvent, DailyMovmentState> {
  DailyMovmentBloc() : super(const DailyMovmentState()) {
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
    on<GetCompanys>((event, emit) async {
      print("GetCompanys");

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
        DateTime initdate = DateTime.now();
        String formattedinitdate =
            DateFormat('yyyy-MM-dd', 'en').format(initdate);

        emit(
          state.copyWith(
            selectedcompany: state.companys.firstWhere(
              (element) => element.iddefault == '1',
            ),
            fromDate: formattedinitdate,
          ),
        );
      }
      add(
        GetDailyMovment(),
      );
    });
    on<CompanyChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcompany: event.company,
      ));
    });
    //
    on<GetDefDates>((event, emit) async {
      print("GetDefDates");
      http.Response response = await PurchasesAndSalesReqwest.getdefdates();
      var responsemap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(
          fromDate: responsemap['data']?['CurrentPeriodStartDate'] ?? '',
          toDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
        ));
        DateTime now = DateTime.now();
        DateTime fromDate = DateTime.parse(state.fromDate);
        DateTime toDate = DateTime.parse(state.toDate);
        if (now.isBefore(toDate) && now.isAfter(fromDate)) {
          emit(state.copyWith(
            fromDate: DateFormat('yyyy-MM-dd', "en").format(now),
            toDate: DateFormat('yyyy-MM-dd', "en").format(now),
          ));
        } else {
          emit(state.copyWith(
            fromDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
            toDate: responsemap['data']?['CurrentPeriodEndDate'] ?? '',
          ));
        }
        print("state.fromDate=");
        print(state.fromDate);
        print("state.toDate=");
        print(state.toDate);
        // add(GetDailyMovment());
      } else {
        emit(state.copyWith());
      }
    });
    on<ClearDailyMovment>((event, emit) async {
      emit(state.copyWith(
        dailyMovment: [],
        dailyMovmentState: RequestState.loading,
      ));
    });
    //
    on<GetDailyMovment>((event, emit) async {
      print("GetDailyMovment");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
          dailyMovment: [],
          dailyMovmentState: RequestState.loading,
          page: 1,
        ));

        http.Response response = await DailyMovmentReqwest.getDailyMovment(
          state.fromDate,
          state.selectedcompany.guid,
          1,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            dailyMovment: List<DailyMovmentModel>.from(
              (responsemap['data'] as List).map(
                (e) => DailyMovmentModel.fromJson(e),
              ),
            ),
            dailyMovmentState: RequestState.loaded,
            dailyMovmentMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.dailyPruchasAndSale=");
          print(state.dailyMovment);
        } else {
          emit(state.copyWith(
            dailyMovmentState: RequestState.error,
            dailyMovmentMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          dailyMovmentState: RequestState.error,
          dailyMovmentMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<LoadMoreDailyMovment>((event, emit) async {
      print("LoadMoreDailyMovment");
      emit(state.copyWith(
        loadMoreState: RequestState.loading,
        page: state.page + 1,
      ));
      http.Response response = await DailyMovmentReqwest.getDailyMovment(
        state.fromDate,
        state.selectedcompany.guid,
        state.page,
      );
      var responsemap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(state.dailyMovment.length);
        List<DailyMovment> dailyMovment = state.dailyMovment;
        List<DailyMovment> newDailyMovment = List<DailyMovmentModel>.from(
          (responsemap['data'] as List).map(
            (e) => DailyMovmentModel.fromJson(e),
          ),
        );
        dailyMovment.addAll(newDailyMovment);
        emit(state.copyWith(
          dailyMovment: dailyMovment,
          loadMoreState: RequestState.loaded,
          dailyMovmentMessage: responsemap['message'] ?? '',
          //
        ));
        print(state.dailyMovment.length);
        print("state.dailyMovment=");
        print(state.dailyMovment);
      } else {
        emit(state.copyWith(
          loadMoreState: RequestState.error,
          dailyMovmentMessage: responsemap["message"] ?? '',
        ));
      }
    });
  }
}
