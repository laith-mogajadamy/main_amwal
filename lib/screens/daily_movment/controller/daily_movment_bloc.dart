// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/daily_movment/daily_movment.dart';
import 'package:mainamwal/model/daily_movment/daily_movment_model.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/model/filters/documents_categories.dart';
import 'package:mainamwal/model/filters/documents_categories_model.dart';
import 'package:mainamwal/screens/daily_movment/data/daily_movment_reqwest.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';
import 'package:mainamwal/screens/purchases_and_sales/data/purchases_and_sales_reqwest.dart';

part 'daily_movment_event.dart';
part 'daily_movment_state.dart';

class DailyMovmentBloc extends Bloc<DailyMovmentEvent, DailyMovmentState> {
  DailyMovmentBloc() : super(const DailyMovmentState()) {
    on<FromDateChanged>(_onFromDateChanged);
    on<ToDateChanged>(_onToDateChanged);
    on<DueDateChanged>(_onDueDateChanged);
    on<GetCompanys>(_onGetCompanys);
    on<CompanyChanged>(_onCompanyChanged);
    on<GetDocumentsCategories>(_onGetDocumentsCategories);
    on<DocumentsCategoriesChanged>(_onDocumentsCategoriesChanged);
    on<GetDefDates>(_onGetDefDates);
    on<ClearDailyMovment>(_onClearDailyMovment);
    on<GetDailyMovment>(_onGetDailyMovment);
    on<LoadMoreDailyMovment>(_onLoadMoreDailyMovment);
  }

  void _onFromDateChanged(
      FromDateChanged event, Emitter<DailyMovmentState> emit) {
    emit(state.copyWith(fromDate: event.fromdate));
    add(ClearDailyMovment());
  }

  void _onToDateChanged(ToDateChanged event, Emitter<DailyMovmentState> emit) {
    emit(state.copyWith(toDate: event.todate));
  }

  void _onDueDateChanged(
      DueDateChanged event, Emitter<DailyMovmentState> emit) {
    emit(state.copyWith(dueDate: event.duedate));
  }

  Future<void> _onGetCompanys(
      GetCompanys event, Emitter<DailyMovmentState> emit) async {
    final response = await VeriabelsRequest.getcompanys();
    final responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final companyList = List<CompanyModel>.from(
        (responseMap['data'] as List).map((e) => CompanyModel.fromJson(e)),
      );
      emit(state.copyWith(companys: companyList));
      DateTime initDate = DateTime.now();
      emit(
        state.copyWith(
          selectedcompany:
              companyList.firstWhere((element) => element.iddefault == '1'),
          fromDate: DateFormat('yyyy-MM-dd', 'en').format(initDate),
        ),
      );
      add(GetDocumentsCategories(tybe: 'sale'));
      add(GetDailyMovment());
    }
  }

  void _onCompanyChanged(
      CompanyChanged event, Emitter<DailyMovmentState> emit) {
    emit(state.copyWith(selectedcompany: event.company));
    add(ClearDailyMovment());
  }

  Future<void> _onGetDocumentsCategories(
      GetDocumentsCategories event, Emitter<DailyMovmentState> emit) async {
    final response = await VeriabelsRequest.getdocumentscategories(event.tybe);
    final responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final categories = List<DocumentsCategoriesModel>.from(
        (responseMap['data'] as List)
            .map((e) => DocumentsCategoriesModel.fromJson(e)),
      );
      emit(state.copyWith(documentsCategories: categories));
      emit(
        state.copyWith(
          selectedDocumentsCategorie:
              categories.firstWhere((element) => element.iddefault == true),
        ),
      );
    }
  }

  void _onDocumentsCategoriesChanged(
      DocumentsCategoriesChanged event, Emitter<DailyMovmentState> emit) {
    emit(state.copyWith(selectedDocumentsCategorie: event.documentsCategorie));
  }

  Future<void> _onGetDefDates(
      GetDefDates event, Emitter<DailyMovmentState> emit) async {
    final response = await PurchasesAndSalesReqwest.getdefdates();
    final responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String fromDate = responseMap['data']?['CurrentPeriodStartDate'] ?? '';
      String toDate = responseMap['data']?['CurrentPeriodEndDate'] ?? '';
      DateTime now = DateTime.now();
      DateTime startDate = DateTime.parse(fromDate);
      DateTime endDate = DateTime.parse(toDate);
      if (now.isAfter(startDate) && now.isBefore(endDate)) {
        fromDate = toDate = DateFormat('yyyy-MM-dd', "en").format(now);
      }
      emit(state.copyWith(fromDate: fromDate, toDate: toDate));
    }
  }

  void _onClearDailyMovment(
      ClearDailyMovment event, Emitter<DailyMovmentState> emit) {
    emit(state
        .copyWith(dailyMovment: [], dailyMovmentState: RequestState.loaded));
  }

  Future<void> _onGetDailyMovment(
      GetDailyMovment event, Emitter<DailyMovmentState> emit) async {
    String? token = Preferences.getToken();
    if (token?.isNotEmpty ?? false) {
      emit(state.copyWith(
          token: token,
          dailyMovment: [],
          dailyMovmentState: RequestState.loading,
          page: 1));
      final response = await DailyMovmentReqwest.getDailyMovment(
          state.fromDate, state.selectedcompany.guid, 1);
      final responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
          dailyMovment: List<DailyMovmentModel>.from(
            (responseMap['data'] as List)
                .map((e) => DailyMovmentModel.fromJson(e)),
          ),
          dailyMovmentState: RequestState.loaded,
        ));
      } else {
        emit(state.copyWith(dailyMovmentState: RequestState.error));
      }
    }
  }

  Future<void> _onLoadMoreDailyMovment(
      LoadMoreDailyMovment event, Emitter<DailyMovmentState> emit) async {
    emit(state.copyWith(
        loadMoreState: RequestState.loading, page: state.page + 1));
    final response = await DailyMovmentReqwest.getDailyMovment(
        state.fromDate, state.selectedcompany.guid, state.page);
    final responseMap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<DailyMovment> updatedList = List.from(state.dailyMovment)
        ..addAll(List<DailyMovmentModel>.from(
          (responseMap['data'] as List)
              .map((e) => DailyMovmentModel.fromJson(e)),
        ));
      emit(state.copyWith(
          dailyMovment: updatedList, loadMoreState: RequestState.loaded));
    }
  }
}
