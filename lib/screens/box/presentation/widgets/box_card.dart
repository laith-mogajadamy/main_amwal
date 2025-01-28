import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/model/box/box.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/box_statment_page.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/orange16text.dart';
import 'package:mainamwal/widgets/font/orange_16_money_text.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    super.key,
    required this.box,
  });

  final Box box;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Container(
          decoration: boxdecoration2(),
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: (state.language == 'ar')
                          ? Black16text(
                              text:
                                  "${box.code} / ${box.name} - ${box.companyName}")
                          : Black16text(
                              text:
                                  "${box.code} / ${box.companyName} - ${box.name}"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('assets/svg/coins-orange.svg'),
                        SizedBox(
                          width: 5.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Orange16Moneytext(text: box.closeBalance),
                            SizedBox(
                              width: 5.w,
                            ),
                            Orange16text(text: box.currencyCode),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context.read<BoxBloc>().add(
                          GetDefDates(
                            guid: box.guid,
                          ),
                        );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BoxStatmentPage(
                          box: box,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.appbuleBG,
                    size: 20.r,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
