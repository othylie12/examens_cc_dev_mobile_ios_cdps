import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService();
    }
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  Future<void> saveName(String name) async {
    await _preferences!.setString('name', name);
  }

  String? getName() {
    return _preferences!.getString('name');
  }

  Future<void> saveId(String id) async {
    await _preferences!.setString('id', id);
  }

  String? getId() {
    return _preferences!.getString('id');
  }

  Future<void> saveEducation(String education) async {
    await _preferences!.setString('education', education);
  }

  String? getEducation() {
    return _preferences!.getString('education');
  }

  Future<void> saveProfession(String profession) async {
    await _preferences!.setString('profession', profession);
  }

  String? getProfession() {
    return _preferences!.getString('profession');
  }

  Future<void> saveMaritalStatus(String maritalStatus) async {
    await _preferences!.setString('maritalStatus', maritalStatus);
  }

  String? getMaritalStatus() {
    return _preferences!.getString('maritalStatus');
  }

  String? getIdentityCardNumber() {
    return _preferences!.getString('identityCardNumber');
  }

  String? getEducationLevel() {
    return _preferences!.getString('educationLevel');
  }
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  Future<void> setUserLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }
}