part of 'purchases_and_sales_bloc.dart';

class PurchasesAndSalesState extends Equatable {
  final String token;
  //
  final List<DailyPruchasAndSale> dailyPruchasAndSale;
  final RequestState dailyPruchasAndSaleState;
  final String dailyPruchasAndSaleMessage;
  //
  final String fromDate;
  final String toDate;
  final String dueDate;
  //
  const PurchasesAndSalesState({
    this.token = '',
    //
    this.dailyPruchasAndSale = const [],
    this.dailyPruchasAndSaleState = RequestState.loading,
    this.dailyPruchasAndSaleMessage = '',
    //
    this.fromDate = '',
    this.toDate = '',
    this.dueDate = '',
  });

  PurchasesAndSalesState copyWith({
    String? token,
    //
    List<DailyPruchasAndSale>? dailyPruchasAndSale,
    RequestState? dailyPruchasAndSaleState,
    String? dailyPruchasAndSaleMessage,
    //
    String? fromDate,
    String? toDate,
    String? dueDate,
  }) {
    return PurchasesAndSalesState(
      token: token ?? this.token,

      //
      dailyPruchasAndSale: dailyPruchasAndSale ?? this.dailyPruchasAndSale,
      dailyPruchasAndSaleState:
          dailyPruchasAndSaleState ?? this.dailyPruchasAndSaleState,
      dailyPruchasAndSaleMessage:
          dailyPruchasAndSaleMessage ?? this.dailyPruchasAndSaleMessage,
      //
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      dueDate: dueDate ?? this.dueDate,
      //
    );
  }

  @override
  List<Object?> get props => [
        token,
        //
        dailyPruchasAndSale,
        dailyPruchasAndSaleState,
        dailyPruchasAndSaleMessage,
        //
        fromDate,
        toDate,
        dueDate,
        //
      ];
}
