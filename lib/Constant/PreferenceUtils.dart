import 'dart:async' show Future;
import 'dart:convert';

import 'package:geoprep/Screens/auth%20screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_constants.dart';

class PreferenceUtils {
  static Future<SharedPreferences?> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance!.getString(key) ?? defValue ?? "";
  }

  static Future<void> deleteByKey(String key) async {
    await _prefsInstance!.remove(key);
  }

  static Future<void> delete() async {
    await _prefsInstance!.clear();
    Get.offAll(LogInScreen());
  }

  static Future<void> deleteFilter() async {
    await _prefsInstance!.remove('short_by_date');
    await _prefsInstance!.remove('transaction_status');
    await _prefsInstance!.remove('end_date_selected');
    await _prefsInstance!.remove('start_date_selected');
  }

  static Future<void> deleteTransactionFilter() async {
    await _prefsInstance!.remove('start_date_sort');
    await _prefsInstance!.remove('end_date_sort');
    await _prefsInstance!.remove('transaction_type');
    await _prefsInstance!.remove('transaction_status');
    await _prefsInstance!.remove('sort_date');
    await _prefsInstance!.remove('sort_amount');
    await _prefsInstance!.remove('sort_name');
    await _prefsInstance!.remove('end_date_selected');
    await _prefsInstance!.remove('start_date_selected');
    await _prefsInstance!.remove('transaction_with');
    await _prefsInstance!.remove('save_status_filter');
    await _prefsInstance!.remove('mylist');
  }

  static Future<bool?> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value);
  }

  static Future<bool?> setStringList(String key, List<String> cheeckString) async {
    var prefs = await _instance;
    return prefs?.setStringList(key, cheeckString);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool?> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value);
  }

  static int get getUserId {
    return int.parse(_prefsInstance!.getString(AppConstants.USER_ID) ?? "0");
  }

  static String get getSelectedBusiness {
    return _prefsInstance!.getString(AppConstants.SELECTED_BUSINESS) ?? "";
  }

  static setSelectedBusiness(String value) {
    return _prefsInstance!.setString(AppConstants.SELECTED_BUSINESS, value);
  }
  static String get getCurrencySymbol {
    return _prefsInstance!.getString(AppConstants.CURRENCY_SYMBOL) ?? "\$";
  }
}
