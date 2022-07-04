import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({this.sharedPreferences});

  static const darkTheme = 'DARK_THEME';
  static const rekomendasiDestinasi = 'REKOMENDASI_DESTINASI';

  Future<bool> get isDarkTheme async {
    final prefs = await sharedPreferences;
    return prefs.getBool(darkTheme) ?? false;
  }

  Future<bool> get isRekomendasiDestinasiActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(rekomendasiDestinasi) ?? false;
  }

  void setDarkTheme(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(darkTheme, value);
  }

  void setRekomendasiDestinasi(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(rekomendasiDestinasi, value);
  }
}
