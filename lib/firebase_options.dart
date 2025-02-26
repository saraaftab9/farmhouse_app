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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCz00wMqqjOlz62U72vjdBs76WRZkjYuzU',
    appId: '1:294078469173:web:76c049c2f3ac22b991cd7c',
    messagingSenderId: '294078469173',
    projectId: 'farmhouse-app-4b63f',
    authDomain: 'farmhouse-app-4b63f.firebaseapp.com',
    storageBucket: 'farmhouse-app-4b63f.appspot.com',
    measurementId: 'G-KWZ9ZL6HM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSZ2ly-JxhIOnikQTybFWrj_t-UGN3E3k',
    appId: '1:294078469173:android:1f17d8f4dabae22591cd7c',
    messagingSenderId: '294078469173',
    projectId: 'farmhouse-app-4b63f',
    storageBucket: 'farmhouse-app-4b63f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0N2C2y9OuH1O6cVZPGQSgl5k4jVUs1Bc',
    appId: '1:294078469173:ios:643beccae25cafd391cd7c',
    messagingSenderId: '294078469173',
    projectId: 'farmhouse-app-4b63f',
    storageBucket: 'farmhouse-app-4b63f.appspot.com',
    iosBundleId: 'com.example.farmhouseApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCz00wMqqjOlz62U72vjdBs76WRZkjYuzU',
    appId: '1:294078469173:web:aa0b377b20ea30e891cd7c',
    messagingSenderId: '294078469173',
    projectId: 'farmhouse-app-4b63f',
    authDomain: 'farmhouse-app-4b63f.firebaseapp.com',
    storageBucket: 'farmhouse-app-4b63f.appspot.com',
    measurementId: 'G-K3V9VDK0EX',
  );
}
