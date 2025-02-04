import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/filters/presentation/select_currency.dart';
import 'package:mainamwal/screens/filters/presentation/select_customer_filter.dart';
import 'package:mainamwal/screens/filters/presentation/select_document.dart';
import 'package:mainamwal/screens/filters/presentation/select_document_category.dart';
import 'package:mainamwal/screens/filters/presentation/select_first_store.dart';
import 'package:mainamwal/screens/filters/presentation/select_payment_methode.dart';
import 'package:mainamwal/screens/filters/presentation/select_project.dart';
import 'package:mainamwal/screens/filters/presentation/select_seconde_store.dart';
import 'package:mainamwal/screens/filters/presentation/select_transport_companies.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/widgets/purchases_and_sales_date_pick.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/screens/filters/presentation/select_agent.dart';
import 'package:mainamwal/screens/filters/presentation/select_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/appcolors.dart';

class PurchasesAndSalesFilters extends StatelessWidget {
  const PurchasesAndSalesFilters({
    super.key,
    required this.controller,
    required this.scaffoldkey,
  });

  final TextEditingController controller;
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColorBG,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.5),
            blurRadius: 50,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3.h,
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            decoration: BoxDecoration(
              color: AppColor.apptitle,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: S.of(context).advancedsearch,
                    color: AppColor.appbuleBG,
                    fontSize: 16,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/svg/sliders.svg",
                    color: AppColor.appbuleBG,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          PurchasesAndSalesDatePick(
            scaffoldkey: scaffoldkey,
          ),
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              String code = state.selectedDocumentsCategorie.code;
              List filters = [
                const SelectCompany(),
                SelectCurrency(),
                SelectDocumentCategory(),
                SelectDocument(),
                SelectCustomerFilter(),
                (code == '26' ||
                        code == '36' ||
                        code == '22' ||
                        code == '32' ||
                        code == '23' ||
                        code == '33' ||
                        code == '25' ||
                        code == '35')
                    ? SizedBox.shrink()
                    : SelectPaymentMethode(),
                SelectAgent(),
                SelectProject(),
                (code == '26' ||
                        code == '36' ||
                        code == '22' ||
                        code == '32' ||
                        code == '23' ||
                        code == '33')
                    ? SizedBox.shrink()
                    : SelectFirstStore(),
                (code == '26' ||
                        code == '36' ||
                        code == '22' ||
                        code == '32' ||
                        code == '25' ||
                        code == '35')
                    ? SizedBox.shrink()
                    : SelectTransportCompanies(),
                (code == '34' ||
                        code == '31' ||
                        code == '24' ||
                        code == '21' ||
                        code == '26' ||
                        code == '36' ||
                        code == '22' ||
                        code == '32' ||
                        code == '23' ||
                        code == '33')
                    ? SizedBox.shrink()
                    : SelectSecondeStore(),
              ];
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.3,
                ),
                itemCount: filters.length,
                itemBuilder: (BuildContext context, int index) {
                  return filters[index];
                },
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              return SizedBox(
                height: size.height / 18,
                width: size.width / 1.1,
                child: ElevatedButton(
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
                            currGuid: context
                                .read<FiltersBloc>()
                                .state
                                .selectedcurrency
                                .guid,
                          ),
                        );
                    Navigator.pop(context);
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.appblueGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: AppText(
                              text: S.of(context).search,
                              color: AppColor.whiteColor,
                              fontSize: 16)),
                      SizedBox(
                        width: 10.w,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColor.whiteColor,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
