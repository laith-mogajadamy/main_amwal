// ignore_for_file: use_build_context_synchronously

import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/widgets/font/black12text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/white16text.dart';

class PurchasesAndSalesDatePick extends StatelessWidget {
  const PurchasesAndSalesDatePick({
    super.key,
    required this.scaffoldkey,
  });
  final GlobalKey<ScaffoldState> scaffoldkey;

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
          context.read<PurchasesAndSalesBloc>().add(DueDateChanged(
              duedate:
                  '${stateselecteddate!.year.toString()}-${stateselecteddate!.month.toString().padLeft(2, '0')}-${stateselecteddate!.day.toString().padLeft(2, '0')}'));
        }
      }
    }

    return BlocBuilder<PurchasesAndSalesBloc, PurchasesAndSalesState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Black12text(text: "${S.of(context).from}:"),
                    SizedBox(
                      width: 0.w,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await pickDate(context, 'from', state.fromDate);

                        if (state.toDate != '') {
                          if (isSameDay(fromselectedDate!,
                              DateTime.parse(state.toDate))) {
                            print('same');
                            print(fromselectedDate);
                            print(DateTime.parse(state.toDate));
                            context.read<PurchasesAndSalesBloc>().add(
                                FromDateChanged(
                                    fromdate:
                                        '${fromselectedDate!.year.toString()}-${fromselectedDate!.month.toString().padLeft(2, '0')}-${fromselectedDate!.day.toString().padLeft(2, '0')}'));
                          }
                          if (fromselectedDate!
                              .isAfter(DateTime.parse(state.toDate))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: White16text(
                                  text: S.of(context).unvalidedate,
                                ),
                              ),
                            );
                          } else {
                            context.read<PurchasesAndSalesBloc>().add(
                                FromDateChanged(
                                    fromdate:
                                        '${fromselectedDate!.year.toString()}-${fromselectedDate!.month.toString().padLeft(2, '0')}-${fromselectedDate!.day.toString().padLeft(2, '0')}'));
                          }
                        } else {
                          context.read<PurchasesAndSalesBloc>().add(FromDateChanged(
                              fromdate:
                                  '${fromselectedDate!.year.toString()}-${fromselectedDate!.month.toString().padLeft(2, '0')}-${fromselectedDate!.day.toString().padLeft(2, '0')}'));
                        }
                        fromselectedDate = null;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.whiteColor,
                          padding: const EdgeInsets.all(10),
                          shape: const StadiumBorder()),
                      child: Black12text(
                        text: state.fromDate != ''
                            ? state.fromDate
                            : S.of(context).nodate,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Row(
                  children: [
                    Black12text(text: "${S.of(context).to}:"),
                    SizedBox(
                      width: 0.w,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await pickDate(context, 'to', state.toDate);
                        if (state.fromDate != '') {
                          if (isSameDay(toselectedDate!,
                              DateTime.parse(state.fromDate))) {
                            print('same');
                            print(toselectedDate);
                            print(DateTime.parse(state.fromDate));
                            context.read<PurchasesAndSalesBloc>().add(ToDateChanged(
                                todate:
                                    '${toselectedDate!.year.toString()}-${toselectedDate!.month.toString().padLeft(2, '0')}-${toselectedDate!.day.toString().padLeft(2, '0')}'));
                          }
                          if (toselectedDate!
                              .isBefore(DateTime.parse(state.fromDate))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: White16text(
                                  text: S.of(context).unvalidedate,
                                ),
                              ),
                            );
                          } else {
                            context.read<PurchasesAndSalesBloc>().add(ToDateChanged(
                                todate:
                                    '${toselectedDate!.year.toString()}-${toselectedDate!.month.toString().padLeft(2, '0')}-${toselectedDate!.day.toString().padLeft(2, '0')}'));
                          }
                        } else {
                          context.read<PurchasesAndSalesBloc>().add(ToDateChanged(
                              todate:
                                  '${toselectedDate!.year.toString()}-${toselectedDate!.month.toString().padLeft(2, '0')}-${toselectedDate!.day.toString().padLeft(2, '0')}'));
                        }
                        toselectedDate = null;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.whiteColor,
                          padding: const EdgeInsets.all(10),
                          shape: const StadiumBorder()),
                      child: Black12text(
                        text: state.toDate != ''
                            ? state.toDate
                            : S.of(context).nodate,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<PurchasesAndSalesBloc>()
                          .add(FromDateChanged(fromdate: ''));
                      context
                          .read<PurchasesAndSalesBloc>()
                          .add(ToDateChanged(todate: ''));
                    },
                    icon: Icon(
                      Icons.delete, // Trash icon
                      color: Colors.white,
                      size: 20.r,
                    ),
                    padding:
                        EdgeInsets.all(0), // Adjust padding to make it circular
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 0.w,
            ),
            BlocBuilder<FiltersBloc, FiltersState>(
              builder: (context, state) {
                return (state.selectedDocumentsCategorie.code == '23' ||
                        state.selectedDocumentsCategorie.code == '33')
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          Black12text(text: "${S.of(context).duedate}:"),
                          SizedBox(
                            width: 0.w,
                          ),
                          ElevatedButton(
                            onPressed: () =>
                                pickDate(context, 'state', state.dueDate),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.whiteColor,
                                padding: const EdgeInsets.all(10),
                                shape: const StadiumBorder()),
                            child: Black12text(
                              text: state.dueDate != ''
                                  ? state.dueDate
                                  : S.of(context).nodate,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<PurchasesAndSalesBloc>()
                                    .add(DueDateChanged(duedate: ''));
                              },
                              icon: Icon(
                                Icons.delete, // Trash icon
                                color: Colors.white,
                                size: 20.r,
                              ),
                              padding: EdgeInsets.all(
                                  0), // Adjust padding to make it circular
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        );
      },
    );
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
