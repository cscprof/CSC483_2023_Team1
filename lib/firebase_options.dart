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
    apiKey: 'AIzaSyCJ3_7-MKc0yIil_EYcOKKh5VZe2b4Bm-s',
    appId: '1:266295427213:web:97a8e3ed6c47320eeaa2c4',
    messagingSenderId: '266295427213',
    projectId: 'csc483-team1',
    authDomain: 'csc483-team1.firebaseapp.com',
    storageBucket: 'csc483-team1.appspot.com',
    measurementId: 'G-BRVMVE7KTC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVx354ff1stkbzBIqgAYNBAi8a-1uJB-8',
    appId: '1:266295427213:android:45bd4afac1f49104eaa2c4',
    messagingSenderId: '266295427213',
    projectId: 'csc483-team1',
    storageBucket: 'csc483-team1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8nkRxnXRcwakYM7fuoMOc4P0k1N1nGUo',
    appId: '1:266295427213:ios:509e58618c14a9f9eaa2c4',
    messagingSenderId: '266295427213',
    projectId: 'csc483-team1',
    storageBucket: 'csc483-team1.appspot.com',
    iosBundleId: 'com.example.brigProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8nkRxnXRcwakYM7fuoMOc4P0k1N1nGUo',
    appId: '1:266295427213:ios:2a9dc23c819b1087eaa2c4',
    messagingSenderId: '266295427213',
    projectId: 'csc483-team1',
    storageBucket: 'csc483-team1.appspot.com',
    iosBundleId: 'com.example.brigProject.RunnerTests',
  );
}
