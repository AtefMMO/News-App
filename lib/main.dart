import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_project/home/home_screen.dart';
import 'package:news_project/home/search_screen.dart';
import 'package:news_project/news/news_details_screen.dart';
import 'package:news_project/providers/app_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>
        AppConfigProvider()
      ,
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.RouteName: (context) => HomeScreen(),
        NewsDetailsScreen.routeName: (context) => NewsDetailsScreen(),
        SearchScreen.routeName: (context) => SearchScreen(),
      },
      initialRoute: HomeScreen.RouteName,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: provider.language == 'en' ? Locale('en') : Locale('ar'),
    );
  }
}
