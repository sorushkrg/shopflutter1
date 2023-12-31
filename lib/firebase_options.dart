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
    apiKey: 'AIzaSyB2Dw3hGLHmx4cQfif98ges_iGCjnvzA8g',
    appId: '1:566107811598:web:f23caa1e506a9ab10cf15f',
    messagingSenderId: '566107811598',
    projectId: 'store-shop-4d46c',
    authDomain: 'store-shop-4d46c.firebaseapp.com',
    storageBucket: 'store-shop-4d46c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfxlC8CeJjtLYKfOnoZXbxFfyQQbZGMh0',
    appId: '1:566107811598:android:322d04f8c1dc5ef40cf15f',
    messagingSenderId: '566107811598',
    projectId: 'store-shop-4d46c',
    storageBucket: 'store-shop-4d46c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6nox1MBP30Kr9xfKcUPJWPM-A6VP7Eqs',
    appId: '1:566107811598:ios:4903ba1e1f1539540cf15f',
    messagingSenderId: '566107811598',
    projectId: 'store-shop-4d46c',
    storageBucket: 'store-shop-4d46c.appspot.com',
    iosBundleId: 'com.example.storeshop',
  );
}
