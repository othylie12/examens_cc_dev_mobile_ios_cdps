import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conditions d\'utilisation'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Text(
            'Conditions d\'utilisation',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'En utilisant cette application, vous acceptez les conditions suivantes : \n\n'
            '1. Vous êtes entièrement responsable de l\'exactitude et de la légalité des informations que vous soumettez.\n\n'
            '2. Vous consentez à ce que le ministère de la sécurité intérieure utilise les informations que vous fournissez pour valider votre identité.\n\n'
            '3. Vous acceptez de fournir un numéro de téléphone valide et accessible pour la vérification de votre identité.\n\n'
            '4. Vous comprenez et acceptez que votre numéro de téléphone puisse être associé à votre identité dans la base de données du ministère de la sécurité intérieure et vous ne pourez pas le modifier.\n\n'
            '5. Vous êtes responsable de maintenir la confidentialité de votre numéro de téléphone et de ne pas le partager avec d\'autres personnes.\n\n'
            'En utilisant cette application, vous acceptez ces conditions d\'utilisation. Si vous n\'êtes pas d\'accord avec ces conditions, veuillez ne pas utiliser l\'application.',
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          SizedBox(height: 24),
          Text(
            'Confidentialité',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'En utilisant cette application, vous consentez également à ce que le ministère de la sécurité intérieure collecte, utilise et partage vos informations conformément à sa politique de confidentialité.\n\n'
            '1. Le ministère de la sécurité intérieure s\'engage à protéger vos informations et à ne les utiliser que dans le cadre de la validation de votre identité.\n\n'
            '2. Pour plus d\'informations sur la manière dont vos informations sont collectées, utilisées et protégées, veuillez consulter la politique de confidentialité du ministère de la sécurité intérieure.\n\n',
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
