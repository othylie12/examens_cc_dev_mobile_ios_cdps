import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ajdra_metchonou/services/shared_preferences_service.dart';
import '../models/user_model.dart'; // Import the User model

class FirebaseSyncService {
  final FirebaseFirestore _firestore;
  final SharedPreferencesService _prefsService;

  FirebaseSyncService(this._firestore, this._prefsService);

  Future<void> uploadData() async {
    // Get the local data
    User user = User(
      name: _prefsService.getName() ?? "",
      id: _prefsService.getId() ?? "",
      education: _prefsService.getEducation() ?? "",
      profession: _prefsService.getProfession() ?? "",
      maritalStatus: _prefsService.getMaritalStatus() ?? "",
    );

    // Check if the user's ID is not an empty string
    if (user.id.isNotEmpty) {
      // Upload the local data to Firebase
      await _firestore.collection('users').doc(user.id).set(user.toMap());
    } else {
      print("User ID is empty. Cannot upload data to Firestore.");
    }
  }

  Future<void> downloadData() async {
    // Get the user's ID
    String id = _prefsService.getId() ?? "";

    // Download the data from Firebase
    DocumentSnapshot doc = await _firestore.collection('users').doc(id).get();

    // Create a User from the downloaded data
    User user = User.fromMap(doc.data() as Map<String, dynamic>);

    // Save the downloaded data locally
    await _prefsService.saveName(user.name);
    await _prefsService.saveId(user.id);
    await _prefsService.saveEducation(user.education);
    await _prefsService.saveProfession(user.profession);
    await _prefsService.saveMaritalStatus(user.maritalStatus);
  }
}