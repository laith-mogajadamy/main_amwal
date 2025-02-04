import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/total_statment_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalStatmentComponent extends StatelessWidget {
  const TotalStatmentComponent({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        switch (state.statmentTotalState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 3,
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
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: Row(
                        children: [
                          AppText(
                              text: "  ${S.of(context).date}/",
                              color: AppColor.apptitle,
                              fontSize: 14),
                          AppText(
                              text: S.of(context).document,
                              color: AppColor.apptitle,
                              fontSize: 14),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                          text: S.of(context).debtor,
                          color: AppColor.apptitle,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                          text: S.of(context).creditor,
                          color: AppColor.apptitle,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 2.2,
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: state.statmentTotal.length,
                    itemBuilder: (context, index) {
                      StatmentTotal statmentTotal = state.statmentTotal[index];
                      return TotalStatmentCard(
                          size: size, statmentTotal: statmentTotal);
                    },
                  ),
                )
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text("no data"),
              ),
            );
        }
      },
    );
  }
}
