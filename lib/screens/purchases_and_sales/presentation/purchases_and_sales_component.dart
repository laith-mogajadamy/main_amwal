import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/widgets/purchases_and_sales_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class PurchasesAndSalesComponent extends StatefulWidget {
  const PurchasesAndSalesComponent({
    super.key,
  });

  @override
  State<PurchasesAndSalesComponent> createState() =>
      _PurchasesAndSalesComponentState();
}

class _PurchasesAndSalesComponentState
    extends State<PurchasesAndSalesComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<PurchasesAndSalesBloc>().add(
            LoadMoreDailyPruchasAndSale(
              type: context
                  .read<FiltersBloc>()
                  .state
                  .selectedpaymentMethodes
                  .code,
              firstStoreGuid:
                  context.read<FiltersBloc>().state.firstSelectedStores.guid,
              customerGuid:
                  context.read<FiltersBloc>().state.selectedcustomer.guid,
              agentGuid: context.read<FiltersBloc>().state.selectedagent.guid,
              documentGuid:
                  context.read<FiltersBloc>().state.selectedDocument.guid,
              categoriesGuid: context
                  .read<FiltersBloc>()
                  .state
                  .selectedDocumentsCategorie
                  .guid,
              projectDefaultGuid:
                  context.read<FiltersBloc>().state.selectedproject.guid,
              companiesGuid:
                  context.read<FiltersBloc>().state.selectedcompany.guid,
              transportCompaniesGuid: context
                  .read<FiltersBloc>()
                  .state
                  .selectedtransportCompanie
                  .guid,
              dueDated: context.read<PurchasesAndSalesBloc>().state.dueDate,
              secondStoreGuid:
                  context.read<FiltersBloc>().state.secondSelectedStores.guid,
              dateFrom: context.read<PurchasesAndSalesBloc>().state.fromDate,
              dateTo: context.read<PurchasesAndSalesBloc>().state.toDate,
              currGuid: context.read<FiltersBloc>().state.selectedcurrency.guid,
            ),
          );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

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
                ),
              ),
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
                          AppText(
                            text: "  ${S.of(context).date}/",
                            color: AppColor.apptitle,
                            fontSize: 14,
                          ),
                          AppText(
                            text: S.of(context).document,
                            color: AppColor.apptitle,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: SizedBox(
                        width: size.width / 3.5,
                        child: AppText(
                          text: S.of(context).theamount,
                          color: AppColor.apptitle,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
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
                (state.loadMoreState == RequestState.loading)
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: AppColor.appblueGray,
                          strokeWidth: 4.w,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: AppText(
                  text: state.dailyPruchasAndSaleMessage,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
              ),
            );
        }
      },
    );
  }
}
