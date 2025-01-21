part of 'box_bloc.dart';

class BoxState extends Equatable {
  final String token;
  //
  final List<Box> boxs;
  final RequestState boxsState;
  final String boxsMessage;
  //
  final List<BoxStatment> boxStatment;
  final RequestState boxStatmentState;
  final String boxStatmentMessage;
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
    this.boxsState = RequestState.loading,
    this.boxsMessage = '',
    //
    this.boxStatment = const [],
    this.boxStatmentState = RequestState.loading,
    this.boxStatmentMessage = '',
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
    RequestState? boxsState,
    String? boxsMessage,
    //
    List<BoxStatment>? boxStatment,
    RequestState? boxStatmentState,
    String? boxStatmentMessage,
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
      boxsState: boxsState ?? this.boxsState,
      boxsMessage: boxsMessage ?? this.boxsMessage,
      //
      boxStatment: boxStatment ?? this.boxStatment,
      boxStatmentState: boxStatmentState ?? this.boxStatmentState,
      boxStatmentMessage: boxStatmentMessage ?? this.boxStatmentMessage,
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
        boxsState,
        boxsMessage,
        //
        boxStatment,
        boxStatmentState,
        boxStatmentMessage,
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
