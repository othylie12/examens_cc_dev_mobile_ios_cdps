import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';
// Assurez-vous d'importer le fichier où se trouve votre SplashScreen


void main() {
  testWidgets('SplashScreen Test', (WidgetTester tester) async {
    // Construisez votre application et déclenchez un frame.
    await tester.pumpWidget(MyApp());

    // Vérifiez que le SplashScreen est affiché.
    

    // Vous pouvez également ajouter d'autres vérifications ici, par exemple :
    // Vérifiez la présence d'un texte spécifique
    expect(find.text('Bienvenue sur l\'écran de démarrage!'), findsOneWidget);
  });
}
