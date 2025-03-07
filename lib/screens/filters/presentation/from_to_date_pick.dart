import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FromToDatePick extends StatelessWidget {
  const FromToDatePick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? fromselectedDate; // To store the selected date
    DateTime? toselectedDate; // To store the selected date

    Future<void> pickDate(
        BuildContext context, String w, String initialDate) async {
      DateTime initdate = DateTime.now();

      if (initialDate != '') {
        initdate = DateTime.parse(initialDate);
      }
      print(initdate);
      final DateTime? pickedDate = await showDatePicker(
        locale: Locale('en'),
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

      if (pickedDate != null && pickedDate != fromselectedDate) {
        if (w == "from") {
          fromselectedDate = pickedDate;
        }
        if (w == "to") {
          toselectedDate = pickedDate;
        }
      }
    }

    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                AppText(
                  text: "${S.of(context).from}: ",
                  color: AppColor.apptitle,
                  fontSize: 12,
                ),
                SizedBox(
                  width: 0.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await pickDate(context, 'from', state.fromDate);
                    if (fromselectedDate!
                        .isAfter(DateTime.parse(state.toDate))) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: AppText(
                            text: S.of(context).unvalidedate,
                            color: AppColor.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      );
                    } else {
                      context.read<FiltersBloc>().add(FiltterFromDateChanged(
                          fromdate:
                              '${fromselectedDate!.year.toString()}-${fromselectedDate!.month.toString().padLeft(2, '0')}-${fromselectedDate!.day.toString().padLeft(2, '0')}'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                  child: AppText(
                    text: state.fromDate != ''
                        ? state.fromDate
                        : S.of(context).nodate,
                    color: AppColor.apptitle,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 0.w,
            ),
            Row(
              children: [
                AppText(
                  text: "${S.of(context).to}:",
                  color: AppColor.apptitle,
                  fontSize: 12,
                ),
                SizedBox(
                  width: 0.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await pickDate(context, 'to', state.toDate);
                    if (toselectedDate!
                        .isBefore(DateTime.parse(state.fromDate))) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: AppText(
                            text: S.of(context).unvalidedate,
                            color: AppColor.whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      );
                    } else {
                      context.read<FiltersBloc>().add(FiltterToDateChanged(
                          todate:
                              '${toselectedDate!.year.toString()}-${toselectedDate!.month.toString().padLeft(2, '0')}-${toselectedDate!.day.toString().padLeft(2, '0')}'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r)))),
                  child: AppText(
                    text: state.toDate != ''
                        ? state.toDate
                        : S.of(context).nodate,
                    color: AppColor.apptitle,
                    fontSize: 12,
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
