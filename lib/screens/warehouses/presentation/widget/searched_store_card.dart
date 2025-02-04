import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/warehouses/warehouses.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class SearchedStoreCard extends StatelessWidget {
  const SearchedStoreCard({
    super.key,
    required this.warehouse,
  });

  final Warehouses warehouse;

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
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: warehouse.itemsName,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
                AppText(
                  text: warehouse.storeName,
                  color: AppColor.appbuleBG,
                  fontSize: 14,
                ),
              ],
            ),
            AppText(
              text: warehouse.currentQuantity,
              color: AppColor.apptitle,
              fontSize: 14,
            ),
          ],
        ),
        children: [
          MoneyText(
            text: warehouse.cost,
            color: AppColor.apptitle,
            fontSize: 14,
            disimalnumber: 3,
          ),
          MoneyText(
            text: warehouse.costRate,
            color: AppColor.apptitle,
            fontSize: 14,
            disimalnumber: 3,
          ),
          (warehouse.batchNo == '0')
              ? SizedBox.shrink()
              : AppText(
                  text: warehouse.batchNo,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
          (warehouse.expiryDate == '1900-01-01 00:00:00.000')
              ? SizedBox.shrink()
              : AppText(
                  text: warehouse.expiryDate,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
        ],
      ),
    );
  }
}
