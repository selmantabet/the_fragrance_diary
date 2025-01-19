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
    apiKey: 'AIzaSyAQ5UsYpSEDnhTBOqd8lnkL4VXjtSNjrGo',
    appId: '1:141108781433:web:69dbce29eddb83c567cfa8',
    messagingSenderId: '141108781433',
    projectId: 'the-fragrance-diary',
    authDomain: 'the-fragrance-diary.firebaseapp.com',
    storageBucket: 'the-fragrance-diary.firebasestorage.app',
    measurementId: 'G-2DTLR13FPE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADjy-nE2dvuNPvoDzAavcXyc2SIP9OdzE',
    appId: '1:141108781433:android:e1859541d0773e0a67cfa8',
    messagingSenderId: '141108781433',
    projectId: 'the-fragrance-diary',
    storageBucket: 'the-fragrance-diary.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUm4gSXNFgTGj9vXrOSia-FWS4rgC6A5M',
    appId: '1:141108781433:ios:1c36487e0b12ec7d67cfa8',
    messagingSenderId: '141108781433',
    projectId: 'the-fragrance-diary',
    storageBucket: 'the-fragrance-diary.firebasestorage.app',
    iosBundleId: 'com.selman.theFragranceDiary',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUm4gSXNFgTGj9vXrOSia-FWS4rgC6A5M',
    appId: '1:141108781433:ios:1c36487e0b12ec7d67cfa8',
    messagingSenderId: '141108781433',
    projectId: 'the-fragrance-diary',
    storageBucket: 'the-fragrance-diary.firebasestorage.app',
    iosBundleId: 'com.selman.theFragranceDiary',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAQ5UsYpSEDnhTBOqd8lnkL4VXjtSNjrGo',
    appId: '1:141108781433:web:ceebf1e8cd3bf6eb67cfa8',
    messagingSenderId: '141108781433',
    projectId: 'the-fragrance-diary',
    authDomain: 'the-fragrance-diary.firebaseapp.com',
    storageBucket: 'the-fragrance-diary.firebasestorage.app',
    measurementId: 'G-MG5F1CDK5C',
  );
}
