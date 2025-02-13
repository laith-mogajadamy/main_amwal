import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

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
            // ignore: deprecated_member_use
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
                  child: AppText(
                      text: statmentTotal.docName,
                      color: AppColor.orangefont,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppText(
                    text: statmentTotal.code,
                    color: AppColor.appbuleBG,
                    fontSize: 16),
                AppText(
                  text: statmentTotal.securitiesDate,
                  color: AppColor.apptitle,
                  fontSize: 16,
                ),
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
              child: MoneyText(
                text: statmentTotal.debit,
                color: AppColor.appbuleBG,
                fontSize: 16,
                disimalnumber: 3,
              ),
            ),
          ),
          SizedBox(
            width: size.width / 3.5,
            child: Center(
              child: MoneyText(
                  text: statmentTotal.credit,
                  color: Colors.red,
                  fontSize: 16,
                  disimalnumber: 3),
            ),
          ),
        ],
      ),
    );
  }
}
