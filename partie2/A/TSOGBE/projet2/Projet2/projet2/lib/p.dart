import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

abstract class PlatformFirebaseOptions {
  FirebaseOptions get options;
}

class AndroidFirebaseOptions implements PlatformFirebaseOptions {
  @override
  FirebaseOptions get options => const FirebaseOptions(
    apiKey: 'AIzaSyBm4rO0mV4iEoVoe3WUmCTgem4cVIjelaQ',
    appId: '1:819625673387:android:ae305af76a1683f000edee',
    messagingSenderId: '819625673387',
    projectId: 'bruno-730a5',
    storageBucket: 'projet-partie2.appspot.com',
  );
}

// Définissez des classes similaires pour iOS, macOS, Windows, Linux
// Exemple pour iOS (à compléter avec les bonnes valeurs)
class IOSFirebaseOptions implements PlatformFirebaseOptions {
  @override
  FirebaseOptions get options => const FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
    projectId: 'YOUR_IOS_PROJECT_ID',
    storageBucket: 'YOUR_IOS_STORAGE_BUCKET',
  );
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidFirebaseOptions().options;
      case TargetPlatform.iOS:
        return IOSFirebaseOptions().options; // Utilisez la classe appropriée
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for Linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}
