import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale_model.dart';
import 'package:mainamwal/screens/purchases_and_sales/data/purchases_and_sales_reqwest.dart';

part 'purchases_and_sales_event.dart';
part 'purchases_and_sales_state.dart';

class PurchasesAndSalesBloc
    extends Bloc<PurchasesAndSalesEvent, PurchasesAndSalesState> {
  PurchasesAndSalesBloc() : super(const PurchasesAndSalesState()) {
    on<ClearDailyPruchasAndSale>((event, emit) async {
      emit(state.copyWith(
        dailyPruchasAndSale: [],
        dailyPruchasAndSaleState: RequestState.loading,
      ));
    });
    //
    on<GetDailyPruchasAndSale>((event, emit) async {
      print("GetDailyPruchasAndSale");
      String? ptoken = Preferences.getToken();
      if (ptoken!.isNotEmpty) {
        emit(state.copyWith(
          token: ptoken,
          dailyPruchasAndSale: [],
          dailyPruchasAndSaleState: RequestState.loading,
        ));

        http.Response response =
            await PurchasesAndSalesReqwest.getPurchasesAndSales(
          event.type,
          event.firstStoreGuid,
          event.customerGuid,
          event.agentGuid,
          event.documentGuid,
          event.categoriesGuid,
          event.projectDefaultGuid,
          event.companiesGuid,
          event.transportCompaniesGuid,
          event.dueDated,
          event.secondStoreGuid,
          event.dateFrom,
          event.dateTo,
        );
        var responsemap = jsonDecode(response.body);

        if (response.statusCode == 200) {
          emit(state.copyWith(
            dailyPruchasAndSale: List<DailyPruchasAndSaleModel>.from(
              (responsemap['data'] as List).map(
                (e) => DailyPruchasAndSaleModel.fromJson(e),
              ),
            ),
            dailyPruchasAndSaleState: RequestState.loaded,
            dailyPruchasAndSaleMessage: responsemap['message'] ?? '',
            //
          ));
          print("state.dailyPruchasAndSale=");
          print(state.dailyPruchasAndSale);
        } else {
          emit(state.copyWith(
            dailyPruchasAndSaleState: RequestState.error,
            dailyPruchasAndSaleMessage: responsemap["message"] ?? '',
          ));
        }
      } else {
        emit(state.copyWith(
          dailyPruchasAndSaleState: RequestState.error,
          dailyPruchasAndSaleMessage: "Unauthenticated",
        ));
      }
    });
    //
  }
}
