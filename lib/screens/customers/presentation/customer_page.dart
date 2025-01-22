import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/customer_component.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/customers_filter.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/white16text.dart';
import 'package:mainamwal/widgets/font/white18text.dart';
import 'package:mainamwal/widgets/search_text_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerPage extends StatelessWidget {
  final CustomersEvent event;
  final String title;
  const CustomerPage({super.key, required this.event, required this.title});
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: title,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchTextField(controller: controller),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: true,
                        builder: (BuildContext context) {
                          return CustomersFilters(controller: controller);
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(size.width / 2.2, size.height / 18),
                      backgroundColor: AppColor.appblueGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: White16text(
                                text: S.of(context).advancedsearch)),
                        SizedBox(
                          width: 10.w,
                        ),
                        SvgPicture.asset("assets/svg/sliders.svg")
                      ],
                    ),
                  ),
                  BlocBuilder<FiltesBloc, FiltersState>(
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
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width / 2.2, size.height / 18),
                          backgroundColor: AppColor.apporange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            White16text(text: S.of(context).search),
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
                ],
              ),
            ),
            Expanded(
              child: CustomerComponent(
                event: event,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
