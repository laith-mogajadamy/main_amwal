import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/blue_16_money_text.dart';
import 'package:mainamwal/widgets/font/red_16_money_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalStatmentCard extends StatelessWidget {
  const TotalStatmentCard({
    super.key,
    required this.size,
    required this.statmentTotal,
  });

  final Size size;
  final StatmentTotal statmentTotal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.1),
            blurRadius: 5,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Container(
            // decoration: BoxDecoration(
            //   border: Border(
            //     left: BorderSide(
            //       width: 1,
            //       color: AppColor.apptitle,
            //     ),
            //   ),
            // ),
            padding: EdgeInsets.only(left: 5.w),
            width: size.width / 3.5,
            child: Column(
              children: [
                FittedBox(
                  child: Black14text(text: statmentTotal.docName),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Black16text(text: statmentTotal.code),
                Black16text(text: statmentTotal.securitiesDate),
              ],
            ),
          ),
          Container(
            color: AppColor.apptitle,
            width: 1.w,
            height: size.height / 13,
          ),
          SizedBox(
            width: size.width / 3.5,
            child: Center(
              child: Blue16Moneytext(
                text: statmentTotal.debit,
              ),
            ),
          ),
          SizedBox(
            width: size.width / 3.5,
            child: Center(
              child: Red16Moneytext(
                text: statmentTotal.credit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
