// services/storage.dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService { 
  static Future<void> storeUserInfo(
    String phoneNumber, String name, String education, String job, String maritalStatus) 
  async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('phoneNumber', phoneNumber);
    prefs.setString('name', name);
    prefs.setString('education', education);
    prefs.setString('job', job);
    prefs.setString('maritalStatus', maritalStatus);  
  }

  static Future<Map<String, String>> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'phoneNumber': prefs.getString('phoneNumber') ?? '',
      'name': prefs.getString('name') ?? '', //
      'education': prefs.getString('education') ?? '',
      'job': prefs.getString('job') ?? '',
      'maritalStatus': prefs.getString('maritalStatus') ?? '',





    };
  }
}
