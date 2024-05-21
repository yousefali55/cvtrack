// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBhu7JGOcUQSgBRgQf2FVlOf8sIODPI5ic',
    appId: '1:739770869744:web:0e1035b467adf5e6ff9f35',
    messagingSenderId: '739770869744',
    projectId: 'fluttercourse-1b584',
    authDomain: 'fluttercourse-1b584.firebaseapp.com',
    storageBucket: 'fluttercourse-1b584.appspot.com',
    measurementId: 'G-ETELC64WB6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCNm6K1mF-4O8DNSRozP-RCh2kbgQYwRF4',
    appId: '1:739770869744:android:18cd050caa80525aff9f35',
    messagingSenderId: '739770869744',
    projectId: 'fluttercourse-1b584',
    storageBucket: 'fluttercourse-1b584.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnuDEStZdUxlOOYO0kEzPiL8S73gByObU',
    appId: '1:739770869744:ios:09e205db9070709bff9f35',
    messagingSenderId: '739770869744',
    projectId: 'fluttercourse-1b584',
    storageBucket: 'fluttercourse-1b584.appspot.com',
    iosBundleId: 'com.example.cvtracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnuDEStZdUxlOOYO0kEzPiL8S73gByObU',
    appId: '1:739770869744:ios:18fe151222f6b734ff9f35',
    messagingSenderId: '739770869744',
    projectId: 'fluttercourse-1b584',
    storageBucket: 'fluttercourse-1b584.appspot.com',
    iosBundleId: 'com.example.cvtracker.RunnerTests',
  );
}
