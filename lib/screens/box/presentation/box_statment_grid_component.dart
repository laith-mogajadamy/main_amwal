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

class BoxStatmentGridComponent extends StatelessWidget {
  const BoxStatmentGridComponent({
    super.key,
    required this.size,
    required this.box,
  });

  final Size size;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxBloc, BoxState>(
      builder: (context, state) {
        switch (state.boxStatmentState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 3,
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
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                        text: S.of(context).debtor,
                        color: AppColor.apptitle,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      child: AppText(
                        text: S.of(context).creditor,
                        color: AppColor.apptitle,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 1.8,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: state.boxStatment.length,
                    itemBuilder: (context, index) {
                      BoxStatment boxStatment = state.boxStatment[index];
                      return BoxStatmentCard(
                        size: size,
                        boxstatment: boxStatment,
                        box: box,
                      );
                    },
                  ),
                )
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
