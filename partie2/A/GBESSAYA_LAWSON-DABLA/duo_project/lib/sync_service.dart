import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SyncService {
  Future<void> syncData() async {
    final prefs = await SharedPreferences.getInstance();
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    String identityInfo = prefs.getString('identityInfo') ?? '';
    String educationInfo = prefs.getString('educationInfo') ?? '';
    String employmentInfo = prefs.getString('employmentInfo') ?? '';
    String maritalStatus = prefs.getString('maritalStatus') ?? '';

    // Préparer les données à envoyer
    var data = {
      'phoneNumber': phoneNumber,
      'identityInfo': identityInfo,
      'educationInfo': educationInfo,
      'employmentInfo': employmentInfo,
      'maritalStatus': maritalStatus,
    };

    // Envoyer les données au serveur
    var response = await http.post(
      Uri.parse('https://api.ministere-securite.int/sync'),
      body: data,
    );

    if (response.statusCode == 200) {
      print('Données synchronisées avec succès');
    } else {
      print('Échec de la synchronisation des données');
    }
  }
}
