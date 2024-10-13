import 'package:islami_application/modules/hadeeth/hadeeth_detail.dart';
import 'package:islami_application/modules/quran/sura_content.dart';
import 'package:islami_application/modules/splash/splash_screen.dart';
import 'package:islami_application/shared/utils/app_theme.dart';
import 'package:islami_application/shared/utils/cashe_helper.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  bool isDark = CasheHelper.getBoolean(key: 'isDark') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
      child: MyApp(isDark),
    ),
  );
}


class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: Locale(Provider.of<ThemeProvider>(context).localCode),
      themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadeethDetail.routeName: (_) => HadeethDetail(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
