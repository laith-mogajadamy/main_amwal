import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/widgets/font/app_text.dart'; // Import AppText
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AcountStatmentToggle extends StatelessWidget {
  AcountStatmentToggle({
    super.key,
  });
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        return Center(
          child: Container(
            height: size.height / 25,
            decoration: boxdecoration1(),
            child: ToggleButtons(
              isSelected: isSelected,
              constraints: BoxConstraints(
                minWidth: size.width / 2.5,
                minHeight: size.height / 25,
              ),
              onPressed: (int index) {
                for (int i = 0; i < isSelected.length; i++) {
                  isSelected[i] = i == index;
                }
                context.read<CustomersBloc>().add(
                      ChangeAcountStatmentPage(
                        acountstatmentpage: isSelected[1],
                      ),
                    );
              },
              borderWidth: 0,
              // ignore: deprecated_member_use
              selectedColor: AppColor.applightgray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.r),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: AppText(
                    text: S.of(context).agentcard,
                    color: AppColor.appbuleBG,
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: AppText(
                    text: S.of(context).acountstatment,
                    color: AppColor.appbuleBG,
                    fontSize: 16,
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
