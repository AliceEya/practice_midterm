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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAeRomagOaw_zZr5WV86iAPn_2Os992mgA',
    appId: '1:631270363541:web:86410efeff3fea4d57269c',
    messagingSenderId: '631270363541',
    projectId: 'eyamidterms',
    authDomain: 'eyamidterms.firebaseapp.com',
    storageBucket: 'eyamidterms.appspot.com',
    measurementId: 'G-FBLY80XBJB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASHjlW6uxV1jkKsyNzMfPC91AfzXwMdjU',
    appId: '1:631270363541:android:5ed36ed798ce55da57269c',
    messagingSenderId: '631270363541',
    projectId: 'eyamidterms',
    storageBucket: 'eyamidterms.appspot.com',
  );
}