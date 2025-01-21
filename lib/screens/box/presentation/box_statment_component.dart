import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/box_statment_grid_component.dart';
import 'package:mainamwal/screens/box/presentation/widgets/box_from_to_date_pick.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/black_14_money_text.dart';
import 'package:mainamwal/widgets/font/blue14text.dart';

class BoxStatmentComponent extends StatelessWidget {
  final Box box;
  const BoxStatmentComponent({
    super.key,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            const BoxFromToDatePick(),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<BoxBloc, BoxState>(
              builder: (context, state) {
                return Container(
                  decoration: boxdecoration1(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Blue14text(text: " ${S.of(context).openningbalance} :"),
                        (state.statmentOpeningBalance != '')
                            ? Expanded(
                                child: Black14Moneytext(
                                    text: state.statmentOpeningBalance),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            BoxStatmentGridComponent(
              size: size,
              box: box,
            ),
          ],
        ),
      ),
    );
  }
}
