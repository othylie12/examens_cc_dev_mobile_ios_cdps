Flutter Interface Project
Introduction
Ce projet Flutter a été réalisé dans le cadre d'un cours sur le développement d'interfaces. Il comprend une page de lancement, une page de connexion et une page principale affichant des sections avec des éléments.

Fonctionnalités
Page de lancement : Affichée pendant 5 secondes avant de rediriger vers la page de connexion.
Page de connexion : Authentification par email et mot de passe.
Page principale : Affichage de sections avec des images, titres, descriptions, icônes de favoris et évaluations en étoiles.
Défilement horizontal pour les boutons de catégorie.
Prérequis
Flutter SDK (version 2.0.0 ou supérieure)
Dart SDK
Installation
Clonez ce dépôt :
sh
Copier le code
git clone https://github.com/elprofessorCopa/examens_cc_dev_mobile_ios_cdp.git
Accédez au répertoire du projet :
sh
Copier le code
cd flutter-interface-project
Installez les dépendances :
sh
Copier le code
flutter pub get
Utilisation
Lancez l'application :
sh
Copier le code
flutter run
Structure du projet
css
Copier le code
lib/
├── main.dart
├── models/
│   └── item_model.dart
├── screens/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   └── splash_screen.dart
├── widgets/
│   ├── bottom_nav_bar.dart
│   ├── category_button.dart
│   ├── item_card_with_details.dart
│   ├── my_app_bar.dart
│   └── section_header.dart
Auteur
AKAKPO Charlie akakpocharlie@gmail.com

Licence
Ce projet est sous licence MIT.