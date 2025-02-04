// import 'package:mainamwal/generated/l10n.dart';
// import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
// import 'package:mainamwal/widgets/font/black18text.dart';

// import 'package:mainamwal/widgets/font/black22text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class LanguageChange extends StatelessWidget {
//   const LanguageChange({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Black22text(text: S.of(context).Chooselanguage),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
//           child: BlocBuilder<EnterBloc, EnterState>(
//             builder: (context, state) {
//               return Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.h),
//                     child: GestureDetector(
//                       onTap: () {
//                         Locale currentLocale = Localizations.localeOf(context);
//                         print(currentLocale.languageCode);
//                         if (currentLocale.languageCode == 'en') {
//                           context
//                               .read<EnterBloc>()
//                               .add(LanguageChanged(language: 'ar'));
//                         }
//                       },
//                       child: Card(
//                         child: ListTile(
//                           leading: Image.asset(
//                             "assets/images/united-arab-emirates.png",
//                             height: 40.h,
//                           ),
//                           title: const Black18text(text: "العربية"),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 5.h),
//                     child: GestureDetector(
//                       onTap: () {
//                         Locale currentLocale = Localizations.localeOf(context);
//                         print(currentLocale.languageCode);
//                         if (currentLocale.languageCode == 'ar') {
//                           context
//                               .read<EnterBloc>()
//                               .add(LanguageChanged(language: 'en'));
//                         }
//                       },
//                       child: Card(
//                         child: ListTile(
//                           leading: Image.asset(
//                             "assets/images/united-kingdom.png",
//                             height: 40.h,
//                           ),
//                           title: const Black18text(text: "English"),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
