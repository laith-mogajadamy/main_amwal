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
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:mainamwal/widgets/font/money_text.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({
    super.key,
    required this.box,
  });

  final Box box;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
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
          child: Container(
            decoration: boxdecoration2(),
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/safebox-svgrepo-com.svg',
                    color: AppColor.apporange,
                    height: size.height / 14,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: (state.language == 'ar')
                        ? AppText(
                            text: "${box.code} / ${box.name}",
                            color: AppColor.apptitle,
                            fontSize: 16,
                          )
                        : AppText(
                            text: "${box.code} / ${box.name}",
                            color: AppColor.apptitle,
                            fontSize: 16,
                          ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  MoneyText(
                    text: box.closeBalance,
                    color: AppColor.appbuleBG,
                    fontSize: 16,
                    disimalnumber: 3,
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/coins-orange.svg'),
                      SizedBox(
                        width: 5.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            text: box.currencyCode,
                            color: AppColor.orangefont,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
