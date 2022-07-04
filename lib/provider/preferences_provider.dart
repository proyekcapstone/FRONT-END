import 'package:capstone_project_jti/common/style.dart';
import 'package:capstone_project_jti/data/preferences/preferences_helper.dart';

import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({this.preferencesHelper}) {
    _getTheme();
    _getDailyDestinationPreferences();
  }

  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData => _isDarkTheme ? darkTheme : lightTheme;

  void _getTheme() async {
    _isDarkTheme = await preferencesHelper.isDarkTheme;
    notifyListeners();
  }

  void enableDarkTheme(bool value) {
    preferencesHelper.setDarkTheme(value);
    _getTheme();
  }

  bool _isDailyDestinationActive = false;
  bool get isDailyDestinationActive => _isDailyDestinationActive;

  void _getDailyDestinationPreferences() async {
    _isDailyDestinationActive =
        await preferencesHelper.isRekomendasiDestinasiActive;
    notifyListeners();
  }

  void enableDailyDestination(bool value) {
    preferencesHelper.setRekomendasiDestinasi(value);
    _getDailyDestinationPreferences();
  }
}
