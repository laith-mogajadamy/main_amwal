import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/model/customers_and_suppliers/statment_detailed.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/detailed_statment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class DetailedStatmentComponent extends StatefulWidget {
  const DetailedStatmentComponent({
    super.key,
    required this.size,
    required this.customer,
  });

  final Size size;
  final Customer customer;

  @override
  State<DetailedStatmentComponent> createState() =>
      _DetailedStatmentComponentState();
}

class _DetailedStatmentComponentState extends State<DetailedStatmentComponent> {
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
              tybe: '3',
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
        switch (state.statmentDetailedState) {
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
                SizedBox(
                  height: widget.size.height / 2.1,
                  child: ListView.builder(
                    shrinkWrap: false,
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.statmentDetailed.length,
                    itemBuilder: (context, index) {
                      StatmentDetailed statmentDetailed =
                          state.statmentDetailed[index];
                      return DetailedStatmentCard(
                          statmentDetailed: statmentDetailed,
                          size: widget.size);
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
                  text: state.statmentDetailedMessage,
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
