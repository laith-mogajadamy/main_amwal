import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/company.dart';
import 'package:mainamwal/screens/daily_movment/controller/daily_movment_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDailyMovmentCompany extends StatelessWidget {
  const SelectDailyMovmentCompany({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<DailyMovmentBloc, DailyMovmentState>(
      builder: (context, state) {
        List<DropdownMenuItem<Company>> companyslist = [];
        for (var i = 0; i < state.companys.length; i++) {
          companyslist.add(
            DropdownMenuItem(
              value: state.companys[i],
              child: FittedBox(
                  child: AppText(
                      text: state.companys[i].name,
                      color: AppColor.apptitle,
                      fontSize: 14)),
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Container(
            height: size.height / 22,
            width: size.width / 3.5,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  // ignore: deprecated_member_use
                  color: AppColor.black.withOpacity(0.2),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: DropdownButton<Company>(
                underline: const SizedBox.shrink(),
                icon: const Icon(Icons.keyboard_arrow_down),
                alignment: AlignmentDirectional.centerStart,
                iconSize: 30.r,
                isExpanded: true,
                dropdownColor: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                hint: AppText(
                  text: S.of(context).bransh,
                  color: AppColor.apptitle,
                  fontSize: 14,
                ),
                items: companyslist,
                value: (state.selectedcompany ==
                        const Company(
                            guid: '', code: '', name: '', iddefault: ''))
                    ? null
                    : state.selectedcompany,
                onChanged: (value) {
                  context.read<DailyMovmentBloc>().add(
                        CompanyChanged(
                          company: value,
                        ),
                      );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
