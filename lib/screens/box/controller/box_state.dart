part of 'box_bloc.dart';

class BoxState extends Equatable {
  final String token;
  //
  final List<Box> boxs;
  final List<Box> filterdBoxs;
  final RequestState boxsState;
  final String boxsMessage;
  //
  final List<BoxStatment> boxStatment;
  final RequestState boxStatmentState;
  final String boxStatmentMessage;
  //
  final List<Company> companys;
  final Company selectedcompany;
  //
  final String fromdate;
  final String todate;
  final String statedate;
  //
  //
  final String statmentOpeningBalance;
  final String statmentDebitsum;
  final String statmentCreditsum;
  final String statmentBalance;
  const BoxState({
    this.token = '',
    //
    this.boxs = const [],
    this.filterdBoxs = const [],
    this.boxsState = RequestState.loading,
    this.boxsMessage = '',
    //
    this.boxStatment = const [],
    this.boxStatmentState = RequestState.loading,
    this.boxStatmentMessage = '',
    //

    this.companys = const [],
    this.selectedcompany =
        const Company(guid: '', code: '', name: '', iddefault: ''),

    //
    this.fromdate = '',
    this.todate = '',
    this.statedate = '',
    //
    this.statmentOpeningBalance = '',
    this.statmentCreditsum = '',
    this.statmentDebitsum = '',
    this.statmentBalance = '',
  });

  BoxState copyWith({
    String? token,
    //
    List<Box>? boxs,
    List<Box>? filterdBoxs,
    RequestState? boxsState,
    String? boxsMessage,
    //
    List<BoxStatment>? boxStatment,
    RequestState? boxStatmentState,
    String? boxStatmentMessage,
    //
    List<Company>? companys,
    Company? selectedcompany,
    //
    String? fromdate,
    String? todate,
    String? statedate,
    //
    String? statmentOpeningBalance,
    String? statmentCreditsum,
    String? statmentDebitsum,
    String? statmentBalance,
  }) {
    return BoxState(
      token: token ?? this.token,

      //
      boxs: boxs ?? this.boxs,
      filterdBoxs: filterdBoxs ?? this.filterdBoxs,
      boxsState: boxsState ?? this.boxsState,
      boxsMessage: boxsMessage ?? this.boxsMessage,
      //
      boxStatment: boxStatment ?? this.boxStatment,
      boxStatmentState: boxStatmentState ?? this.boxStatmentState,
      boxStatmentMessage: boxStatmentMessage ?? this.boxStatmentMessage,
      //
      companys: companys ?? this.companys,
      selectedcompany: selectedcompany ?? this.selectedcompany,
      //
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      statedate: statedate ?? this.statedate,
      //
      statmentOpeningBalance:
          statmentOpeningBalance ?? this.statmentOpeningBalance,
      statmentCreditsum: statmentCreditsum ?? this.statmentCreditsum,
      statmentDebitsum: statmentDebitsum ?? this.statmentDebitsum,
      statmentBalance: statmentBalance ?? this.statmentBalance,
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        boxs,
        filterdBoxs,
        boxsState,
        boxsMessage,
        //
        boxStatment,
        boxStatmentState,
        boxStatmentMessage,
        //

        companys,
        selectedcompany,
        //
        fromdate,
        todate,
        statedate,
        //
        statmentOpeningBalance,
        statmentCreditsum,
        statmentDebitsum,
        statmentBalance,
      ];
}
