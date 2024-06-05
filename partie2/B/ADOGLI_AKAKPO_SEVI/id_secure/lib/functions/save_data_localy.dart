import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/providers/user_provider.dart';


Future<void> saveUserDataLocally(context) async {
  final userProvider = Provider.of<UserProvider>(context, listen: false);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('phoneNumber', userProvider.phoneNumber);
  await prefs.setString('firstName', userProvider.firstName);
  await prefs.setString('lastName', userProvider.lastName);
  await prefs.setString('email', userProvider.email);
  await prefs.setString('education', userProvider.education);
  await prefs.setString('occupation', userProvider.occupation);
  await prefs.setString('gender', userProvider.sexe);
  await prefs.setString('maritalStatus', userProvider.maritalStatus);
  await prefs.setString('birthdate', userProvider.birthdate.toString());
}

