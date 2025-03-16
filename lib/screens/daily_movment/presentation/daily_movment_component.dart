import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/daily_movment/daily_movment.dart';
import 'package:mainamwal/model/purchases_and_sales/daily_pruchas_and_sale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/screens/daily_movment/controller/daily_movment_bloc.dart';
import 'package:mainamwal/screens/daily_movment/presentation/widgets/daily_movment_card.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/widgets/purchases_and_sales_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class DailyMovmentComponent extends StatefulWidget {
  const DailyMovmentComponent({
    super.key,
  });

  @override
  State<DailyMovmentComponent> createState() => _DailyMovmentComponentState();
}

class _DailyMovmentComponentState extends State<DailyMovmentComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<DailyMovmentBloc>().add(LoadMoreDailyMovment());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<DailyMovmentBloc, DailyMovmentState>(
      builder: (context, state) {
        switch (state.dailyMovmentState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 1.5,
              child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: AppColor.appblueGray,
                  strokeWidth: 4.w,
                ),
              ),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: Row(
                        children: [
                          AppText(
                            text: "  ${S.of(context).date}/",
                            color: AppColor.apptitle,
                            fontSize: 14,
                          ),
                          AppText(
                            text: S.of(context).document,
                            color: AppColor.apptitle,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30.w),
                      child: SizedBox(
                        width: size.width / 3.5,
                        child: AppText(
                          text: S.of(context).theamount,
                          color: AppColor.apptitle,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.dailyMovment.length,
                    itemBuilder: (context, index) {
                      DailyMovment dailyMovment = state.dailyMovment[index];
                      return DailyMovmentCard(
                        dailyMovment: dailyMovment,
                        size: size,
                      );
                    },
                  ),
                ),
                (state.loadMoreState == RequestState.loading)
                    ? Container(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: AppColor.appblueGray,
                          strokeWidth: 4.w,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: AppText(
                  text: state.dailyMovmentMessage,
                  color: AppColor.redfont,
                  fontSize: 14,
                ),
              ),
            );
        }
      },
    );
  }
}
