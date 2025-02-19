import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class ChiledsGeneralAnalysisCard extends StatelessWidget {
  const ChiledsGeneralAnalysisCard({
    super.key,
    required this.size,
    required this.accountData,
  });

  final Size size;
  final AccountData accountData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<GeneralAnalysisBloc>().add(
              AddToPath(
                accountData: accountData,
              ),
            );
        context.read<GeneralAnalysisBloc>().add(GetParentsGeneralAnalysis(
              parentGuid: accountData.accountGuid,
              aLER: "",
              mainDTL: "-1",
            ));
        context.read<GeneralAnalysisBloc>().add(GetChiledGeneralAnalysis(
              parentGuid: accountData.accountGuid,
              aLER: "",
              mainDTL: "0",
            ));
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
                        text: "  ${accountData.accountCode}",
                        color: AppColor.apporange,
                        fontSize: 16),
                    AppText(
                      text: "  ${accountData.accountName}",
                      color: AppColor.whiteColor,
                      fontSize: 16,
                    ),
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
                  child: AppText(
                    text: accountData.closeBalance,
                    color: AppColor.apptitle,
                    fontSize: 16,
                  ),
                ),
                Container(
                  color: AppColor.apptitle,
                  width: 1.w,
                  height: size.height / 35,
                ),
                SizedBox(
                  width: size.width / 3.5,
                  child: Center(
                    child: MoneyText(
                      text: accountData.closeBalance,
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
                      text: accountData.closeBalanceFC,
                      color: Colors.red,
                      fontSize: 16,
                      disimalnumber: 3,
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
                        text: " ${accountData.parentGuid}",
                        color: AppColor.apptitle,
                        fontSize: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
