import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';
import 'package:mainamwal/core/utils/appcolors.dart';
import 'package:mainamwal/core/utils/prefrences.dart';
import 'package:mainamwal/core/utils/user_hive.dart';
import 'package:mainamwal/generated/l10n.dart';
import 'package:mainamwal/screens/box/controller/box_bloc.dart';
import 'package:mainamwal/screens/customers/controller/customers_bloc.dart';
import 'package:mainamwal/screens/enter/controller/enter_bloc.dart';
import 'package:mainamwal/screens/enter/presentation/OnBoarding/splash.dart';
import 'package:mainamwal/screens/filters/controller/filters_bloc.dart';
import 'package:mainamwal/screens/general_analysis/controller/general_analysis_bloc.dart';
import 'package:mainamwal/screens/purchases_and_sales/controller/purchases_and_sales_bloc.dart';
import 'package:mainamwal/screens/warehouses/controller/warehouses_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  final appDocumentDirectory = await getTemporaryDirectory();
  Hive.init(appDocumentDirectory.path);
  final userRepository = UserRepository();
  await userRepository.init(); // Initialize Hive storage
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
          create: (context) => EnterBloc()
            ..add(Getuser())
            ..add(LanguageChanged(language: language)),
        ),
        BlocProvider<CustomersBloc>(
          create: (context) => CustomersBloc(),
        ),
        BlocProvider<BoxBloc>(
          create: (context) => BoxBloc(),
        ),
        BlocProvider<FiltersBloc>(
          create: (context) => FiltersBloc(),
        ),
        BlocProvider<PurchasesAndSalesBloc>(
          create: (context) => PurchasesAndSalesBloc(),
        ),
        BlocProvider<WarehousesBloc>(
          create: (context) => WarehousesBloc(),
        ),
        BlocProvider<GeneralAnalysisBloc>(
          create: (context) => GeneralAnalysisBloc(),
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
                  state.language,
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'Main Amwal',
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
