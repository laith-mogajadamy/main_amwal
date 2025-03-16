// ignore_for_file: use_build_context_synchronously

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/daily_movment/controller/daily_movment_bloc.dart';
import 'package:mainamwal/screens/daily_movment/presentation/daily_movment_component.dart';
import 'package:mainamwal/screens/daily_movment/presentation/widgets/daily_movment_date_pick.dart';
import 'package:mainamwal/screens/daily_movment/presentation/widgets/select_daily_movment_company.dart';
import 'package:mainamwal/screens/daily_movment/presentation/widgets/select_daily_movment_document_category.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyMovmentPage extends StatelessWidget {
  final String title;
  const DailyMovmentPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    context.read<DailyMovmentBloc>().add(GetCompanys());

    return Scaffold(
      key: scaffoldkey,
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: title,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
        actions: [SelectDailyMovmentCompany()],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DailyMovmentDatePick(scaffoldkey: scaffoldkey),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectDailyMovmentDocumentCategory(),
                  BlocBuilder<DailyMovmentBloc, DailyMovmentState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: size.height / 22,
                        width: size.width / 2.2,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<DailyMovmentBloc>()
                                .add(GetDailyMovment());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.apporange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: S.of(context).search,
                                color: AppColor.whiteColor,
                                fontSize: 16,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Icon(
                                Icons.search,
                                color: AppColor.whiteColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: DailyMovmentComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
