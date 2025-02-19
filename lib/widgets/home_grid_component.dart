import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/box/presentation/boxs_page.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/customer_page.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/screens/general_analysis/presentation/general_analysis_page.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/presentation/purchases_and_sales_page.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:mainamwal/screens/warehouses/presentation/warehous_page.dart';
import 'package:mainamwal/widgets/font/app_text.dart';

class HomeGridComponent extends StatelessWidget {
  const HomeGridComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List griddata = [
      [
        S.of(context).customers,
        "assets/svg/person orange svg.svg",
        () {
          context.read<FiltersBloc>().add(PageChanged(page: 'customers'));
          context.read<FiltersBloc>().add(ClearCustomerAndSupliersFilters());
          context.read<CustomersBloc>().add(ClearCustomers());

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
          context.read<FiltersBloc>().add(PageChanged(page: 'suppliers'));
          context.read<FiltersBloc>().add(ClearCustomerAndSupliersFilters());
          context.read<CustomersBloc>().add(ClearCustomers());
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
          context.read<FiltersBloc>().add(PageChanged(page: 'pay'));
          context
              .read<FiltersBloc>()
              .add(ClearPurchasesAndSalesFilters(tybe: 'pay'));
          context.read<PurchasesAndSalesBloc>().add(ClearDailyPruchasAndSale());
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
          context.read<FiltersBloc>().add(PageChanged(page: 'sale'));
          context
              .read<FiltersBloc>()
              .add(ClearPurchasesAndSalesFilters(tybe: 'sale'));
          context.read<PurchasesAndSalesBloc>().add(ClearDailyPruchasAndSale());

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PurchasesAndSalesPage(
                title: S.of(context).sales,
              ),
            ),
          );
        }
      ],
      [
        S.of(context).warehouse,
        "assets/svg/warehouse orange svg.svg",
        () {
          context.read<WarehousesBloc>().add(GetWarehouseCompanys());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WarehousPage(),
            ),
          );
        }
      ],
      [
        S.of(context).generalanalysis,
        "assets/svg/chart orange svg.svg",
        () {
          context.read<GeneralAnalysisBloc>().add(ClearGeneralAnalysis());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GeneralAnalysisPage(
                title: S.of(context).generalanalysis,
              ),
            ),
          );
        }
      ],
      [S.of(context).humanresources, "assets/svg/HR orange svg.svg", () {}],
      [
        S.of(context).fundsandbanks,
        "assets/svg/fundes orange svg.svg",
        () {
          context.read<BoxBloc>().add(GetBoxsCompanys());
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

    return GridView.builder(
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
                      child: AppText(
                        text: griddata[index][0],
                        color: AppColor.apptitle,
                        fontSize: 16,
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
    );
  }
}
