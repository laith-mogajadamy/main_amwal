import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/transport_companies.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTransportCompanies extends StatelessWidget {
  const SelectTransportCompanies({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FiltesBloc, FiltersState>(
      builder: (context, state) {
        List<DropdownMenuItem<TransportCompanies>> transportCompaniestlist = [];
        for (var i = 0; i < state.transportCompanies.length; i++) {
          transportCompaniestlist.add(
            DropdownMenuItem(
              value: state.transportCompanies[i],
              child: FittedBox(
                  child: Black14text(text: state.transportCompanies[i].name)),
            ),
          );
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
                // ignore: deprecated_member_use
                color: AppColor.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: DropdownButton<TransportCompanies>(
              underline: const SizedBox.shrink(),
              icon: const Icon(Icons.keyboard_arrow_down),
              alignment: AlignmentDirectional.centerStart,
              iconSize: 30.r,
              isExpanded: true,
              dropdownColor: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20.r),
              hint: Black14text(text: S.of(context).transportationcompany),
              items: transportCompaniestlist,
              value: (state.selectedtransportCompanie ==
                      TransportCompanies(guid: '', code: '', name: ''))
                  ? null
                  : state.selectedtransportCompanie,
              onChanged: (value) {
                context.read<FiltesBloc>().add(
                      TransportCompaniesChanged(
                        transportCompanie: value,
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
