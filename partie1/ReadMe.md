
## Partie 1 : Interfaces visuelles

> NB : A faire individuellement. Dans le dossier [partie_1/\[ma_classe\]](https://github.com/bienvenuelisis/examens_cc_dev_mobile_ios_cdp/tree/main/partie1), créez
> un dossier portant votre nom de famille au complet, et mettez votre
> projet a l'intérieur de ce dossier (celui portant votre nom).

1. Dans votre projet Flutter, adopter dans le dossier lib, l'organisation suivante :

> lib
> ├──-core
> └───theme.dart
> └───screens
> └───feature1_screen.dart
> └───feature2_screen.dart
> ...
> └───models
> └───widgets
> └───main.dart

Vous pourrez vous inspirer, de l'architecture du répertoire *android* du projet [connect_app](https://github.com/bienvenuelisis/connect_app/tree/main/lib/android), bien entendu en l'adaptant a votre contexte.

2. Dans votre projet Flutter, créer 3 pages :
   * Page de lancement de l'application : une page coloriée, avec la couleur principale de votre application avec au centre un Logo (Image) ou du Texte. Cette page s'affiche pendant 5 secondes. L'utilisateur est ensuite redirigé vers la page d'authentification.
   * Page d'authentification à l'application : cette page contient un formulaire avec deux champs : un champ email et un champ mot de passe. Un bouton permet de valider ce formulaire. En cliquant sur ce bouton, l'utilisateur est alors redirigé vers la page d'accueil de l'application.
   * Page d'accueil de l'application : une interface représentant une page d'accueil pour les types de projets suivants : Todo App (Google Tasks, ...), Messaging App (Telegram, Facebook, Messenger, ...), ECommerce App (Ali Baba, Amazon, ...), Delivery App (Kaba, ...). Pour le design, vous pourrez vous inspirer de sites de Design comme[Dribbble](https://dribbble.com/), [Behance](https://www.behance.net/) ou du design d'autres applications populaires dans la catégorie que vous avez choisi. Dans un dossier design a la racine de votre projet, veuillez inclure l'image ou la capture d'écran correspondante a votre source d'inspiration.
