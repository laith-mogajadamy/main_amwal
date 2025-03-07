import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/box_statment_component.dart';
import 'package:mainamwal/screens/box/presentation/widgets/box_statment_bottom_sheet.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxStatmentPage extends StatelessWidget {
  const BoxStatmentPage({
    super.key,
    required this.box,
  });
  final Box box;

  @override
  Widget build(BuildContext context) {
    // List<Currency> currencys = context.read<EnterBloc>().state.currencys;
    // Currency currencyname = currencys
    //     .firstWhere((name) => name.guid == customer.dealingCurrencyGuid);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: AppText(
          text: S.of(context).acountstatment,
          color: AppColor.whiteColor,
          fontSize: 18,
        ),
        actions: [
          BlocBuilder<BoxBloc, BoxState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<BoxBloc>().add(GetBoxOpeningBalance(
                          guid: box.guid,
                          fromDate: state.fromdate,
                          toDate: state.todate,
                          companyGuid: box.companyGuid,
                          isCurrency:
                              (box.differentCurrency == '1') ? true : false,
                        ));
                    context.read<BoxBloc>().add(
                          GetBoxCreditDebitSum(
                            guid: box.guid,
                            fromDate: state.fromdate,
                            toDate: state.todate,
                            companyGuid: box.companyGuid,
                            isCurrency:
                                (box.differentCurrency == '1') ? true : false,
                          ),
                        );
                    context.read<BoxBloc>().add(GetBoxStatment(
                          guid: box.guid,
                          fromDate: state.fromdate,
                          toDate: state.todate,
                          companyGuid: box.companyGuid,
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width / 2.8, size.height / 20),
                    backgroundColor: AppColor.apporange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: S.of(context).show,
                        color: AppColor.whiteColor,
                        fontSize: 18,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(
                        Icons.search,
                        color: AppColor.whiteColor,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomSheet: BoxStatmentBottomSheet(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "${box.name} (${box.currencyCode})",
              color: AppColor.apporange,
              fontSize: 18,
            ),
            SizedBox(
              height: 10.h,
              width: size.width,
            ),
            Expanded(
              child: BoxStatmentComponent(
                box: box,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
