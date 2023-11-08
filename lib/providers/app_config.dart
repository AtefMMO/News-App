import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String language = 'en';
  changeLang(String newLanguage) {
    if (language != newLanguage) {
      language = newLanguage;
    }
    notifyListeners();
  }
}
