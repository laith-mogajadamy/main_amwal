import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/acount_statment.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/money_text.dart'; // updated this import
import 'package:mainamwal/widgets/font/app_text.dart'; // added the AppText import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColor.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              AppText(
                text: "${customer.name}-",
                color: AppColor.appbuleBG,
                fontSize: 18,
              ),
              AppText(
                text: customer.code,
                color: AppColor.appbuleBG,
                fontSize: 18,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width / 2.8,
                child: Row(
                  children: [
                    FittedBox(
                      child: AppText(
                        text: "${S.of(context).currentBalance}: ",
                        color: AppColor.orangefont,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MoneyText(
                      text: customer.currentBalance,
                      color: AppColor.orangefont,
                      fontSize: 16,
                      disimalnumber: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: size.width / 2.8,
                child: Row(
                  children: [
                    FittedBox(
                      child: AppText(
                        text: "${S.of(context).salesDebtLimit}: ",
                        color: AppColor.apptitle,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: customer.salesDebtLimit,
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "${S.of(context).address}: ",
                color: AppColor.apptitle,
                fontSize: 16,
              ),
              AppText(
                text: customer.address,
                color: AppColor.apptitle,
                fontSize: 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<FiltersBloc, FiltersState>(
                builder: (context, state) {
                  return TextButton(
                    onPressed: () {
                      if (state.page == "customers") {
                        context
                            .read<CustomersBloc>()
                            .add(GetDefDates(guid: customer.guid));
                        context
                            .read<CustomersBloc>()
                            .add(GetAgentCardCustomer(guid: customer.guid));
                      }
                      if (state.page == "suppliers") {
                        context
                            .read<CustomersBloc>()
                            .add(GetDefDates(guid: customer.guid));
                        context
                            .read<CustomersBloc>()
                            .add(GetAgentCardSupplier(guid: customer.guid));
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AcountStatment(
                            customer: customer,
                          ),
                        ),
                      );
                    },
                    child: AppText(
                      text: "${S.of(context).showdetails}>",
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
