import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_total.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/total_statment_card.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalStatmentComponent extends StatefulWidget {
  const TotalStatmentComponent({
    super.key,
    required this.size,
    required this.customer,
  });

  final Size size;
  final Customer customer;

  @override
  State<TotalStatmentComponent> createState() => _TotalStatmentComponentState();
}

class _TotalStatmentComponentState extends State<TotalStatmentComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<CustomersBloc>().add(
            LoadMoreStatment(
              guid: widget.customer.guid,
              tybe: '0',
              perPage: 25,
            ),
          );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        switch (state.statmentTotalState) {
          case RequestState.loading:
            return SizedBox(
              height: widget.size.height / 3,
              child: Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: AppColor.appblueGray,
                    strokeWidth: 4.w,
                  )),
            );
          case RequestState.loaded:
            return Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: widget.size.width / 3.5,
                      child: Row(
                        children: [
                          AppText(
                              text: "  ${S.of(context).date}/",
                              color: AppColor.apptitle,
                              fontSize: 14),
                          AppText(
                              text: S.of(context).document,
                              color: AppColor.apptitle,
                              fontSize: 14),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width / 3.5,
                      child: AppText(
                          text: S.of(context).debtor,
                          color: AppColor.apptitle,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: widget.size.width / 3.5,
                      child: AppText(
                          text: S.of(context).creditor,
                          color: AppColor.apptitle,
                          fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: (state.statmentLoadMoreState == RequestState.loading)
                      ? widget.size.height / 2.8
                      : widget.size.height / 2.5,
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: false,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.statmentTotal.length,
                    itemBuilder: (context, index) {
                      StatmentTotal statmentTotal = state.statmentTotal[index];
                      return TotalStatmentCard(
                          size: widget.size, statmentTotal: statmentTotal);
                    },
                  ),
                ),
                (state.statmentLoadMoreState == RequestState.loading)
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
                  text: state.statmentTotalMessage,
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
