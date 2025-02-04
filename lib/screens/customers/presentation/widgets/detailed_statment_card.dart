import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

// ignore: must_be_immutable
class DetailedStatmentCard extends StatelessWidget {
  final StatmentDetailed statmentDetailed;
  final Size size;

  DetailedStatmentCard({
    super.key,
    required this.statmentDetailed,
    required this.size,
  });
  List<String> validValues = ["31", "34", "21", "24"];

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
            Row(
              children: [
                AppText(
                  text: statmentDetailed.docName,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
                AppText(
                  text: " (${statmentDetailed.code})",
                  color: AppColor.appbuleBG,
                  fontSize: 14,
                ),
              ],
            ),
            AppText(
              text: statmentDetailed.securitiesDate,
              color: AppColor.apptitle,
              fontSize: 14,
            ),
          ],
        ),
        children: List.generate(
          statmentDetailed.details.length,
          (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      (index == 0)
                          ? Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                children: [
                                  (validValues.contains(
                                          statmentDetailed.docCatCode))
                                      ? SizedBox(
                                          width: size.width / 3.4,
                                          child: Row(
                                            children: [
                                              AppText(
                                                text:
                                                    "  ${S.of(context).price} × ${S.of(context).k}",
                                                color: AppColor.apporange,
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: size.width / 3.4,
                                        ),
                                  SizedBox(
                                    width: size.width / 3.5,
                                    child: AppText(
                                      text: S.of(context).debtor,
                                      color: AppColor.apporange,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 3.5,
                                    child: AppText(
                                      text: S.of(context).creditor,
                                      color: AppColor.apporange,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: size.width / 1.2,
                            decoration: BoxDecoration(
                                color: AppColor.whiteColorBG,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Wrap(
                                children: [
                                  AppText(
                                    text:
                                        " ${statmentDetailed.details[index].remarks}",
                                    color: AppColor.apptitle,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          (validValues.contains(statmentDetailed.docCatCode))
                              ? SizedBox(
                                  width: size.width / 3.4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width / 7,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: MoneyText(
                                            text: statmentDetailed
                                                .details[index].unitPrice
                                                .toString(),
                                            color: AppColor.apptitle,
                                            fontSize: 16,
                                            disimalnumber: 3,
                                          ),
                                        ),
                                      ),
                                      AppText(
                                        text: "×",
                                        color: AppColor.apptitle,
                                        fontSize: 16,
                                      ),
                                      SizedBox(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: MoneyText(
                                            text: statmentDetailed
                                                .details[index].quantity
                                                .toString(),
                                            color: AppColor.apptitle,
                                            fontSize: 16,
                                            disimalnumber: 3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  width: size.width / 3.4,
                                ),
                          SizedBox(
                            width: size.width / 3.5,
                            child: MoneyText(
                              text: statmentDetailed.details[index].debit
                                  .toString(),
                              color: AppColor.appbuleBG,
                              fontSize: 16,
                              disimalnumber: 3,
                            ),
                          ),
                          SizedBox(
                            width: size.width / 3.5,
                            child: MoneyText(
                              text: statmentDetailed.details[index].credit
                                  .toString(),
                              color: Colors.red,
                              fontSize: 16,
                              disimalnumber: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
