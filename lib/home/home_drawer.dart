import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
static const int settings=1;
static const int categories=2;
  Function onDrawerItemClick;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.225,
              width: double.infinity,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                  AppLocalizations.of(context)!.news_App,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
           onDrawerItemClick(HomeDrawer.categories );
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.black,
                  size: 35,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
           onDrawerItemClick(HomeDrawer.settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 35,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
