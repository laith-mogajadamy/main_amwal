import 'package:get/get.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class CustomerFromToDatePick extends StatelessWidget {
  const CustomerFromToDatePick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? fromselectedDate; // To store the selected date
    DateTime? toselectedDate; // To store the selected date
    DateTime? stateselecteddate; // To store the selected date

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
        if (w == "state") {
          stateselecteddate = pickedDate;
          context.read<CustomersBloc>().add(ChangeStateDate(
              statedate:
                  '${stateselecteddate!.year.toString()}-${stateselecteddate!.month.toString().padLeft(2, '0')}-${stateselecteddate!.day.toString().padLeft(2, '0')}'));
        }
      }
    }

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        return Row(
          children: [
            Row(
              children: [
                AppText(
                  text: "${S.of(context).from}:",
                  color: AppColor.apptitle,
                  fontSize: 12,
                ),
                SizedBox(
                  width: 0.w,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await pickDate(context, 'from', state.fromdate);
                    if (fromselectedDate!
                        .isAfter(DateTime.parse(state.todate))) {
                      Get.snackbar(
                        '',
                        '',
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                        titleText: AppText(
                          text: S.of(context).unvalidedate,
                          color: AppColor.whiteColor,
                          fontSize: 16,
                        ),
                        messageText: SizedBox.shrink(),
                      );
                    } else {
                      context.read<CustomersBloc>().add(ChangeFromDate(
                          fromdate:
                              '${fromselectedDate!.year.toString()}-${fromselectedDate!.month.toString().padLeft(2, '0')}-${fromselectedDate!.day.toString().padLeft(2, '0')}'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: const EdgeInsets.all(10),
                      shape: const StadiumBorder()),
                  child: AppText(
                    text: state.fromdate != ''
                        ? state.fromdate
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
                    await pickDate(context, 'to', state.todate);
                    if (toselectedDate!
                        .isBefore(DateTime.parse(state.fromdate))) {
                      Get.snackbar(
                        '',
                        '',
                        backgroundColor: Colors.red,
                        snackPosition: SnackPosition.BOTTOM,
                        titleText: AppText(
                          text: S.of(context).unvalidedate,
                          color: AppColor.whiteColor,
                          fontSize: 16,
                        ),
                        messageText: SizedBox.shrink(),
                      );
                    } else {
                      context.read<CustomersBloc>().add(ChangeToDate(
                          todate:
                              '${toselectedDate!.year.toString()}-${toselectedDate!.month.toString().padLeft(2, '0')}-${toselectedDate!.day.toString().padLeft(2, '0')}'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: const EdgeInsets.all(10),
                      shape: const StadiumBorder()),
                  child: AppText(
                    text: state.todate != ''
                        ? state.todate
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
                  text: "${S.of(context).stateDate}:",
                  color: AppColor.apptitle,
                  fontSize: 12,
                ),
                SizedBox(
                  width: 0.w,
                ),
                ElevatedButton(
                  onPressed: () => pickDate(context, 'state', state.statedate),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      padding: const EdgeInsets.all(10),
                      shape: const StadiumBorder()),
                  child: AppText(
                    text: state.statedate != ''
                        ? state.statedate
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
