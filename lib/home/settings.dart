import 'package:flutter/material.dart';
import 'package:news_project/home/localization_bottomsheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.settings,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              openSettingsBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.english,
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void openSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SettingsBottomSheet();
      },
    );
  }
}
