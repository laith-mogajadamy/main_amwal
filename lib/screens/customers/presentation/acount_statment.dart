import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/enter/currency.dart';
import 'package:mainamwal/model/customers_and_suppliers/customer.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/acount_statment_component.dart';
import 'package:mainamwal/screens/customers/presentation/agent_card_component.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/acount_statment_bottom_sheet.dart';
import 'package:mainamwal/welcome/controller/enter_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/acount_statment_toggle.dart';
import 'package:mainamwal/widgets/font/orange18text%20.dart';
import 'package:mainamwal/widgets/font/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcountStatment extends StatefulWidget {
  const AcountStatment({
    super.key,
    required this.customer,
  });
  final Customer customer;

  @override
  State<AcountStatment> createState() => _AcountStatmentState();
}

class _AcountStatmentState extends State<AcountStatment> {
  @override
  Widget build(BuildContext context) {
    List<Currency> currencys = context.read<EnterBloc>().state.currencys;
    Currency currencyname = currencys
        .firstWhere((name) => name.guid == widget.customer.dealingCurrencyGuid);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      appBar: AppBar(
        backgroundColor: AppColor.appbuleBG,
        title: White18text(
          text: S.of(context).acountstatment,
        ),
        actions: [
          BlocBuilder<CustomersBloc, CustomersState>(
            builder: (context, state) {
              return (!state.acountstatmentpage)
                  ? BlocBuilder<EnterBloc, EnterState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            if (state.page == "customers") {
                              context.read<CustomersBloc>().add(
                                  GetAgentCardCustomer(
                                      guid: widget.customer.guid));
                            }
                            if (state.page == "suppliers") {
                              context.read<CustomersBloc>().add(
                                  GetAgentCardSupplier(
                                      guid: widget.customer.guid));
                            }
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: AppColor.whiteColor,
                            size: 25,
                          ),
                        );
                      },
                    )
                  : SizedBox.shrink();
            },
          ),
          BlocBuilder<CustomersBloc, CustomersState>(
            builder: (context, state) {
              return (state.acountstatmentpage)
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ElevatedButton(
                        onPressed: () {
                          context
                              .read<CustomersBloc>()
                              .add(GetStatmentOpeningBalance(
                                guid: widget.customer.guid,
                                tybe: state.totalfiter,
                                fromDate: state.fromdate,
                                toDate: state.todate,
                              ));
                          context
                              .read<CustomersBloc>()
                              .add(GetStatmentCreditDebitSum(
                                guid: widget.customer.guid,
                                tybe: state.totalfiter,
                                fromDate: state.fromdate,
                                toDate: state.todate,
                              ));
                          print(state.totalfiter);
                          context.read<CustomersBloc>().add(GetStatment(
                                guid: widget.customer.guid,
                                tybe: state.totalfiter,
                                fromDate: state.fromdate,
                                toDate: state.todate,
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(size.width / 3, size.height / 20),
                          backgroundColor: AppColor.apporange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            White18text(text: S.of(context).show),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.search,
                              color: AppColor.whiteColor,
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
      bottomSheet: BlocBuilder<CustomersBloc, CustomersState>(
        builder: (context, state) {
          return (state.acountstatmentpage)
              ? const AcountStatmentBottomSheet()
              : const SizedBox.shrink();
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Orange18text(
              text: "${widget.customer.name} (${currencyname.code})",
            ),
            SizedBox(
              height: 10.h,
              width: size.width,
            ),
            AcountStatmentToggle(),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<CustomersBloc, CustomersState>(
              builder: (context, state) {
                return (state.acountstatmentpage)
                    ? Expanded(
                        child: AcountStatmentComponent(
                          customer: widget.customer,
                        ),
                      )
                    : const Expanded(
                        child: AgentCardComponent(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
