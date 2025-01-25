part of 'purchases_and_sales_bloc.dart';

class PurchasesAndSalesState extends Equatable {
  final String token;
  //
  final List<DailyPruchasAndSale> dailyPruchasAndSale;
  final RequestState dailyPruchasAndSaleState;
  final String dailyPruchasAndSaleMessage;
  //

  const PurchasesAndSalesState({
    this.token = '',
    //
    this.dailyPruchasAndSale = const [],
    this.dailyPruchasAndSaleState = RequestState.loading,
    this.dailyPruchasAndSaleMessage = '',
  });

  PurchasesAndSalesState copyWith({
    String? token,
    //
    List<DailyPruchasAndSale>? dailyPruchasAndSale,
    RequestState? dailyPruchasAndSaleState,
    String? dailyPruchasAndSaleMessage,
  }) {
    return PurchasesAndSalesState(
      token: token ?? this.token,

      //
      dailyPruchasAndSale: dailyPruchasAndSale ?? this.dailyPruchasAndSale,
      dailyPruchasAndSaleState:
          dailyPruchasAndSaleState ?? this.dailyPruchasAndSaleState,
      dailyPruchasAndSaleMessage:
          dailyPruchasAndSaleMessage ?? this.dailyPruchasAndSaleMessage,
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
      ];
}
