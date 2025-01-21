import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/enter/account_type.dart';

import 'package:mainamwal/welcome/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectAccontType extends StatelessWidget {
  const SelectAccontType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        List<DropdownMenuItem<AccountType>> accounttypelist = [];
        for (var i = 0; i < state.companys.length; i++) {
          if (state.page == "customers") {
            if (state.accounttypes[i].val != '2') {
              accounttypelist.add(
                DropdownMenuItem(
                  value: state.accounttypes[i],
                  child: FittedBox(
                      child: Black14text(text: state.accounttypes[i].name)),
                ),
              );
            }
          }
          if (state.page == "suppliers") {
            if (state.accounttypes[i].val != '1') {
              accounttypelist.add(
                DropdownMenuItem(
                  value: state.accounttypes[i],
                  child: FittedBox(
                      child: Black14text(text: state.accounttypes[i].name)),
                ),
              );
            }
          }
        }
        return Container(
          height: size.height / 22,
          width: size.width / 2.5,
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: AppColor.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: DropdownButton<AccountType>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.centerStart,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black14text(text: S.of(context).acounttybe),
              items: accounttypelist,
              value: (state.selectedaccounttype ==
                      const AccountType(name: '', val: ''))
                  ? null
                  : state.selectedaccounttype,
              onChanged: (value) {
                context.read<EnterBloc>().add(
                      AccountTybeChanged(
                        accounttype: value,
                      ),
                    );
              },
            ),
          ),
        );
      },
    );
  }
}
