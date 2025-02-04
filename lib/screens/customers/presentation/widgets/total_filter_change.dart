import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalFilterChange extends StatelessWidget {
  const TotalFilterChange({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<CustomersBloc, CustomersState>(
      builder: (context, state) {
        String? selectedValue = '0';

        return SizedBox(
          height: size.height / 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width / 2.4,
                child: Center(
                  child: RadioListTile<String>(
                    title: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: AppText(
                          text: S.of(context).total,
                          color: AppColor.apptitle,
                          fontSize: 14,
                        )),
                    value: '0',
                    groupValue: state.totalfiter,
                    isThreeLine: false,
                    onChanged: (String? value) {
                      selectedValue = value;
                      context
                          .read<CustomersBloc>()
                          .add(ChangeTotalFilter(totalfilter: selectedValue));
                    },
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 2.4,
                child: RadioListTile<String>(
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AppText(
                      text: S.of(context).detailed,
                      color: AppColor.apptitle,
                      fontSize: 14,
                    ),
                  ),
                  value: '3',
                  groupValue: state.totalfiter,
                  onChanged: (String? value) {
                    selectedValue = value;
                    context
                        .read<CustomersBloc>()
                        .add(ChangeTotalFilter(totalfilter: selectedValue));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
