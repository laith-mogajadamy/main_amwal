import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class ChangeTheLaguague extends StatelessWidget {
  const ChangeTheLaguague({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterBloc, EnterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: S.of(context).language,
              color: AppColor.apptitle,
              fontSize: 16,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(20.r),
                alignment: AlignmentDirectional.bottomCenter,
                dropdownColor: AppColor.whiteColorBG,
                items: [
                  DropdownMenuItem(
                    value: 'العربية',
                    child: AppText(
                      text: 'العربية',
                      color: AppColor.appbuleBG,
                      fontSize: 14,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'English',
                    child: AppText(
                      text: 'English',
                      color: AppColor.appbuleBG,
                      fontSize: 14,
                    ),
                  ),
                ],
                onChanged: (value) => context.read<EnterBloc>().add(
                      LanguageChanged(
                          language: (value == 'English') ? 'en' : 'ar'),
                    ),
                value: (state.language == "ar") ? 'العربية' : 'English',
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColor.appbuleBG,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
