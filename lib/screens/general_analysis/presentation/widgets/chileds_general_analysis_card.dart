import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class ChiledsGeneralAnalysisCard extends StatelessWidget {
  const ChiledsGeneralAnalysisCard({
    super.key,
    required this.size,
    required this.accountData,
    required this.scrollController,
  });

  final Size size;
  final AccountData accountData;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.read<GeneralAnalysisBloc>().add(
        //       AddToPath(
        //         accountData: accountData,
        //       ),
        //     );
        // context.read<GeneralAnalysisBloc>().add(GetParentsGeneralAnalysis(
        //       parentGuid: accountData.accountGuid,
        //       aLER: "",
        //       mainDTL: "-1",
        //     ));
        // context.read<GeneralAnalysisBloc>().add(GetChiledGeneralAnalysis(
        //       parentGuid: accountData.accountGuid,
        //       aLER: "",
        //       mainDTL: "0",
        //     ));
        // scrollController.animateTo(
        //   0.0,
        //   duration: Duration(seconds: 1),
        //   curve: Curves.easeInOut,
        // );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColor.black.withOpacity(0.2),
              spreadRadius: 2.r,
              blurRadius: 5.r,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        margin: EdgeInsets.symmetric(
          vertical: 5.h,
          horizontal: 5.w,
        ),
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
                        text: "  ${accountData.accountCode}",
                        color: AppColor.apporange,
                        fontSize: 16),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: AppText(
                        text: "  ${accountData.accountName}",
                        color: AppColor.whiteColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   color: AppColor.apptitle,
                  //   width: 1.w,
                  //   height: size.height / 35,
                  // ),
                  AppText(
                    text: accountData.mainCurrCode,
                    color: AppColor.apptitle,
                    fontSize: 16,
                  ),
                  MoneyText(
                    text: accountData.closeBalance,
                    color: AppColor.apptitle,
                    fontSize: 16,
                    disimalnumber: 3,
                  ),
                ],
              ),
            ),
            (accountData.currencyCode != accountData.mainCurrCode)
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColor.applightgray,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: accountData.currencyCode,
                            color: AppColor.appdarkorange,
                            fontSize: 16,
                          ),
                          MoneyText(
                            text: accountData.closeBalanceFC,
                            color: AppColor.appdarkorange,
                            fontSize: 16,
                            disimalnumber: 3,
                          ),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
