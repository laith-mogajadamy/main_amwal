import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
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
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/white16text.dart';
import 'package:mainamwal/screens/filters/presentation/select_agent.dart';
import 'package:mainamwal/screens/filters/presentation/select_company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/appcolors.dart';

class PurchasesAndSalesFilters extends StatelessWidget {
  const PurchasesAndSalesFilters({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
            // ignore: deprecated_member_use
            color: AppColor.black.withOpacity(0.5),
            blurRadius: 50,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
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
                  Blue16text(text: S.of(context).advancedsearch),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/svg/sliders.svg",
                    // ignore: deprecated_member_use
                    color: AppColor.appblueGray,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          PurchasesAndSalesDatePick(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).bransh}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: const SelectCompany(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).movementtype}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectDocumentCategory(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).invoicetype}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectDocument(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).paymentmethod}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectPaymentMethode(),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).customers}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectCustomerFilter(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).agent}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectAgent(),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).stores}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectFirstStore(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).project}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectProject(),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).transportationcompany}: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectTransportCompanies(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Black16text(
                    text: "${S.of(context).stores}2: ",
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
                    child: SelectSecondeStore(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<FiltesBloc, FiltersState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  // print(state.selectedcurrency);
                  // print(state.selectedcompany);
                  // print(state.selectedaccounttype);
                  // print(state.selectedagent);
                  // print(state.selectedcity);
                  context.read<PurchasesAndSalesBloc>().add(
                        GetDailyPruchasAndSale(
                          type: context
                              .read<FiltesBloc>()
                              .state
                              .selectedpaymentMethodes
                              .code,
                          firstStoreGuid: context
                              .read<FiltesBloc>()
                              .state
                              .firstSelectedStores
                              .guid,
                          customerGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedcustomer
                              .guid,
                          agentGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedagent
                              .guid,
                          documentGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedDocument
                              .guid,
                          categoriesGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedDocumentsCategorie
                              .guid,
                          projectDefaultGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedproject
                              .guid,
                          companiesGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedcompany
                              .guid,
                          transportCompaniesGuid: context
                              .read<FiltesBloc>()
                              .state
                              .selectedtransportCompanie
                              .guid,
                          dueDated: context
                              .read<PurchasesAndSalesBloc>()
                              .state
                              .dueDate,
                          secondStoreGuid: context
                              .read<FiltesBloc>()
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
                  Navigator.pop(context);
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 1.1, size.height / 18),
                  backgroundColor: AppColor.appblueGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: White16text(text: S.of(context).search)),
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
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
