// ignore_for_file: use_build_context_synchronously
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/customer_component.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/customers_filter.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/app_text.dart';
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
    return BlocListener<FiltersBloc, FiltersState>(
      listenWhen: (previous, current) =>
          previous.agentState != current.agentState,
      listener: (context, state) {
        if (context.read<FiltersBloc>().state.page == 'customers') {
          context.read<CustomersBloc>().add(
                GetCustomers(
                  currency: context.read<FiltersBloc>().state.selectedcurrency,
                  company: context.read<FiltersBloc>().state.selectedcompany,
                  accountType:
                      context.read<FiltersBloc>().state.selectedaccounttype,
                ),
              );
        } else {
          context.read<CustomersBloc>().add(
                GetSuppliers(
                  currency: context.read<FiltersBloc>().state.selectedcurrency,
                  company: context.read<FiltersBloc>().state.selectedcompany,
                  accountType:
                      context.read<FiltersBloc>().state.selectedaccounttype,
                ),
              );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColorBG,
        appBar: AppBar(
          backgroundColor: AppColor.appbuleBG,
          title: AppText(text: title, color: AppColor.whiteColor, fontSize: 18),
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
                            child: AppText(
                              text: S.of(context).advancedsearch,
                              color: AppColor.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SvgPicture.asset("assets/svg/sliders.svg")
                        ],
                      ),
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
                              AppText(
                                  text: S.of(context).search,
                                  color: AppColor.whiteColor,
                                  fontSize: 16),
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
                  name: controller.text.trim(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
