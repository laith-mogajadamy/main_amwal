import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/boxs_page.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/customer_page.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/purchases_and_sales_page.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/black18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List griddata = [
      [
        S.of(context).customers,
        "assets/svg/person orange svg.svg",
        () {
          context.read<FiltesBloc>().add(ClearCustomerAndSupliersFilters());
          context.read<FiltesBloc>().add(PageChanged(page: 'customers'));

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(
                event: GetCustomers(),
                title: S.of(context).customers,
              ),
            ),
          );
        }
      ],
      [
        S.of(context).suppliers,
        "assets/svg/splayers orange svg.svg",
        () {
          context.read<FiltesBloc>().add(ClearCustomerAndSupliersFilters());
          context.read<FiltesBloc>().add(PageChanged(page: 'suppliers'));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(
                event: GetSuppliers(),
                title: S.of(context).suppliers,
              ),
            ),
          );
        }
      ],
      [
        S.of(context).purchases,
        "assets/svg/cart orange svg.svg",
        () {
          context.read<FiltesBloc>().add(PageChanged(page: 'pay'));
          context
              .read<FiltesBloc>()
              .add(ClearPurchasesAndSalesFilters(tybe: 'pay'));
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PurchasesAndSalesPage(
                title: S.of(context).purchases,
              ),
            ),
          );
        }
      ],
      [
        S.of(context).sales,
        "assets/svg/sales orange svg.svg",
        () async {
          context.read<FiltesBloc>().add(PageChanged(page: 'sale'));
          context
              .read<FiltesBloc>()
              .add(ClearPurchasesAndSalesFilters(tybe: 'sale'));

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PurchasesAndSalesPage(
                title: S.of(context).sales,
              ),
            ),
          );
        }
      ],
      [S.of(context).warehouse, "assets/svg/warehouse orange svg.svg", () {}],
      [S.of(context).generalanalysis, "assets/svg/chart orange svg.svg", () {}],
      [S.of(context).humanresources, "assets/svg/HR orange svg.svg", () {}],
      [
        S.of(context).fundsandbanks,
        "assets/svg/fundes orange svg.svg",
        () {
          context.read<BoxBloc>().add(GetBoxs());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BoxsPage(
                title: S.of(context).fundsandbanks,
              ),
            ),
          );
        }
      ],
    ];

    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height / 4,
                color: AppColor.appbuleBG,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 10, right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    Black18text(text: S.of(context).fastaccess),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                  ),
                  itemCount: griddata.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: griddata[index][2],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 10.h, right: 20.w, left: 20.w),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: AppColor.black.withOpacity(0.1),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Black16text(
                                    text: griddata[index][0],
                                  ),
                                ),
                                SvgPicture.asset(
                                  fit: BoxFit.scaleDown,
                                  griddata[index][1],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            top: size.height / 8,
            left: size.width / 18,
            child: Container(
              height: size.height / 5,
              width: size.width / 1.11,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: AppColor.black.withOpacity(0.25),
                    blurRadius: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
