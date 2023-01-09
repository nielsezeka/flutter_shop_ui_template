import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/theme_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBloc.initializeData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
        stream: CustomTheme.observerTheme(),
        builder: (context, snapshot) {
          ThemeMode theme = snapshot.data ?? ThemeMode.system;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: theme,
            title: 'Shop template',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: CustomTheme.lightThemeConfig,
            darkTheme: CustomTheme.darkThemeConfig,
            home: const SplashLoadingScreen(),
            onGenerateRoute: (settings) =>
                Routes.buildRoutesWithAnimate(settings),
          );
        });
  }
}
