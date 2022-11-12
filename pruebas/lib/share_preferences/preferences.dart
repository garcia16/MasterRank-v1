

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static late SharedPreferences _prefs;

  static bool _isDarkMode = false;
  static bool _notifMail = true;
  static bool _notifPhone = true;
  static bool _publicAccount = true;
  static bool clockin = true;

  static Future init() async {

    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode ( bool value ) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static bool get notifMail {
    return _prefs.getBool('notifMail') ?? _notifMail;
  }

  static set notifMail ( bool value ) {
    _notifMail = value;
    _prefs.setBool('notifMail', value);
  }

  static bool get notifPhone {
    return _prefs.getBool('notifPhone') ?? _notifPhone;
  }

  static set notifPhone ( bool value ) {
    _notifPhone = value;
    _prefs.setBool('notifPhone', value);
  }

  static bool get publicAccount {
    return _prefs.getBool('publicAccount') ?? _publicAccount;
  }

  static set publicAccount ( bool value ) {
    _publicAccount = value;
    _prefs.setBool('publicAccount', value);
  }
}