Flutter Interface Project
Table des matières
Introduction
Fonctionnalités
Prérequis
Installation
Utilisation
Structure du projet
Screenshots
Auteur
Licence

Introduction
Ce projet Flutter a été réalisé dans le cadre d'un cours de développement d'interfaces avec Flutter. L'objectif était de créer une application démontrant l'utilisation de composants personnalisés, la navigation, et des listes défilantes. L'application commence par une page de lancement suivie d'une page de connexion. Après une authentification réussie, l'utilisateur est redirigé vers la page principale.

## Fonctionnalités
- **Page de lancement** : Affichée pendant 5 secondes avant de rediriger vers la page de connexion.
- **Page de connexion** : Permet à l'utilisateur de saisir son email et mot de passe.
- **Page principale** : Affichage d'une liste de sections avec des éléments comprenant une image, un titre, une description, une icône de favori et une note en étoiles.
- **Navigation fluide** entre les écrans.
- **Défilement horizontal** pour les boutons de catégorie.

Prérequis
Flutter SDK (version 2.0.0 ou supérieure)
Dart SDK
Un éditeur de code (Visual Studio Code, Android Studio, etc.)
Installation
Clonez ce dépôt :
sh
Copier le code
git clone https://github.com/votre-utilisateur/flutter-interface-project.git
Accédez au répertoire du projet :
sh
Copier le code
cd flutter-interface-project
Installez les dépendances :
sh
Copier le code
flutter pub get
Utilisation
Lancez l'application sur un simulateur ou un appareil physique :
sh
Copier le code
flutter run
Structure du projet
Voici un aperçu de la structure du projet :

css
Copier le code
lib/
├── main.dart
├── models/
│   └── item_card_Sup.dart
    └── Star_ratings.dart
    └── favorite_items.dart
    └── item_model.dart
├── screens/
│   └── home_screen.dart
    └── lauch_screen.dart
    └── login_screen.dart
├── widgets/
│   ├── bottom_nav_bar.dart
│   ├── category_button.dart
    └── custom_text_field.dart
│   ├── item_card_with_details.dart
│   ├── my_app_bar.dart
│   └── section_header.dart
    └── social_button.dart
main.dart : Point d'entrée de l'application.
models/item_model.dart : Contient les modèles de données pour les éléments.
screens/home_screen.dart : Écran principal de l'application.
widgets/ : Contient les widgets personnalisés utilisés dans l'application.
Screenshots
Ajoutez des captures d'écran de l'application ici pour montrer les différentes interfaces et fonctionnalités.

Auteur
Votre AKAKPO Charlie akakpocharlie@gmail.com

Licence
Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.

