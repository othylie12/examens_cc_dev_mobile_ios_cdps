// services/confirmation.dart
import 'dart:math';
import 'dart:math';
class ConfirmationCodeService {
  static String generateCode() {
    // Générer un code aléatoire de 6 chiffres
    final Random random = Random();
    return (100000 + random.nextInt(900000)).toString();
  }

  static Future<void> sendCode(String phoneNumber, String code) async {
    // Utiliser le service SMS pour envoyer le code à phoneNumber
    // Ici, vous utiliserez le service SMS que vous avez intégré
  }

  static Future<bool> verifyCode(String code, String inputCode) async {
    // Comparer le code entré par l'utilisateur avec le code généré
    return code == inputCode;
  }
}
