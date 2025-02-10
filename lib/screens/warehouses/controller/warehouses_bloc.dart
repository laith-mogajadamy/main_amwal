// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/model/warehouses/searched_warehouses.dart';
import 'package:mainamwal/model/warehouses/searched_warehouses_model.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/model/warehouses/warehouses_model.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';
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
        http.Response response =
            await WarehousesReqwest.getWarehousestatement();
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
          List<Warehouses> filterdWarehouses = [];
          for (var i = 0; i < state.warehouses.length; i++) {
            if (state.warehouses[i].companiesGuid ==
                state.selectedcompany.guid) {
              filterdWarehouses.add(state.warehouses[i]);
            }
          }
          print('filterdWarehouses');
          print(filterdWarehouses);
          emit(
            state.copyWith(
              filteredWarehouses: filterdWarehouses,
            ),
          );
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
    on<ClearSearchedWarehouses>((event, emit) async {
      emit(state.copyWith(
        searchedWarehouses: [],
        searchedWarehousesState: RequestState.loaded,
        scannedQR: '',
      ));
    });
    //
    on<GetSearchedWarehouses>((event, emit) async {
      print("GetSearchedWarehouses");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
          searchedWarehouses: [],
          searchedWarehousesState: RequestState.loading,
          page: 1,
        ));

        http.Response response = await WarehousesReqwest.getSearchedWarehouses(
          event.search,
          event.storeGuid,
          event.companyGuid,
          event.page,
          event.perPage,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            searchedWarehouses: List<SearchedWarehousesModel>.from(
              (responsemap['data'] as List).map(
                (e) => SearchedWarehousesModel.fromJson(e),
              ),
            ),
            searchedWarehousesState: RequestState.loaded,
            searchedWarehousesMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.warehouses=");
          print(state.searchedWarehouses);
        } else {
          emit(state.copyWith(
            searchedWarehousesState: RequestState.error,
            searchedWarehousesMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          searchedWarehousesState: RequestState.error,
          searchedWarehousesMessage: "Unauthenticated",
        ));
      }
    });
    //
    on<LoadMoreSearchedWarehouses>((event, emit) async {
      print("LoadMoreSearchedWarehouses");
      emit(state.copyWith(
        loadMoreState: RequestState.loading,
        page: state.page + 1,
      ));
      http.Response response = await WarehousesReqwest.getSearchedWarehouses(
        event.search,
        event.storeGuid,
        event.companyGuid,
        state.page.toString(),
        event.perPage,
      );
      var responsemap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        List<SearchedWarehouses> searchedWarehouses = state.searchedWarehouses;
        List<SearchedWarehouses> newsearchedWarehouses =
            List<SearchedWarehousesModel>.from(
          (responsemap['data'] as List).map(
            (e) => SearchedWarehousesModel.fromJson(e),
          ),
        );
        searchedWarehouses.addAll(newsearchedWarehouses);
        emit(state.copyWith(
          searchedWarehouses: searchedWarehouses,
          loadMoreState: RequestState.loaded,
          searchedWarehousesMessage: responsemap['message'] ?? '',
          //
        ));
        print("state.searchedWarehouses=");
        print(state.searchedWarehouses);
      } else {
        emit(state.copyWith(
          loadMoreState: RequestState.error,
          searchedWarehousesMessage: responsemap["message"] ?? '',
        ));
      }
    });
    //
    on<QRCodeScanned>((event, emit) async {
      emit(state.copyWith(
        scannedQR: event.scannedQR,
      ));
      add(
        GetSearchedWarehouses(
          search: state.scannedQR,
          storeGuid: event.warehouses!.storeGuid,
          companyGuid: state.selectedcompany.guid,
          page: '1',
          perPage: '50',
        ),
      );
    });
    //
    //
    on<GetWarehouseCompanys>((event, emit) async {
      print("GetWarehouseCompanys");
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
        add(GetWarehouses());
      } else {
        emit(
          state.copyWith(
            warehousesMessage: 'error',
          ),
        );
      }
    });
    //
    on<CompanyChanged>((event, emit) async {
      emit(state.copyWith(
        selectedcompany: event.company,
      ));
      List<Warehouses> filterdWarehouses = [];
      for (var i = 0; i < state.warehouses.length; i++) {
        if (state.warehouses[i].companiesGuid == state.selectedcompany.guid) {
          filterdWarehouses.add(state.warehouses[i]);
        }
      }
      print('filterdWarehouses');
      print(filterdWarehouses);
      emit(
        state.copyWith(
          filteredWarehouses: filterdWarehouses,
        ),
      );
    });
    //
  }
}
