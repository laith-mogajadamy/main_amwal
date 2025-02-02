import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/white16text.dart';
import 'package:mainamwal/screens/filters/presentation/select_accont_type.dart';
import 'package:mainamwal/screens/filters/presentation/select_agent.dart';
import 'package:mainamwal/screens/filters/presentation/select_city.dart';
import 'package:mainamwal/screens/filters/presentation/select_company.dart';
import 'package:mainamwal/screens/filters/presentation/select_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/appcolors.dart';

class CustomersFilters extends StatelessWidget {
  const CustomersFilters({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColorBG,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppColor.black.withOpacity(0.5),
            blurRadius: 50,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 3.h,
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            decoration: BoxDecoration(
              color: AppColor.apptitle,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Blue16text(text: S.of(context).advancedsearch),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(
                    "assets/svg/sliders.svg",
                    // ignore: deprecated_member_use
                    color: AppColor.appblueGray,
                  )
                ],
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColor.whiteColorBG,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20.r),
              //       side: BorderSide(color: AppColor.appbuleBG, width: 2),
              //     ),
              //   ),
              //   onPressed: () {
              //     context.read<EnterBloc>().add(ClearFilters());
              //   },
              //   child: Blue16text(
              //     text: S.of(context).clearall,
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SelectCurrency(),
              SelectCompany(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SelectAgent(),
              SelectAccontType(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Selectcity(),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocBuilder<FiltersBloc, FiltersState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (state.page == 'customers') {
                    context.read<CustomersBloc>().add(
                          GetCustomers(
                            name: controller.text.trim(),
                            currency: state.selectedcurrency,
                            company: state.selectedcompany,
                            accountType: state.selectedaccounttype,
                            agent: state.selectedagent,
                            city: state.selectedcity,
                          ),
                        );
                  } else {
                    context.read<CustomersBloc>().add(
                          GetSuppliers(
                            name: controller.text.trim(),
                            currency: state.selectedcurrency,
                            company: state.selectedcompany,
                            accountType: state.selectedaccounttype,
                            agent: state.selectedagent,
                            city: state.selectedcity,
                          ),
                        );
                  }

                  Navigator.pop(context);
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width / 1.1, size.height / 18),
                  backgroundColor: AppColor.appblueGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: White16text(text: S.of(context).search)),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.search,
                      color: AppColor.whiteColor,
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
