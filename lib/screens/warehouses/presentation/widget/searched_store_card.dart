import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/warehouses/searched_warehouses.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class SearchedStoreCard extends StatelessWidget {
  const SearchedStoreCard({
    super.key,
    required this.searchedWarehouse,
  });

  final SearchedWarehouses searchedWarehouse;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(searchedWarehouse.expiryDate);
    String formattedDate = DateFormat('yyyy-MM-dd', "en").format(date);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColor.black.withOpacity(0.1),
            blurRadius: 5,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ExpansionTile(
        shape: Border.all(color: Colors.transparent),
        childrenPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: AppText(
                    text: searchedWarehouse.itemsName,
                    color: AppColor.orangefont,
                    fontSize: 14,
                  ),
                ),
                (searchedWarehouse.batchNo != '0')
                    ? Row(
                        children: [
                          AppText(
                              text: "${S.of(context).batchnumber}:",
                              color: AppColor.apptitle,
                              fontSize: 12),
                          MoneyText(
                            text: searchedWarehouse.batchNo,
                            color: AppColor.appbuleBG,
                            fontSize: 14,
                            disimalnumber: 4,
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: searchedWarehouse.storeName,
                  color: AppColor.appbuleBG,
                  fontSize: 12,
                ),
                Row(
                  children: [
                    AppText(
                      text: "${S.of(context).quantity}:",
                      color: AppColor.apptitle,
                      fontSize: 12,
                    ),
                    MoneyText(
                      text: searchedWarehouse.currentQuantity,
                      color: AppColor.appbuleBG,
                      fontSize: 13,
                      disimalnumber: 4,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: S.of(context).costRate,
                    color: AppColor.apptitle,
                    fontSize: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MoneyText(
                    text: searchedWarehouse.costRate,
                    color: AppColor.appbuleBG,
                    fontSize: 14,
                    disimalnumber: 3,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: S.of(context).cost,
                    color: AppColor.apptitle,
                    fontSize: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MoneyText(
                    text: searchedWarehouse.cost,
                    color: AppColor.appbuleBG,
                    fontSize: 14,
                    disimalnumber: 3,
                  ),
                ],
              ),
            ],
          ),
          (formattedDate == '1900-01-01')
              ? SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: S.of(context).expirydate,
                      color: AppColor.apptitle,
                      fontSize: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    AppText(
                      text: formattedDate,
                      color: AppColor.appbuleBG,
                      fontSize: 14,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
