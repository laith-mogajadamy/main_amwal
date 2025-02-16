import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/model/box/box_statment.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/widgets/box_statment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class BoxStatmentGridComponent extends StatefulWidget {
  const BoxStatmentGridComponent({
    super.key,
    required this.size,
    required this.box,
  });

  final Size size;
  final Box box;

  @override
  State<BoxStatmentGridComponent> createState() =>
      _BoxStatmentGridComponentState();
}

class _BoxStatmentGridComponentState extends State<BoxStatmentGridComponent> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      context.read<BoxBloc>().add(
            LoadMoreBoxStatment(
              guid: widget.box.guid,
              companyGuid: widget.box.companyGuid,
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
    return BlocBuilder<BoxBloc, BoxState>(
      builder: (context, state) {
        switch (state.boxStatmentState) {
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
                    SizedBox(
                      width: widget.size.width / 3.5,
                      child: AppText(
                        text: S.of(context).debtor,
                        color: AppColor.apptitle,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: widget.size.width / 3.5,
                      child: AppText(
                        text: S.of(context).creditor,
                        color: AppColor.apptitle,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: widget.size.height / 1.8,
                  child: ListView.builder(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: state.boxStatment.length,
                    itemBuilder: (context, index) {
                      BoxStatment boxStatment = state.boxStatment[index];
                      return BoxStatmentCard(
                        size: widget.size,
                        boxstatment: boxStatment,
                        box: widget.box,
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
                child: Text("no data"),
              ),
            );
        }
      },
    );
  }
}
