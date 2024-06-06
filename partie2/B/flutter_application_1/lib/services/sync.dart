// services/sync.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SyncService {
  Future<void> syncData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Récupérer les données stockées en local
    final String? name = prefs.getString('name');
    final String? dob = prefs.getString('dob');
    final String? nationalId = prefs.getString('nationalId');

    if (name != null && dob != null && nationalId != null) {
      // Préparer les données pour l'envoi
      final Map<String, String> data = {
        'name': name,
        'dob': dob,
        'nationalId': nationalId,
      };

      // Envoyer les données au serveur
      final response = await http.post(
        Uri.parse('https://example.com/sync'), // Remplacez par l'URL de votre service
        body: data,
      );

      if (response.statusCode == 200) {
        print('Données synchronisées avec succès.');
      } else {
        print('Erreur lors de la synchronisation des données.');
      }
    } else {
      print('Aucune donnée à synchroniser.');
    }
 
  }}