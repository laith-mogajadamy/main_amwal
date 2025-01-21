// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mainmainamwal/core/utils/appcolors.dart';
// import 'package:mainmainamwal/core/utils/enums.dart';
// import 'package:mainmainamwal/generated/l10n.dart';
// import 'package:mainmainamwal/model/customers_and_suppliers/customer.dart';
// import 'package:mainmainamwal/model/customers_and_suppliers/statment_total.dart';
// import 'package:mainmainamwal/screens/customers/controller/customers_bloc.dart';
// import 'package:mainmainamwal/screens/customers/presentation/widgets/boxdecoration1.dart';
// import 'package:mainmainamwal/screens/customers/presentation/widgets/from_to_date_pick.dart';
// import 'package:mainmainamwal/screens/customers/presentation/widgets/total_filter_change.dart';
// import 'package:mainmainamwal/widgets/font/black14text.dart';
// import 'package:mainmainamwal/widgets/font/black16text.dart';
// import 'package:mainmainamwal/widgets/font/blue14text.dart';
// import 'package:mainmainamwal/widgets/font/blue_14_money_text.dart';
// import 'package:mainmainamwal/widgets/font/red_14_money_text.dart';

// class AcountStatmentComponent extends StatelessWidget {
//   final Customer customer;
//   const AcountStatmentComponent({
//     super.key,
//     required this.customer,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SizedBox(
//         child: Column(
//           children: [
//             const TotalFilterChange(),
//             SizedBox(
//               height: 5.h,
//             ),
//             const FromToDatePick(),
//             SizedBox(
//               height: 10.h,
//             ),
//             SizedBox(
//               height: 10.h,
//             ),
//             BlocBuilder<CustomersBloc, CustomersState>(
//               builder: (context, state) {
//                 switch (state.statmentTotalState) {
//                   case RequestState.loading:
//                     return SizedBox(
//                       height: size.height / 3,
//                       child: Container(
//                           alignment: Alignment.center,
//                           child: CircularProgressIndicator(
//                             color: AppColor.appblueGray,
//                             strokeWidth: 4.w,
//                           )),
//                     );
//                   case RequestState.loaded:
//                     return Column(
//                       children: [
//                         Container(
//                           decoration: boxdecoration1(),
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 10.h),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 Blue14text(
//                                     text:
//                                         " ${S.of(context).openningbalance} :"),
//                                 const Black14text(text: ""),
//                               ],
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: size.width / 3.5,
//                               child: Row(
//                                 children: [
//                                   Black14text(
//                                     text: "${S.of(context).date}/",
//                                   ),
//                                   Black14text(
//                                     text: S.of(context).document,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: size.width / 3.5,
//                               child: Black14text(
//                                 text: S.of(context).debtor,
//                               ),
//                             ),
//                             SizedBox(
//                               width: size.width / 3.5,
//                               child: Black14text(
//                                 text: S.of(context).creditor,
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: size.height / 3,
//                           child: ListView.builder(
//                             shrinkWrap: false,
//                             itemCount: state.statmentTotal.length,
//                             itemBuilder: (context, index) {
//                               StatmentTotal statmentTotal =
//                                   state.statmentTotal[index];
//                               return Container(
//                                 decoration: boxdecoration1(),
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 5.w, vertical: 5.h),
//                                 margin: EdgeInsets.symmetric(vertical: 5.h),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border(
//                                           left: BorderSide(
//                                             width: 1,
//                                             color: AppColor.apptitle,
//                                           ),
//                                         ),
//                                       ),
//                                       padding: EdgeInsets.only(left: 5.w),
//                                       width: size.width / 3.5,
//                                       child: Column(
//                                         children: [
//                                           FittedBox(
//                                             child: Black14text(
//                                                 text: statmentTotal.docName),
//                                           ),
//                                           SizedBox(
//                                             height: 5.h,
//                                           ),
//                                           Black16text(
//                                               text:
//                                                   statmentTotal.securitiesDate),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: size.width / 3.5,
//                                       child: Center(
//                                         child: Blue14Moneytext(
//                                           text: statmentTotal.debit,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: size.width / 3.5,
//                                       child: Center(
//                                         child: Red14Moneytext(
//                                           text: statmentTotal.credit,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         )
//                       ],
//                     );
//                   case RequestState.error:
//                     return SizedBox(
//                       height: 280.h,
//                       child: Center(
//                         child: Text("no data"),
//                       ),
//                     );
//                 }
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
