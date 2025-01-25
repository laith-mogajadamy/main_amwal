import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/widgets/purchases_and_sales_card.dart';
import 'package:mainamwal/widgets/font/black14text.dart';

class PurchasesAndSalesComponent extends StatelessWidget {
  const PurchasesAndSalesComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<PurchasesAndSalesBloc, PurchasesAndSalesState>(
      builder: (context, state) {
        switch (state.dailyPruchasAndSaleState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 1.5,
              child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appblueGray,
                    strokeWidth: 4.w,
                  )),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: Row(
                        children: [
                          Black14text(
                            text: "  ${S.of(context).date}/",
                          ),
                          Black14text(
                            text: S.of(context).document,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: SizedBox(
                        width: size.width / 3.5,
                        child: Black14text(
                          text: S.of(context).cash,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: state.dailyPruchasAndSale.length,
                      itemBuilder: (context, index) {
                        DailyPruchasAndSale dailyPruchasAndSale =
                            state.dailyPruchasAndSale[index];
                        return DailyPruchasAndSaleCard(
                          dailyPruchasAndSale: dailyPruchasAndSale,
                          size: size,
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.dailyPruchasAndSaleMessage),
              ),
            );
        }
      },
    );
  }
}
