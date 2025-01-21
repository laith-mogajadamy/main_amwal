import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/black_16_money_text.dart';
import 'package:mainamwal/widgets/font/blue14text.dart';
import 'package:mainamwal/widgets/font/orange16text.dart';

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
                Black14text(text: statmentDetailed.docName),
                Blue14text(text: " (${statmentDetailed.code})"),
              ],
            ),
            Black14text(text: statmentDetailed.securitiesDate),
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
                                              Orange16text(
                                                text:
                                                    "  ${S.of(context).price} × ${S.of(context).k}",
                                              ),
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          width: size.width / 3.4,
                                        ),
                                  SizedBox(
                                    width: size.width / 3.5,
                                    child: Orange16text(
                                      text: S.of(context).debtor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width / 3.5,
                                    child: Orange16text(
                                      text: S.of(context).creditor,
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
                                  Black14text(
                                    text:
                                        " ${statmentDetailed.details[index].remarks}",
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
                                          child: Black16Moneytext(
                                            text: statmentDetailed
                                                .details[index].unitPrice
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      Black16text(text: "×"),
                                      SizedBox(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Black16Moneytext(
                                            text: statmentDetailed
                                                .details[index].quantity
                                                .toString(),
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
                            child: Black16Moneytext(
                              text: statmentDetailed.details[index].debit
                                  .toString(),
                            ),
                          ),
                          SizedBox(
                            width: size.width / 3.5,
                            child: Black16Moneytext(
                              text: statmentDetailed.details[index].credit
                                  .toString(),
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
