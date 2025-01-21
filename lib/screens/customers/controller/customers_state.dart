part of 'customers_bloc.dart';

class CustomersState extends Equatable {
  final String token;
  //
  final List<Customer> customers;
  final RequestState customerState;
  final String customerMessage;
  //
  final bool filter;
  //
  final String fromdate;
  final String todate;
  final String statedate;
//
  final String totalfiter;
  //
  final bool acountstatmentpage;
  //
  final AgentCard agentCard;
  final RequestState agentCardState;
  //
  final List<StatmentTotal> statmentTotal;
  final RequestState statmentTotalState;
  final String statmentTotalMessage;
  //
  final List<StatmentDetailed> statmentDetailed;
  final RequestState statmentDetailedState;
  final String statmentDetailedMessage;
  //
  final String statmentOpeningBalance;
  final String statmentDebitsum;
  final String statmentCreditsum;
  final String statmentBalance;

  const CustomersState({
    this.token = '',
    //
    this.customers = const [],
    this.customerState = RequestState.loading,
    this.customerMessage = '',

    //
    this.filter = false,
    //
    this.fromdate = '',
    this.todate = '',
    this.statedate = '',
    //
    this.totalfiter = '0',
    //
    this.acountstatmentpage = false,
    //
    this.agentCard = const AgentCard(
        guid: '',
        code: '',
        name: '',
        city: '',
        currentBalance: '',
        address: '',
        salesDebtLimit: '',
        buyDebtLimit: '',
        dealingCurrencyGuid: '',
        creditRestrictions: '',
        cycleDay: '',
        notes: '',
        cycleDayName: '',
        cycleNumber: '',
        debitRestrictions: '',
        mobilephonenumber: '',
        workPhoneNumber: '',
        openingBalance: '',
        payments: '',
        purchases: '',
        receipts: '',
        salePriceCategory: '',
        salePriceCategoryName: '',
        sales: '',
        salesReturned: '',
        purchasesReturned: ''),
    this.agentCardState = RequestState.loading,
    //
    //
    this.statmentTotal = const [],
    this.statmentTotalState = RequestState.error,
    this.statmentTotalMessage = '',
    //
    this.statmentDetailed = const [],
    this.statmentDetailedState = RequestState.error,
    this.statmentDetailedMessage = '',
    //
    this.statmentOpeningBalance = '',
    this.statmentCreditsum = '',
    this.statmentDebitsum = '',
    this.statmentBalance = '',
  });

  CustomersState copyWith({
    String? token,
    //
    List<Customer>? customers,
    RequestState? customerState,
    String? customerMessage,

    //
    bool? filter,
    //
    String? fromdate,
    String? todate,
    String? statedate,
    //
    String? totalfiter,
    //
    bool? acountstatmentpage,
    //
    AgentCard? agentCard,
    RequestState? agentCardState,
    //
    //
    List<StatmentTotal>? statmentTotal,
    RequestState? statmentTotalState,
    String? statmentTotalMessage,
    //
    List<StatmentDetailed>? statmentDetailed,
    RequestState? statmentDetailedState,
    String? statmentDetailedMessage,
    //
    String? statmentOpeningBalance,
    String? statmentCreditsum,
    String? statmentDebitsum,
    String? statmentBalance,
  }) {
    return CustomersState(
      token: token ?? this.token,

      //
      customers: customers ?? this.customers,
      customerState: customerState ?? this.customerState,
      customerMessage: customerMessage ?? this.customerMessage,

      //
      filter: filter ?? this.filter,
      //
      fromdate: fromdate ?? this.fromdate,
      todate: todate ?? this.todate,
      statedate: statedate ?? this.statedate,
      //

      totalfiter: totalfiter ?? this.totalfiter,
      //
      acountstatmentpage: acountstatmentpage ?? this.acountstatmentpage,
      //
      agentCard: agentCard ?? this.agentCard,
      agentCardState: agentCardState ?? this.agentCardState,
      //
      statmentTotal: statmentTotal ?? this.statmentTotal,
      statmentTotalState: statmentTotalState ?? this.statmentTotalState,
      statmentTotalMessage: statmentTotalMessage ?? this.statmentTotalMessage,
      //
      statmentDetailed: statmentDetailed ?? this.statmentDetailed,
      statmentDetailedState:
          statmentDetailedState ?? this.statmentDetailedState,
      statmentDetailedMessage:
          statmentDetailedMessage ?? this.statmentDetailedMessage,
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
        customers,
        customerState,
        customerMessage,
        //
        filter,
        //
        fromdate,
        todate,
        statedate,
        //
        totalfiter,
        //
        acountstatmentpage,
        //
        agentCard,
        agentCardState,
        //
        statmentTotal,
        statmentTotalState,
        statmentTotalMessage,
        //
        statmentDetailed,
        statmentDetailedState,
        statmentDetailedMessage,
        //
        statmentOpeningBalance,
        statmentCreditsum,
        statmentDebitsum,
        statmentBalance,
      ];
}
