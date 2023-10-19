import 'package:flutter/material.dart';
import 'package:news_project/category/category_details.dart';
import 'package:news_project/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.RouteName: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.RouteName,
    );
  }
}
