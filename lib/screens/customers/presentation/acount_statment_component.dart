import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/detailed_statment_component.dart';
import 'package:mainamwal/screens/customers/presentation/total_statment_component.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/from_to_date_pick.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/total_filter_change.dart';
import 'package:mainamwal/widgets/font/black_14_money_text.dart';
import 'package:mainamwal/widgets/font/blue14text.dart';

class AcountStatmentComponent extends StatelessWidget {
  final Customer customer;
  const AcountStatmentComponent({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            const TotalFilterChange(),
            SizedBox(
              height: 5.h,
            ),
            const FromToDatePick(),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<CustomersBloc, CustomersState>(
              builder: (context, state) {
                return Container(
                  decoration: boxdecoration1(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Blue14text(text: " ${S.of(context).openningbalance} :"),
                        (state.statmentOpeningBalance != '')
                            ? Expanded(
                                child: Black14Moneytext(
                                    text: state.statmentOpeningBalance),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<CustomersBloc, CustomersState>(
              builder: (context, state) {
                return (state.totalfiter == '0')
                    ? TotalStatmentComponent(size: size)
                    : DetailedStatmentComponent(size: size);
              },
            )
          ],
        ),
      ),
    );
  }
}
