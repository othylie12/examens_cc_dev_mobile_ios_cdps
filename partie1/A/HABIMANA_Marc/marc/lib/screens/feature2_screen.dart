import 'package:flutter/material.dart';
import 'package:habimana_ngabirano_marc_bruno/widgets/login_bouton.dart';
import 'package:habimana_ngabirano_marc_bruno/widgets/logo_text.dart';
import 'package:habimana_ngabirano_marc_bruno/widgets/text_field_container.dart';

class Deuxieme extends StatelessWidget {
  const Deuxieme({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: const Color.fromARGB(255, 255, 255, 255),
      //pour alligner le bleu et le blanc
      child: Column(
        children: [
          // le padding (conteneur) du text d'en haut
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 90),
            child: Image.asset(
              'assets/icones/bino.png',
              width: 80,
              height: 80,
            ),
          ),

          // conteneur blanc
          Expanded(
            child: /*pour que le conteneur prends tout l'espace dispo*/
                Container(
                    width: screenWidth,
                    /*pour que la largeur de l'appareil soit egale à celle du conteneur*/
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 234, 207, 179),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),

                    //les colonnes de la partie blanche
                    child: Padding(
                      // le padding des elements à l'intérieur de la partie blanche
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // username text
                          const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              "Français (France) ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white),
                            ),
                          ),

                          // username textofield
                          const TextoField(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Numéro mobile ou e-mail',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 150, 148, 148),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),

                          //password textofield
                          const TextoField(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Mot de passe',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 150, 148, 148),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ), // Utilisez votre conteneur décoré ici

                          // se connecter
                          const LoginBouton(),

                          //motde passe oublié?
                          const Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          //creer un compte
                          Padding(
                            padding: const EdgeInsets.only(top: 50, bottom: 10),
                            child: Container(
                              width: screenWidth,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 251, 138,
                                      34), // couleur de la bordure
                                  width: 2, // largeur de la bordure en pixels
                                ),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Text(
                                  "Créer un compte",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 251, 138, 34),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //logo
                          const LogoText()
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
