part of 'daily_movment_bloc.dart';

class DailyMovmentState extends Equatable {
  final String token;
  //
  final List<DailyMovment> dailyMovment;
  final RequestState dailyMovmentState;
  final String dailyMovmentMessage;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
  //
  final int page;
  final RequestState loadMoreState;
  //
  final List<Company> companys; // Added companys list
  final Company selectedcompany; // Added selectedcompany

  const DailyMovmentState({
    this.token = '',
    //
    this.dailyMovment = const [],
    this.dailyMovmentState = RequestState.loading,
    this.dailyMovmentMessage = '',
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
    //
    this.page = 1,
    this.loadMoreState = RequestState.loaded,
    //
    this.companys = const [], // Default empty list for companys
    this.selectedcompany = const Company(
      guid: '',
      code: '',
      name: '',
      iddefault: '',
    ), // Default empty Company instance
  });

  DailyMovmentState copyWith({
    String? token,
    //
    List<DailyMovment>? dailyMovment,
    RequestState? dailyMovmentState,
    String? dailyMovmentMessage,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
    //
    int? page,
    RequestState? loadMoreState,
    //
    List<Company>? companys,
    Company? selectedcompany,
  }) {
    return DailyMovmentState(
      token: token ?? this.token,

      //
      dailyMovment: dailyMovment ?? this.dailyMovment,
      dailyMovmentState: dailyMovmentState ?? this.dailyMovmentState,
      dailyMovmentMessage: dailyMovmentMessage ?? this.dailyMovmentMessage,
      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
      //
      page: page ?? this.page,
      loadMoreState: loadMoreState ?? this.loadMoreState,
      //
      companys: companys ?? this.companys,
      selectedcompany: selectedcompany ?? this.selectedcompany,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        dailyMovment,
        dailyMovmentState,
        dailyMovmentMessage,
        //
        fromDate,
        toDate,
        dueDate,
        //
        page,
        loadMoreState,
        //
        companys,
        selectedcompany,
      ];
}
