// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBfq7S6Dyc2KtFnsXANbk5xvQ7qKYR_BBg',
    appId: '1:644501193335:web:167ca9fdfb132afd687c72',
    messagingSenderId: '644501193335',
    projectId: 'flutter-notify-adcee',
    authDomain: 'flutter-notify-adcee.firebaseapp.com',
    storageBucket: 'flutter-notify-adcee.appspot.com',
    measurementId: 'G-MKVVBBRJ5P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlCO3yuiZZDyCF0Digp8Ex-wM752c0dCI',
    appId: '1:644501193335:android:a73e8fbed8e8afa1687c72',
    messagingSenderId: '644501193335',
    projectId: 'flutter-notify-adcee',
    storageBucket: 'flutter-notify-adcee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCUR6NWwbLpR6ToB-tymBh4_jhJHbc-iHk',
    appId: '1:644501193335:ios:599a6c962e10a74b687c72',
    messagingSenderId: '644501193335',
    projectId: 'flutter-notify-adcee',
    storageBucket: 'flutter-notify-adcee.appspot.com',
    iosBundleId: 'com.example.notifyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCUR6NWwbLpR6ToB-tymBh4_jhJHbc-iHk',
    appId: '1:644501193335:ios:599a6c962e10a74b687c72',
    messagingSenderId: '644501193335',
    projectId: 'flutter-notify-adcee',
    storageBucket: 'flutter-notify-adcee.appspot.com',
    iosBundleId: 'com.example.notifyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfq7S6Dyc2KtFnsXANbk5xvQ7qKYR_BBg',
    appId: '1:644501193335:web:d28580ad40e4fc0a687c72',
    messagingSenderId: '644501193335',
    projectId: 'flutter-notify-adcee',
    authDomain: 'flutter-notify-adcee.firebaseapp.com',
    storageBucket: 'flutter-notify-adcee.appspot.com',
    measurementId: 'G-JPL8G05VD5',
  );

}