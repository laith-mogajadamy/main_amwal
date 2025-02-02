import 'package:google_fonts/google_fonts.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/filters/customers_filter.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/font/black14text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/blue14text.dart';

class SelectCustomerFilter extends StatelessWidget {
  const SelectCustomerFilter({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Black16text(
              text: "${S.of(context).customers}: ",
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 5.h),
              child: Container(
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
                child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            backgroundColor: AppColor.whiteColor,
                            elevation: 5,
                            title: Column(
                              children: [
                                Black16text(text: S.of(context).customers),
                                SizedBox(
                                  height: 5.h,
                                ),
                                BlocBuilder<FiltersBloc, FiltersState>(
                                  builder: (context, state) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          // boxShadow: [
                                          //   BoxShadow(
                                          //     blurRadius: 1.r,
                                          //     // ignore: deprecated_member_use
                                          //     color: AppColor.black.withOpacity(0.1),
                                          //   ),
                                          // ],
                                          ),
                                      child: TextFormField(
                                        controller: controller,
                                        style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          color: AppColor.apptitle,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.none,
                                        ),
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              context.read<FiltersBloc>().add(
                                                    GetCustomersFilter(
                                                        tybe: state.page,
                                                        name: controller.text,
                                                        search: true),
                                                  );
                                            },
                                            child: Icon(
                                              Icons.check_circle_rounded,
                                              color: Colors.green,
                                              size: 25.r,
                                            ),
                                          ),
                                          filled: true,
                                          hintText: S.of(context).name,
                                          hintStyle: GoogleFonts.cairo(
                                            fontSize: 14.sp,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          fillColor: AppColor.whiteColor,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColor.appblueGray,
                                              width: 1.w,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColor.appblueGray,
                                              width: 1.w,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                        ),
                                        onTapOutside: (event) {
                                          context.read<FiltersBloc>().add(
                                                GetCustomersFilter(
                                                    tybe: state.page,
                                                    name: controller.text,
                                                    search: true),
                                              );
                                        },
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                            content: BlocBuilder<FiltersBloc, FiltersState>(
                              builder: (context, state) {
                                return ListView.builder(
                                  itemCount: state.customersFilter.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    CustomersFilter customer =
                                        state.customersFilter[index];
                                    return InkWell(
                                      onTap: () {
                                        context.read<FiltersBloc>().add(
                                            CustomersFilterChanged(
                                                customer: customer));
                                        Navigator.pop(context);
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 10.h),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: AppColor.apporange,
                                                size: 30.r,
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Black14text(
                                                      text: customer.name),
                                                  Blue14text(
                                                      text: customer.code),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Black14text(
                      text: (state.selectedcustomer ==
                              CustomersFilter(guid: '', code: '', name: ''))
                          ? S.of(context).customers
                          : state.selectedcustomer.name,
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
