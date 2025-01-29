// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/purchases_and_sales_component.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/widgets/purchases_and_sales_filter.dart';
import 'package:mainamwal/widgets/font/white16text.dart';
import 'package:mainamwal/widgets/font/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchasesAndSalesPage extends StatelessWidget {
  final String title;
  const PurchasesAndSalesPage({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return BlocListener<FiltersBloc, FiltersState>(
      listenWhen: (previous, current) =>
          previous.storesState != current.storesState,
      listener: (context, state) {
        context
            .read<PurchasesAndSalesBloc>()
            .add(GetDefDates(context: context));
      },
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: AppColor.whiteColorBG,
        appBar: AppBar(
          backgroundColor: AppColor.appbuleBG,
          title: White18text(
            text: title,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          isScrollControlled: true, // Allows customizing height
                          context: context,
                          enableDrag: true,
                          builder: (BuildContext context) {
                            return PurchasesAndSalesFilters(
                              controller: controller,
                              scaffoldkey: scaffoldkey,
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width / 2.2, size.height / 18),
                        backgroundColor: AppColor.appblueGray,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: White16text(
                                  text: S.of(context).advancedsearch)),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset("assets/svg/sliders.svg")
                        ],
                      ),
                    ),
                    BlocBuilder<FiltersBloc, FiltersState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<PurchasesAndSalesBloc>().add(
                                  GetDailyPruchasAndSale(
                                    type: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedpaymentMethodes
                                        .code,
                                    firstStoreGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .firstSelectedStores
                                        .guid,
                                    customerGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedcustomer
                                        .guid,
                                    agentGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedagent
                                        .guid,
                                    documentGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedDocument
                                        .guid,
                                    categoriesGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedDocumentsCategorie
                                        .guid,
                                    projectDefaultGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedproject
                                        .guid,
                                    companiesGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedcompany
                                        .guid,
                                    transportCompaniesGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .selectedtransportCompanie
                                        .guid,
                                    dueDated: context
                                        .read<PurchasesAndSalesBloc>()
                                        .state
                                        .dueDate,
                                    secondStoreGuid: context
                                        .read<FiltersBloc>()
                                        .state
                                        .secondSelectedStores
                                        .guid,
                                    dateFrom: context
                                        .read<PurchasesAndSalesBloc>()
                                        .state
                                        .fromDate,
                                    dateTo: context
                                        .read<PurchasesAndSalesBloc>()
                                        .state
                                        .toDate,
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(size.width / 2.2, size.height / 18),
                            backgroundColor: AppColor.apporange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              White16text(text: S.of(context).search),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.search,
                                color: AppColor.whiteColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PurchasesAndSalesComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
