import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/app_config.dart';

class SettingsBottomSheet extends StatefulWidget {
  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: provider.language == 'en'
            ? bottomSheet(context, 'en')
            : bottomSheet(context, 'ar'));
  }

  Widget bottomSheet(BuildContext context, String language) {
    if (provider.language == 'en') {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changeLang('en');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.english,
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changeLang('ar');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.arabic,
                    style: TextStyle(fontSize: 30),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changeLang('en');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.english,
                    style: TextStyle(fontSize: 30),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                provider.changeLang('ar');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.arabic,
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  ),
                  Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          )
        ],
      );
    }
  }
}
