// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';
import 'package:mainamwal/model/general_analysis/account_data_model.dart';
import 'package:mainamwal/screens/general_analysis/data/general_analysis_reqwest.dart';

part 'general_analysis_event.dart';
part 'general_analysis_state.dart';

class GeneralAnalysisBloc
    extends Bloc<GeneralAnalysisEvent, GeneralAnalysisState> {
  GeneralAnalysisBloc() : super(const GeneralAnalysisState()) {
    on<FromDateChanged>(_onFromDateChanged);
    on<ToDateChanged>(_onToDateChanged);
    on<DueDateChanged>(_onDueDateChanged);
    on<ClearGeneralAnalysis>(_onClearGeneralAnalysis);
    on<GetChiledGeneralAnalysis>(_onGetChiledGeneralAnalysis);
    on<LoadMoreGeneralAnalysis>(_onLoadMoreGeneralAnalysis);
  }

  void _onFromDateChanged(
      FromDateChanged event, Emitter<GeneralAnalysisState> emit) {
    emit(state.copyWith(fromDate: event.fromdate));
  }

  void _onToDateChanged(
      ToDateChanged event, Emitter<GeneralAnalysisState> emit) {
    emit(state.copyWith(toDate: event.todate));
  }

  void _onDueDateChanged(
      DueDateChanged event, Emitter<GeneralAnalysisState> emit) {
    emit(state.copyWith(dueDate: event.duedate));
  }

  void _onClearGeneralAnalysis(
      ClearGeneralAnalysis event, Emitter<GeneralAnalysisState> emit) {
    emit(state.copyWith(
      chiledsGeneralAnalysiss: [],
      chiledsGeneralAnalysisState: RequestState.loading,
      parentsGeneralAnalysiss: [],
      parentsGeneralAnalysisState: RequestState.loading,
    ));
  }

  Future<void> _onGetChiledGeneralAnalysis(GetChiledGeneralAnalysis event,
      Emitter<GeneralAnalysisState> emit) async {
    print("GetGeneralAnalysis");
    String? ptoken = Preferences.getToken();
    if (ptoken?.isNotEmpty ?? false) {
      emit(state.copyWith(
        token: ptoken!,
        chiledsGeneralAnalysiss: [],
        chiledsGeneralAnalysisState: RequestState.loading,
        page: 1,
      ));
      await _fetchGeneralAnalysis(event, emit);
    } else {
      emit(state.copyWith(
        chiledsGeneralAnalysisState: RequestState.error,
        chiledsGeneralAnalysisMessage: "Unauthenticated",
      ));
    }
  }

  Future<void> _onLoadMoreGeneralAnalysis(
      LoadMoreGeneralAnalysis event, Emitter<GeneralAnalysisState> emit) async {
    print("LoadMoreGeneralAnalysis");
    emit(state.copyWith(
        loadMoreState: RequestState.loading, page: state.page + 1));
    await _fetchGeneralAnalysis(event, emit, isLoadMore: true);
  }

  Future<void> _fetchGeneralAnalysis(
      dynamic event, Emitter<GeneralAnalysisState> emit,
      {bool isLoadMore = false}) async {
    http.Response response = await GeneralAnalysisReqwest.getGeneralAnalysis(
      event.parentGuid,
      event.aLER,
      event.mainDTL,
      state.page,
    );
    var responsemap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<AccountData> newEntries = List<AccountDataModel>.from(
        (responsemap['data'] as List).map((e) => AccountDataModel.fromJson(e)),
      );
      List<AccountData> updatedList = isLoadMore
          ? [...state.chiledsGeneralAnalysiss, ...newEntries]
          : newEntries;
      emit(state.copyWith(
        chiledsGeneralAnalysiss: updatedList,
        chiledsGeneralAnalysisState: RequestState.loaded,
        loadMoreState: isLoadMore ? RequestState.loaded : state.loadMoreState,
        chiledsGeneralAnalysisMessage: responsemap['message'] ?? '',
      ));
    } else {
      emit(state.copyWith(
        chiledsGeneralAnalysisState:
            isLoadMore ? state.chiledsGeneralAnalysisState : RequestState.error,
        loadMoreState: isLoadMore ? RequestState.error : state.loadMoreState,
        chiledsGeneralAnalysisMessage: responsemap["message"] ?? '',
      ));
    }
  }
}
