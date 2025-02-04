import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart'; // Import AppText
import 'package:mainamwal/widgets/font/money_text.dart'; // Import MoneyText
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcountStatmentBottomSheet extends StatelessWidget {
  const AcountStatmentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                        text: S.of(context).sum,
                        color: AppColor.appbuleBG,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      child: (state.statmentDebitsum != '')
                          ? MoneyText(
                              text: state.statmentDebitsum,
                              color: AppColor.appbuleBG,
                              fontSize: 16,
                              disimalnumber: 3,
                            )
                          : SizedBox.shrink(),
                    ),
                    SizedBox(
                        width: size.width / 3.5,
                        child: (state.statmentCreditsum != '')
                            ? MoneyText(
                                text: state.statmentCreditsum,
                                color: AppColor.appbuleBG,
                                fontSize: 16,
                                disimalnumber: 3,
                              )
                            : SizedBox.shrink()),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                        text: S.of(context).balance,
                        color: AppColor.appbuleBG,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                        width: size.width / 3.5,
                        child: (state.statmentBalance != '')
                            ? MoneyText(
                                text: state.statmentBalance,
                                color: AppColor.appbuleBG,
                                fontSize: 16,
                                disimalnumber: 3,
                              )
                            : SizedBox.shrink()),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
