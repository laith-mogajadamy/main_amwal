// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale_model.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/data/purchases_and_sales_reqwest.dart';

part 'purchases_and_sales_event.dart';
part 'purchases_and_sales_state.dart';

class PurchasesAndSalesBloc
    extends Bloc<PurchasesAndSalesEvent, PurchasesAndSalesState> {
  PurchasesAndSalesBloc() : super(const PurchasesAndSalesState()) {
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
        add(GetDailyPruchasAndSale(
          type: '0',
          firstStoreGuid:
              event.context.read<FiltersBloc>().state.firstSelectedStores.guid,
          customerGuid:
              event.context.read<FiltersBloc>().state.selectedcustomer.guid,
          agentGuid: event.context.read<FiltersBloc>().state.selectedagent.guid,
          documentGuid:
              event.context.read<FiltersBloc>().state.selectedDocument.guid,
          categoriesGuid: event.context
              .read<FiltersBloc>()
              .state
              .selectedDocumentsCategorie
              .guid,
          projectDefaultGuid:
              event.context.read<FiltersBloc>().state.selectedproject.guid,
          companiesGuid:
              event.context.read<FiltersBloc>().state.selectedcompany.guid,
          transportCompaniesGuid: event.context
              .read<FiltersBloc>()
              .state
              .selectedtransportCompanie
              .guid,
          dueDated: state.dueDate,
          secondStoreGuid:
              event.context.read<FiltersBloc>().state.secondSelectedStores.guid,
          dateFrom: state.fromDate,
          dateTo: state.toDate,
          currGuid:
              event.context.read<FiltersBloc>().state.selectedcurrency.guid,
        ));
      } else {
        emit(state.copyWith());
      }
    });
    on<ClearDailyPruchasAndSale>((event, emit) async {
      emit(state.copyWith(
        dailyPruchasAndSale: [],
        dailyPruchasAndSaleState: RequestState.loading,
      ));
    });
    //
    on<GetDailyPruchasAndSale>((event, emit) async {
      print("GetDailyPruchasAndSale");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
          dailyPruchasAndSale: [],
          dailyPruchasAndSaleState: RequestState.loading,
          page: 1,
        ));

        http.Response response =
            await PurchasesAndSalesReqwest.getPurchasesAndSales(
          event.type,
          event.firstStoreGuid,
          event.customerGuid,
          event.agentGuid,
          event.documentGuid,
          event.categoriesGuid,
          event.projectDefaultGuid,
          event.companiesGuid,
          event.transportCompaniesGuid,
          event.dueDated,
          event.secondStoreGuid,
          event.dateFrom,
          event.dateTo,
          event.currGuid,
          1,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            dailyPruchasAndSale: List<DailyPruchasAndSaleModel>.from(
              (responsemap['data'] as List).map(
                (e) => DailyPruchasAndSaleModel.fromJson(e),
              ),
            ),
            dailyPruchasAndSaleState: RequestState.loaded,
            dailyPruchasAndSaleMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.dailyPruchasAndSale=");
          print(state.dailyPruchasAndSale);
        } else {
          emit(state.copyWith(
            dailyPruchasAndSaleState: RequestState.error,
            dailyPruchasAndSaleMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          dailyPruchasAndSaleState: RequestState.error,
          dailyPruchasAndSaleMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<LoadMoreDailyPruchasAndSale>((event, emit) async {
      print("LoadMoreDailyPruchasAndSale");
      emit(state.copyWith(
        loadMoreState: RequestState.loading,
        page: state.page + 1,
      ));
      http.Response response =
          await PurchasesAndSalesReqwest.getPurchasesAndSales(
        event.type,
        event.firstStoreGuid,
        event.customerGuid,
        event.agentGuid,
        event.documentGuid,
        event.categoriesGuid,
        event.projectDefaultGuid,
        event.companiesGuid,
        event.transportCompaniesGuid,
        event.dueDated,
        event.secondStoreGuid,
        event.dateFrom,
        event.dateTo,
        event.currGuid,
        state.page,
      );
      var responsemap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(state.dailyPruchasAndSale.length);
        List<DailyPruchasAndSale> dailyPruchasAndSale =
            state.dailyPruchasAndSale;
        List<DailyPruchasAndSale> newdailyPruchasAndSale =
            List<DailyPruchasAndSaleModel>.from(
          (responsemap['data'] as List).map(
            (e) => DailyPruchasAndSaleModel.fromJson(e),
          ),
        );
        dailyPruchasAndSale.addAll(newdailyPruchasAndSale);
        emit(state.copyWith(
          dailyPruchasAndSale: dailyPruchasAndSale,
          loadMoreState: RequestState.loaded,
          dailyPruchasAndSaleMessage: responsemap['message'] ?? '',
          //
        ));
        print(state.dailyPruchasAndSale.length);
        print("state.dailyPruchasAndSale=");
        print(state.dailyPruchasAndSale);
      } else {
        emit(state.copyWith(
          loadMoreState: RequestState.error,
          dailyPruchasAndSaleMessage: responsemap["message"] ?? '',
        ));
      }
    });
  }
}
