import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/routes/home_page.dart';
import 'package:github_client_app/routes/language.dart';
import 'package:github_client_app/routes/login.dart';
import 'package:github_client_app/routes/theme_change.dart';
import 'package:github_client_app/states/profile_change_notifier.dart';
import 'common/global.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/localization_intl.dart';


void main() async {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => LocaleModel()),
      ],
       child: Consumer2<ThemeModel, LocaleModel>(
         builder: (BuildContext context, themeModel, localeModel, child) {
           return MaterialApp(
             theme: ThemeData(

               primarySwatch: getaterialColor(themeModel!.theme),
             ),
             onGenerateTitle: (context) {
               return GmLocalizations.of(context)?.title ?? "";
             },
             home: const HomeRoute(),
             locale: localeModel.getLocale(),
             supportedLocales: [
               const Locale('en', 'US'),
               const Locale('zh', 'CN'),
             ],
             localizationsDelegates: [
               // 本地化的代理类
               GlobalMaterialLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
               GmLocalizationsDelegate()
             ],
             localeResolutionCallback: (_locale ,supportedLocales) {
               if (localeModel.getLocale() != null) {
                 return localeModel.getLocale();
               } else {
                 //跟随系统
                 Locale? locale;
                 if (supportedLocales.contains(_locale)) {
                   locale = _locale;
                 } else {
                   //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                   locale = const Locale('en', 'US');
                 }
                 return locale;
               }
             },
             // 注册路由
             routes: <String, WidgetBuilder> {
               "login": (context) => const LoginRoute(),
               "themes": (context) => const ThemeChangeRoute(),
               "language": (context) => const LanguageRoute(),
             },
           );
         },
       ),
    );
  }

  MaterialColor getaterialColor(ColorSwatch themeModel) {
    return MaterialColor(themeModel.value, <int, Color>{
      50: themeModel[50]!,
      100: themeModel[100]!,
      200: themeModel[200]!,
      300: themeModel[300]!,
      400: themeModel[400]!,
      500: themeModel[500]!,
      600: themeModel[600]!,
      700: themeModel[700]!,
      800: themeModel[800]!,
      900: themeModel[900]!,
    });
  }
}

