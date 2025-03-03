// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
    String fromselectedDate = ''; // To store the selected date
    String toselectedDate = ''; // To store the selected date
    // DateTime? stateselecteddate;

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
        if (w == "to") {
          toselectedDate = formattedDate;
        }
        if (w == "state") {
          context
              .read<CustomersBloc>()
              .add(ChangeStateDate(statedate: formattedDate));
        }
      }
    }

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    AppText(
                      text: "${S.of(context).from}:",
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                    SizedBox(
                      width: 0.w,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await pickDate(context, 'from', state.fromdate);
                        if (DateTime.parse(fromselectedDate)
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
                          context
                              .read<CustomersBloc>()
                              .add(ChangeFromDate(fromdate: fromselectedDate));
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
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    AppText(
                      text: "${S.of(context).to}:",
                      color: AppColor.apptitle,
                      fontSize: 16,
                    ),
                    SizedBox(
                      width: 0.w,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await pickDate(context, 'to', state.todate);
                        if (DateTime.parse(toselectedDate)
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
                          context
                              .read<CustomersBloc>()
                              .add(ChangeToDate(todate: toselectedDate));
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
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 0.w,
            ),
            SizedBox(
              width: 0.w,
            ),
            Row(
              children: [
                AppText(
                  text: "${S.of(context).stateDate}:",
                  color: AppColor.apptitle,
                  fontSize: 16,
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
