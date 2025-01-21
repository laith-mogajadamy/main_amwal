import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/widgets/font/blue18text.dart';
import 'package:mainamwal/widgets/font/blue_16_money_text.dart';
import 'package:mainamwal/widgets/font/orange18text%20.dart';
import 'package:mainamwal/widgets/font/orange_16_money_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxStatmentBottomSheet extends StatelessWidget {
  const BoxStatmentBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<BoxBloc, BoxState>(
      builder: (context, state) {
        return Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(4, 4),
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: Blue18text(text: S.of(context).sum),
                    ),
                    SizedBox(
                      width: size.width / 3.5,
                      child: (state.statmentDebitsum != '')
                          ? Blue16Moneytext(text: state.statmentDebitsum)
                          : SizedBox.shrink(),
                    ),
                    SizedBox(
                        width: size.width / 3.5,
                        child: (state.statmentCreditsum != '')
                            ? Blue16Moneytext(text: state.statmentCreditsum)
                            : SizedBox.shrink()),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width / 3.5,
                      child: Orange18text(text: S.of(context).balance),
                    ),
                    SizedBox(
                        width: size.width / 3.5,
                        child: (state.statmentBalance != '')
                            ? Orange16Moneytext(text: state.statmentBalance)
                            : SizedBox.shrink()),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
