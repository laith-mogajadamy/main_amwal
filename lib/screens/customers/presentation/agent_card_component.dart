import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/enums.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/model/customers_and_suppliers/agent_card.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/customers/presentation/widgets/aget_card_column.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/widgets/boxdecoration.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/widgets/font/black16text.dart';
import 'package:mainamwal/widgets/font/black_16_money_text.dart';
import 'package:mainamwal/widgets/font/blue16text.dart';
import 'package:mainamwal/widgets/font/orange16text.dart';
import 'package:mainamwal/widgets/font/orange_16_money_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgentCardComponent extends StatelessWidget {
  const AgentCardComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<CustomersBloc, CustomersState>(
        builder: (context, state) {
          switch (state.agentCardState) {
            case RequestState.loading:
              return SizedBox(
                height: size.height / 3,
                child: Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: AppColor.appblueGray,
                      strokeWidth: 4.w,
                    )),
              );
            case RequestState.loaded:
              AgentCard agentCard = state.agentCard;
              List griddate = [
                [S.of(context).sales, agentCard.sales],
                [S.of(context).purchases, agentCard.purchases],
                [S.of(context).purchasesreturns, agentCard.purchasesReturned],
                [S.of(context).salesreturns, agentCard.salesReturned],
                [S.of(context).payments, agentCard.payments],
                [S.of(context).receipts, agentCard.receipts],
                [S.of(context).debitentries, agentCard.debitRestrictions],
                [S.of(context).creditentries, agentCard.creditRestrictions],
              ];
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: boxdecoration1(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Blue16text(
                                    text:
                                        " ${S.of(context).openningbalance} :"),
                                Black16Moneytext(
                                    text: agentCard.openingBalance),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: size.height / 2.4,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.0,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: griddate.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return AgetCardColumn(
                                text1: griddate[index][0],
                                text2: griddate[index][1],
                              );
                            },
                          ),
                        ),
                        Container(
                          decoration: boxdecoration1(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Orange16text(
                                    text: " ${S.of(context).currentBalance} :"),
                                Orange16Moneytext(
                                    text: agentCard.currentBalance),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: boxdecoration1(),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(text: "${S.of(context).city}:  "),
                              Black16text(text: agentCard.city)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(text: "${S.of(context).address}:  "),
                              Black16text(text: agentCard.address)
                            ],
                          ),
                        ),
                        BlocBuilder<FiltesBloc, FiltersState>(
                          builder: (context, state) {
                            return (state.page == "customers")
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: Row(
                                      children: [
                                        Blue16text(
                                            text:
                                                "${S.of(context).thelimitofdebtinasale}:  "),
                                        Black16Moneytext(
                                            text: agentCard.salesDebtLimit)
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: Row(
                                      children: [
                                        Blue16text(
                                            text:
                                                "${S.of(context).thelimitofdebtinabuy}:  "),
                                        Black16Moneytext(
                                            text: agentCard.buyDebtLimit)
                                      ],
                                    ),
                                  );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(text: "${S.of(context).cycleday}:  "),
                              Black16text(text: agentCard.cycleDayName)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(
                                  text: "${S.of(context).salecategoryname}:  "),
                              Black16text(text: agentCard.salePriceCategoryName)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(text: "${S.of(context).workphone}:  "),
                              Black16text(text: agentCard.workPhoneNumber)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(
                                  text: "${S.of(context).mobilenumber}:  "),
                              Black16text(text: agentCard.mobilephonenumber)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Row(
                            children: [
                              Blue16text(text: "${S.of(context).notes}:  "),
                              Black16text(text: agentCard.notes)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text("no data"),
                ),
              );
          }
        },
      ),
    );
  }
}
