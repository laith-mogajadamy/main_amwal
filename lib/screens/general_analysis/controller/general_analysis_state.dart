part of 'general_analysis_bloc.dart';

class GeneralAnalysisState extends Equatable {
  final String token;
  //
  final List<AccountData> chiledsGeneralAnalysiss;
  final RequestState chiledsGeneralAnalysisState;
  final String chiledsGeneralAnalysisMessage;
  //
  final List<AccountData> parentsGeneralAnalysiss;
  final RequestState parentsGeneralAnalysisState;
  final String parentsGeneralAnalysisMessage;
  //
  final List<AccountData> path;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
  //
  final int page;
  final RequestState loadMoreState;
  const GeneralAnalysisState({
    this.token = '',
    //
    this.chiledsGeneralAnalysiss = const [],
    this.chiledsGeneralAnalysisState = RequestState.loading,
    this.chiledsGeneralAnalysisMessage = '',
    //
    this.parentsGeneralAnalysiss = const [],
    this.parentsGeneralAnalysisState = RequestState.loading,
    this.parentsGeneralAnalysisMessage = '',
    //
    this.path = const [],
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
    //
    this.page = 1,
    this.loadMoreState = RequestState.loaded,
  });

  GeneralAnalysisState copyWith({
    String? token,
    //
    List<AccountData>? chiledsGeneralAnalysiss,
    RequestState? chiledsGeneralAnalysisState,
    String? chiledsGeneralAnalysisMessage,
    //
    List<AccountData>? parentsGeneralAnalysiss,
    RequestState? parentsGeneralAnalysisState,
    String? parentsGeneralAnalysisMessage,
    //
    List<AccountData>? path,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
    //
    int? page,
    RequestState? loadMoreState,
  }) {
    return GeneralAnalysisState(
      token: token ?? this.token,
      //
      chiledsGeneralAnalysiss:
          chiledsGeneralAnalysiss ?? this.chiledsGeneralAnalysiss,
      chiledsGeneralAnalysisState:
          chiledsGeneralAnalysisState ?? this.chiledsGeneralAnalysisState,
      chiledsGeneralAnalysisMessage:
          chiledsGeneralAnalysisMessage ?? this.chiledsGeneralAnalysisMessage,
      //
      parentsGeneralAnalysiss:
          parentsGeneralAnalysiss ?? this.parentsGeneralAnalysiss,
      parentsGeneralAnalysisState:
          parentsGeneralAnalysisState ?? this.parentsGeneralAnalysisState,
      parentsGeneralAnalysisMessage:
          parentsGeneralAnalysisMessage ?? this.parentsGeneralAnalysisMessage,
      //
      path: path ?? this.path,
      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
      //
      page: page ?? this.page,
      loadMoreState: loadMoreState ?? this.loadMoreState,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        chiledsGeneralAnalysiss,
        chiledsGeneralAnalysisState,
        chiledsGeneralAnalysisMessage,
        //
        parentsGeneralAnalysiss,
        parentsGeneralAnalysisState,
        parentsGeneralAnalysisMessage,
        //
        path,
        //
        fromDate,
        toDate,
        dueDate,
        //
        page,
        loadMoreState,
        //
      ];
}
