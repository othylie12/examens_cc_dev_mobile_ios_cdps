import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<void> saveUserDataLocally(Map<String, String> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', userData['name'] ?? '');
    await prefs.setString('school', userData['school'] ?? '');
    await prefs.setString('job', userData['job'] ?? '');
    await prefs.setString('maritalStatus', userData['maritalStatus'] ?? '');
  }

  static Future<Map<String, String>> loadUserDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString('name') ?? '',
      'school': prefs.getString('school') ?? '',
      'job': prefs.getString('job') ?? '',
      'maritalStatus': prefs.getString('maritalStatus') ?? '',
    };
  }
}
