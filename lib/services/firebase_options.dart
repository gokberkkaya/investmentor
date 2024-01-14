// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    if (defaultTargetPlatform case TargetPlatform.android) {
      return android;
    } else if (defaultTargetPlatform case TargetPlatform.iOS) {
      return ios;
    } else if (defaultTargetPlatform case TargetPlatform.macOS) {
      return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdXJ9-pXr6qhQ6S4YmNSrzyBxWdGgyuW4',
    appId: '1:530925499189:android:d8825848049d78c27c527c',
    messagingSenderId: '530925499189',
    projectId: 'investmentor-3340d',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdXJ9-pXr6qhQ6S4YmNSrzyBxWdGgyuW4',
    appId: '1:530925499189:android:d8825848049d78c27c527c',
    messagingSenderId: '530925499189',
    projectId: 'investmentor-3340d',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'xxxxxxxxxxxxxxxxxxx',
    appId: 'xxxxxxxxxxxxxxxxxxx',
    messagingSenderId: 'xxxxxxxxxxxxxxxxxxx',
    projectId: 'xxxxxxxxxxxxxxxxxxx',
    databaseURL: 'xxxxxxxxxxxxxxxxxxx',
    storageBucket: 'xxxxxxxxxxxxxxxxxxx',
    androidClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosClientId: 'xxxxxxxxxxxxxxxxxxx',
    iosBundleId: 'xxxxxxxxxxxxxxxxxxx',
  );
}