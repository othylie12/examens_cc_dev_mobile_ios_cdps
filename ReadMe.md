
# Contrôle Continue & Examen : Développement mobile - Salle A, B.

*Description : Le but de ce contrôle est de tester vos connaissances pratiques en Flutter. Il est composé de trois parties. La première partie est à faire de manière individuelle, la deuxième partie en groupe, en dehors des heures de cours, et la dernière partie d'une durée de 3 heures 30 minutes sera complétée en classe.*

> NB : Ces projets serviront de notes pour le contrôle continue du cours
> de Développement Mobile iOS Hybride mais également pour les examens de
> Développement Mobile Android & Développement Mobile iOS Hybride.

> Si deux ou plusieurs projets présentent des similarités faisaient état d'un plagiat ou d'un copier-coller, les notes associées a ces projets, indistinctement seront  nulles.

> Faites un fork du répertoire du [projet](https://github.com/bienvenuelisis/examens_cc_dev_mobile_ios_cdp) sur votre compte GitHub. Après finalisation du projet, soumettez une *pull request* contenant le travail effectué seul ou en groupe (pour les groupes, une seule personne s'en chargera au nom des autres). Les projets ou modifications soumis après la date limite (Jeudi, 06 Juin 2024, 08H00) ne seront pas pris en compte.

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

## Partie 2 :

> NB : A faire en groupe de deux personnes. Pour les classes impaires,
> un groupe unique de 3 personnes sera toléré. Respecter au maximum les
> consignes données en classe, concernant la formation des groupes de
> travail. Dans le dossier [partie_2/\[ma_classe\]](https://github.com/bienvenuelisis/examens_cc_dev_mobile_ios_cdp/tree/main/partie2), créez un dossier portant
> le nom des membres du groupe, séparés par le caractère underscore (**ABALO_AFI**),
> et mettez votre projet a l'intérieur de ce dossier (celui portant le nom des membres du groupe).

Description : Le ministère de la sécurité intérieure vous sollicite en tant que consultant en développement mobile pour créer une application permettant aux citoyens de valider leur identité et d'y associer un numéro de téléphone.

L'enjeu est simple :

* Lors du premier lancement de l'application l'utilisateur entre son numéro de téléphone, ses informations d’identité, de scolarité, d'emploi et ou de situation matrimoniale.
* Un message lui est envoyé contenant le résumé sommaire des informations soumis et un code de confirmation. Il entre ce code de confirmation et ses informations sont stockés en local sur son appareil.
* Au prochain lancement, il consulte sur une page ses informations, et peut les modifier. La modification est également soumise a la vérification avec un code envoyé par SMS.
* Un bouton lui permet de synchroniser les informations en local sur l'appareil avec le service du ministère de la sécurité.

Créer une application Flutter permettant, d'apporter une solution à ce challenge.

## Partie 3 :

Les instructions seront données et mis au jour au moment venu.

Bonne chance.
