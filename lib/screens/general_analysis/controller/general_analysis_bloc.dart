// ignore_for_file: use_build_context_synchronously, avoid_print

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/model/filters/company_model.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';
import 'package:mainamwal/model/general_analysis/account_data_model.dart';
import 'package:mainamwal/screens/filters/data/veriabels_request.dart';
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
    on<GetParentsGeneralAnalysis>(_onGetParentesGeneralAnalysis);

    on<LoadMoreGeneralAnalysis>(_onLoadMoreGeneralAnalysis);
    on<AddToPath>(_addToPath);
    on<RemoveUtilPath>(_removeUntil);
    on<GetGeneralAnalysisCompanys>(_getGeneralAnalysisCompanys);
    on<CompanyChanged>(_companyChanged);
  }
  void _addToPath(AddToPath event, Emitter<GeneralAnalysisState> emit) {
    if (state.path.contains(event.accountData)) {
      //nothing
    } else {
      emit(state.copyWith(path: [...state.path, event.accountData!]));
    }
  }

  void _removeUntil(RemoveUtilPath event, Emitter<GeneralAnalysisState> emit) {
    final index = state.path.indexWhere(
      (item) => item.accountGuid == event.accountData!.accountGuid,
    );

    if (index != -1) {
      final newPath = state.path.sublist(0, index + 1);
      emit(state.copyWith(path: newPath));
    }
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
      path: [
        AccountData(
            accountGuid: '',
            parentGuid: '',
            accountCode: 'رئيسي',
            accountName: '',
            currencyCode: '',
            closeBalance: '',
            closeBalanceFC: '',
            mainCurrCode: '',
            mainDTL: ''),
      ],
    ));
  }

  Future<void> _onGetChiledGeneralAnalysis(GetChiledGeneralAnalysis event,
      Emitter<GeneralAnalysisState> emit) async {
    print("GetGeneralAnalysis");
    String? ptoken = Preferences.getToken();
    if (ptoken?.isNotEmpty ?? false) {
      emit(state.copyWith(
        token: ptoken!,
        parentsGeneralAnalysiss: [],
        parentsGeneralAnalysisState: RequestState.loading,
        chiledsGeneralAnalysiss: [],
        chiledsGeneralAnalysisState: RequestState.loading,
        page: 1,
        allTreeGeneralAnalysisState: RequestState.loading,
      ));
      await _fetchChiledGeneralAnalysis(event, emit);
      if (state.parentsGeneralAnalysisState == RequestState.loaded) {
        emit(state.copyWith(
          allTreeGeneralAnalysisState: RequestState.loaded,
        ));
      }
    } else {
      emit(state.copyWith(
        chiledsGeneralAnalysisState: RequestState.error,
        chiledsGeneralAnalysisMessage: "Unauthenticated",
      ));
    }
  }

  Future<void> _onGetParentesGeneralAnalysis(GetParentsGeneralAnalysis event,
      Emitter<GeneralAnalysisState> emit) async {
    print("_onGetParentesGeneralAnalysis");
    String? ptoken = Preferences.getToken();
    if (ptoken?.isNotEmpty ?? false) {
      emit(state.copyWith(
        token: ptoken!,
        parentsGeneralAnalysiss: [],
        parentsGeneralAnalysisState: RequestState.loading,
        chiledsGeneralAnalysiss: [],
        chiledsGeneralAnalysisState: RequestState.loading,
        page: 1,
        allTreeGeneralAnalysisState: RequestState.loading,
      ));
      await _fetchParentsGeneralAnalysis(event, emit);
      if (state.chiledsGeneralAnalysisState == RequestState.loaded) {
        emit(state.copyWith(
          allTreeGeneralAnalysisState: RequestState.loaded,
        ));
      }
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
    await _fetchChiledGeneralAnalysis(event, emit, isLoadMore: true);
  }

  Future<void> _fetchChiledGeneralAnalysis(
      dynamic event, Emitter<GeneralAnalysisState> emit,
      {bool isLoadMore = false}) async {
    http.Response response = await GeneralAnalysisReqwest.getGeneralAnalysis(
      event.parentGuid,
      event.aLER,
      event.mainDTL,
      state.selectedcompany.guid,
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

  Future<void> _fetchParentsGeneralAnalysis(
    GetParentsGeneralAnalysis event,
    Emitter<GeneralAnalysisState> emit,
  ) async {
    http.Response response = await GeneralAnalysisReqwest.getGeneralAnalysis(
      event.parentGuid,
      event.aLER,
      event.mainDTL,
      state.selectedcompany.guid,
      1,
    );
    var responsemap = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<AccountData> newEntries = List<AccountDataModel>.from(
        (responsemap['data'] as List).map((e) => AccountDataModel.fromJson(e)),
      );

      emit(state.copyWith(
        parentsGeneralAnalysiss: newEntries,
        parentsGeneralAnalysisState: RequestState.loaded,
        parentsGeneralAnalysisMessage: responsemap['message'] ?? '',
      ));
    } else {
      emit(state.copyWith(
        parentsGeneralAnalysisState: state.chiledsGeneralAnalysisState,
        parentsGeneralAnalysisMessage: responsemap["message"] ?? '',
      ));
    }
  }

  Future<void> _getGeneralAnalysisCompanys(GetGeneralAnalysisCompanys event,
      Emitter<GeneralAnalysisState> emit) async {
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
          path: [
            AccountData(
                accountGuid: '',
                parentGuid: '',
                accountCode: 'رئيسي',
                accountName: '',
                currencyCode: '',
                closeBalance: '',
                closeBalanceFC: '',
                mainCurrCode: '',
                mainDTL: ''),
          ],
        ),
      );
      emit(
        state.copyWith(
            selectedcompany: state.companys.firstWhere(
          (element) => element.iddefault == '1',
        )),
      );
      add(
        GetParentsGeneralAnalysis(
          parentGuid: "00000000-0000-0000-0000-000000000000",
          aLER: "'A','L','E','R'",
          mainDTL: "-1",
        ),
      );
      add(
        GetChiledGeneralAnalysis(
          parentGuid: "00000000-0000-0000-0000-000000000000",
          aLER: "",
          mainDTL: "0",
        ),
      );
    } else {
      emit(
        state.copyWith(
          parentsGeneralAnalysisMessage: 'error',
        ),
      );
    }
  }

  void _companyChanged(
      CompanyChanged event, Emitter<GeneralAnalysisState> emit) {
    emit(state.copyWith(
      selectedcompany: event.company,
    ));
    add(
      GetParentsGeneralAnalysis(
        parentGuid: "00000000-0000-0000-0000-000000000000",
        aLER: "'E','R'",
        mainDTL: "-1",
      ),
    );
    add(
      GetChiledGeneralAnalysis(
        parentGuid: "00000000-0000-0000-0000-000000000000",
        aLER: "",
        mainDTL: "0",
      ),
    );
  }
}
