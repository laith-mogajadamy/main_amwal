import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/acount_statment.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/blue18text.dart';
import 'package:mainamwal/widgets/font/orange18text%20.dart';
import 'package:mainamwal/widgets/font/orange_18_money_text.dart';

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
              Blue18text(text: "${customer.name}-"),
              Blue18text(text: customer.code),
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
                        child: Orange18text(
                            text: "${S.of(context).currentBalance}: ")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Orange18Moneytext(text: customer.currentBalance),
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
                        child: Black16text(
                            text: "${S.of(context).salesDebtLimit}: ")),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Black16text(text: customer.salesDebtLimit),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Black16text(text: "${S.of(context).address}: "),
              Black16text(text: customer.address),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder<FiltesBloc, FiltersState>(
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
                    child: Blue16text(text: "${S.of(context).showdetails}>"),
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
