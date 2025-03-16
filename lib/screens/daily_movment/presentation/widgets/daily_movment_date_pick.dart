// ignore_for_file: use_build_context_synchronously

import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/daily_movment/controller/daily_movment_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyMovmentDatePick extends StatelessWidget {
  const DailyMovmentDatePick({
    super.key,
    required this.scaffoldkey,
  });
  final GlobalKey<ScaffoldState> scaffoldkey;

  @override
  Widget build(BuildContext context) {
    String? fromselectedDate; // To store the selected date

    Future<void> pickDate(
        BuildContext context, String w, String initialDate) async {
      DateTime initdate = DateTime.now();

      if (initialDate != '') {
        initdate = DateTime.parse(initialDate);
      }
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initdate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColor.appbuleBG,
              colorScheme: ColorScheme.light(
                primary: AppColor.appbuleBG,
                onPrimary: AppColor.whiteColor,
                onSurface: AppColor.appbuleBG,
              ),
              dialogBackgroundColor: AppColor.whiteColor,
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null) {
        String formattedDate =
            DateFormat('yyyy-MM-dd', 'en').format(pickedDate);

        if (w == "from") {
          fromselectedDate = formattedDate;
        }
      }
    }

    return BlocBuilder<DailyMovmentBloc, DailyMovmentState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                AppText(
                  text: "${S.of(context).date}:",
                  color: AppColor.apptitle,
                  fontSize: 16,
                ),
                SizedBox(
                  width: 5.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await pickDate(context, 'from', state.fromDate);
                    context.read<DailyMovmentBloc>().add(
                          FromDateChanged(
                            fromdate: fromselectedDate,
                          ),
                        );
                    // fromselectedDate = null;
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 50.w,
                        vertical: 0.h,
                      ),
                      shape: const StadiumBorder()),
                  child: AppText(
                    text: state.fromDate != ''
                        ? state.fromDate
                        : S.of(context).nodate,
                    color: AppColor.apptitle,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
