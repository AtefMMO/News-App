import 'package:flutter/material.dart';
import 'package:news_project/category/category_details.dart';
import 'package:news_project/category/category_fragment.dart';
import 'package:news_project/category/main_screen.dart';
import 'package:news_project/home/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../category/category.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String RouteName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedDrawerItem==HomeDrawer.settings? AppLocalizations.of(context)!.settings:
              selectedCategory == null ?  AppLocalizations.of(context)!.news_App : selectedCategory!.title!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(
          child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
        ),
        body: selectedDrawerItem == HomeDrawer.settings
            ? SettingsTap()
            : selectedCategory == null
                ? CategoryFragment(onCategoryClick: onCategoryClick)
                : MainNews(categories: selectedCategory!));
  }

  Categories? selectedCategory;

  void onCategoryClick(Categories categories) {
    selectedCategory = categories;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;
  void onDrawerItemClick(int newDrawerItem) {
    selectedCategory = null;
    selectedDrawerItem = newDrawerItem;

    Navigator.pop(context);
    setState(() {});
  }
}
