import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/model/box/box_statment.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/blue_16_money_text.dart';
import 'package:mainamwal/widgets/font/orange16text.dart';
import 'package:mainamwal/widgets/font/red_16_money_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/white14text.dart';
import 'package:mainamwal/widgets/font/white16text.dart';

class BoxStatmentCard extends StatelessWidget {
  const BoxStatmentCard({
    super.key,
    required this.size,
    required this.boxstatment,
    required this.box,
  });

  final Size size;
  final BoxStatment boxstatment;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.2),
            spreadRadius: 2.r,
            blurRadius: 5.r,
          )
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
                  Orange16text(
                    text: "  ${boxstatment.docCode}",
                  ),
                  White14text(text: "  ${boxstatment.docName}"),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    // border: Border(
                    //   left: BorderSide(
                    //     width: 1,
                    //     color: AppColor.apptitle,
                    //   ),
                    // ),
                    ),
                padding: EdgeInsets.only(left: 5.w),
                width: size.width / 3.5,
                child: Black16text(text: boxstatment.securitiesDate),
              ),
              Container(
                color: AppColor.apptitle,
                width: 1.w,
                height: size.height / 35,
              ),
              SizedBox(
                width: size.width / 3.5,
                child: Center(
                  child: Blue16Moneytext(
                      text: (box.differentCurrency == '0')
                          ? boxstatment.debitAmount.toString()
                          : boxstatment.debitcurrencyAmount.toString()),
                ),
              ),
              SizedBox(
                width: size.width / 3.5,
                child: Center(
                  child: Red16Moneytext(
                      text: (box.differentCurrency == '0')
                          ? boxstatment.creditAmount.toString()
                          : boxstatment.creditcurrencyAmount.toString()),
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
                  Black14text(
                    text: " ${boxstatment.remarks}",
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
