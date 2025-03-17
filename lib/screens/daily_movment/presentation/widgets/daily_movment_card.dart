import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/daily_movment/daily_movment.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyMovmentCard extends StatelessWidget {
  const DailyMovmentCard({
    super.key,
    required this.size,
    required this.dailyMovment,
  });

  final Size size;
  final DailyMovment dailyMovment;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(dailyMovment.securitiesDate);
    String formattedDate = DateFormat('HH:mm', "en").format(date);

    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.2),
            spreadRadius: 2.r,
            blurRadius: 5.r,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.appbuleBG,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                children: [
                  AppText(
                    text: "  ${dailyMovment.securitiesNumber}",
                    color: AppColor.apporange,
                    fontSize: 16,
                  ),
                  AppText(
                    text:
                        "  ${dailyMovment.name} / ${dailyMovment.customerName}",
                    color: AppColor.whiteColor,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.w),
                    width: size.width / 5,
                    child: AppText(
                      text: formattedDate,
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    color: AppColor.apptitle,
                    width: 1.w,
                    height: size.height / 35,
                  ),
                ],
              ),
              SizedBox(
                width: size.width / 5,
                child: Center(
                  child: MoneyText(
                    text: dailyMovment.debet.toString(),
                    color: AppColor.appbuleBG,
                    fontSize: 16,
                    disimalnumber: 3,
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 5,
                child: Center(
                  child: MoneyText(
                    text: dailyMovment.credit.toString(),
                    color: AppColor.redfont,
                    fontSize: 16,
                    disimalnumber: 3,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 0.w),
                child: SizedBox(
                  width: size.width / 5,
                  child: Center(
                    child: MoneyText(
                      text: dailyMovment.ageL.toString(),
                      color: AppColor.appbuleBG,
                      fontSize: 16,
                      disimalnumber: 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.applightgray,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: " ${dailyMovment.remarks}",
                    color: AppColor.apptitle,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
