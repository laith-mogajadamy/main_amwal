import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/splash.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

String getSystemLanguage() {
  findSystemLocale();
  return Intl.systemLocale.split('_')[0];
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    String language = getSystemLanguage();

    return MultiBlocProvider(
      providers: [
        BlocProvider<EnterBloc>(
          create: (context) => EnterBloc()..add(Getuser()),
        ),
        BlocProvider<CustomersBloc>(
          create: (context) => CustomersBloc(),
        ),
        BlocProvider<BoxBloc>(
          create: (context) => BoxBloc(),
        ),
        BlocProvider<FiltesBloc>(
          create: (context) => FiltesBloc(),
        ),
        BlocProvider<PurchasesAndSalesBloc>(
          create: (context) => PurchasesAndSalesBloc(),
        ),
      ],
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(393, 786),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                locale: Locale(
                  language,
                  // 'ar'
                  // state.language,
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'mainamwal',
                theme: ThemeData(
                  cardColor: Colors.white,
                  scaffoldBackgroundColor: AppColor.whiteColorBG,
                  cardTheme: const CardTheme(color: Colors.white),
                  // canvasColor: Colors.transparent,
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.white,
                    // primary: Colors.white,
                    // onPrimary: Colors.white,
                    // onSecondary: Colors.white,
                    onSurface: Colors.white,
                  ),
                  useMaterial3: true,
                ),
                home: const Splash(),
              );
            },
          );
        },
      ),
    );
  }
}
