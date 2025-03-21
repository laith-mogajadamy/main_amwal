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
  final int statmentPage;
  final RequestState statmentLoadMoreState;
  //
  final String statmentOpeningBalance;
  final String statmentDebitsum;
  final String statmentCreditsum;
  final String statmentBalance;

  // Customer Pagination & Load More
  final int customerPage;
  final RequestState customerLoadMoreState;

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
    this.statmentTotal = const [],
    this.statmentTotalState = RequestState.error,
    this.statmentTotalMessage = '',
    //
    this.statmentDetailed = const [],
    this.statmentDetailedState = RequestState.error,
    this.statmentDetailedMessage = '',
    //
    this.statmentPage = 1,
    this.statmentLoadMoreState = RequestState.loaded,
    //
    this.statmentOpeningBalance = '',
    this.statmentCreditsum = '',
    this.statmentDebitsum = '',
    this.statmentBalance = '',
    //
    // Pagination & Load More for Customers
    this.customerPage = 1,
    this.customerLoadMoreState = RequestState.loaded,
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
    int? statmentPage,
    RequestState? statmentLoadMoreState,
    //
    String? statmentOpeningBalance,
    String? statmentCreditsum,
    String? statmentDebitsum,
    String? statmentBalance,
    //
    int? customerPage,
    RequestState? customerLoadMoreState,
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
      statmentPage: statmentPage ?? this.statmentPage,
      statmentLoadMoreState:
          statmentLoadMoreState ?? this.statmentLoadMoreState,
      //
      statmentOpeningBalance:
          statmentOpeningBalance ?? this.statmentOpeningBalance,
      statmentCreditsum: statmentCreditsum ?? this.statmentCreditsum,
      statmentDebitsum: statmentDebitsum ?? this.statmentDebitsum,
      statmentBalance: statmentBalance ?? this.statmentBalance,
      //
      // Customer Pagination & Load More
      customerPage: customerPage ?? this.customerPage,
      customerLoadMoreState:
          customerLoadMoreState ?? this.customerLoadMoreState,
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
        statmentPage,
        statmentLoadMoreState,
        //
        statmentOpeningBalance,
        statmentCreditsum,
        statmentDebitsum,
        statmentBalance,
        //
        customerPage,
        customerLoadMoreState,
      ];
}
