import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/general_analysis/account_data.dart';

import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class ParentsGeneralAnalysisCard extends StatelessWidget {
  const ParentsGeneralAnalysisCard({
    super.key,
    required this.accountData,
    required this.scrollController,
  });

  final AccountData accountData;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
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
            scrollController.animateTo(
              0.0,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            );
          },
          child: Container(
            decoration: boxdecoration2(),
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/safebox-svgrepo-com.svg',
                    color: AppColor.apporange,
                    height: size.height / 14,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: (state.language == 'ar')
                        ? AppText(
                            text:
                                "${accountData.accountCode} / ${accountData.accountName}",
                            color: AppColor.apptitle,
                            fontSize: 16,
                          )
                        : AppText(
                            text:
                                "${accountData.accountName} / ${accountData.accountCode}",
                            color: AppColor.apptitle,
                            fontSize: 16,
                          ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MoneyText(
                    text: accountData.closeBalance,
                    color: AppColor.appbuleBG,
                    fontSize: 16,
                    disimalnumber: 3,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/coins-orange.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: accountData.currencyCode,
                            color: AppColor.orangefont,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
