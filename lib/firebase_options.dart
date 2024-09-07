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
    apiKey: 'AIzaSyBO5ul2qor_xWluiIaHyJ8WuZgUo6aJzik',
    appId: '1:1081360138925:web:b92f96d94be7f910a73c24',
    messagingSenderId: '1081360138925',
    projectId: 'ecommerce-7b7f0',
    authDomain: 'ecommerce-7b7f0.firebaseapp.com',
    storageBucket: 'ecommerce-7b7f0.appspot.com',
    measurementId: 'G-4TL2R0VR54',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKvGcNlHtRXUJ7CzQPgZonGhA2aqLhWwQ',
    appId: '1:1081360138925:android:4f001c0515029ff2a73c24',
    messagingSenderId: '1081360138925',
    projectId: 'ecommerce-7b7f0',
    storageBucket: 'ecommerce-7b7f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJOzOAgOV9IZomAGVMI0-75l6hyH70TmY',
    appId: '1:1081360138925:ios:6fd940f8556ef80da73c24',
    messagingSenderId: '1081360138925',
    projectId: 'ecommerce-7b7f0',
    storageBucket: 'ecommerce-7b7f0.appspot.com',
    iosBundleId: 'com.example.commerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJOzOAgOV9IZomAGVMI0-75l6hyH70TmY',
    appId: '1:1081360138925:ios:6fd940f8556ef80da73c24',
    messagingSenderId: '1081360138925',
    projectId: 'ecommerce-7b7f0',
    storageBucket: 'ecommerce-7b7f0.appspot.com',
    iosBundleId: 'com.example.commerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBO5ul2qor_xWluiIaHyJ8WuZgUo6aJzik',
    appId: '1:1081360138925:web:06fd347d60fdf168a73c24',
    messagingSenderId: '1081360138925',
    projectId: 'ecommerce-7b7f0',
    authDomain: 'ecommerce-7b7f0.firebaseapp.com',
    storageBucket: 'ecommerce-7b7f0.appspot.com',
    measurementId: 'G-VYB1J9Y68Y',
  );

}