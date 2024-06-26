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
    apiKey: 'AIzaSyBHrgJAUEgb5g1XvGceJDWB9vjxpdjGu2M',
    appId: '1:419558821334:web:1d15e696229c5bed3de877',
    messagingSenderId: '419558821334',
    projectId: 'restaurant-demo-5d63b',
    authDomain: 'restaurant-demo-5d63b.firebaseapp.com',
    storageBucket: 'restaurant-demo-5d63b.appspot.com',
    measurementId: 'G-2CLX0V8XYD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhWQDVhQbNFR6bad-YItNVi43hPSR7kbA',
    appId: '1:419558821334:android:5211be7e09ae54ae3de877',
    messagingSenderId: '419558821334',
    projectId: 'restaurant-demo-5d63b',
    storageBucket: 'restaurant-demo-5d63b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARG9o787tgGqg8RuH-zfCDoH1Td9gdSQw',
    appId: '1:419558821334:ios:c3e929a09ddf02843de877',
    messagingSenderId: '419558821334',
    projectId: 'restaurant-demo-5d63b',
    storageBucket: 'restaurant-demo-5d63b.appspot.com',
    iosBundleId: 'com.example.restaurantDemoApp',
  );
}
