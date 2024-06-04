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
    apiKey: 'AIzaSyBndTqAp_qTADPGbW1TkGQp6O3I3XdnP9c',
    appId: '1:128133582398:web:ba6a39180bdd5838970b6f',
    messagingSenderId: '128133582398',
    projectId: 'drum-c70f4',
    authDomain: 'drum-c70f4.firebaseapp.com',
    storageBucket: 'drum-c70f4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_xDSvl6i104j8ioarQir-M0o7czbvMdY',
    appId: '1:128133582398:android:cd0a3fda0db3f525970b6f',
    messagingSenderId: '128133582398',
    projectId: 'drum-c70f4',
    storageBucket: 'drum-c70f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-GXzOBgklSG4cdFzA3vKu-pT0OWrEEfo',
    appId: '1:128133582398:ios:f4ee1e79a428d668970b6f',
    messagingSenderId: '128133582398',
    projectId: 'drum-c70f4',
    storageBucket: 'drum-c70f4.appspot.com',
    iosBundleId: 'com.advicts.smartdrum',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-GXzOBgklSG4cdFzA3vKu-pT0OWrEEfo',
    appId: '1:128133582398:ios:6bd564f6abac4b60970b6f',
    messagingSenderId: '128133582398',
    projectId: 'drum-c70f4',
    storageBucket: 'drum-c70f4.appspot.com',
    iosBundleId: 'com.advicts.smartdrum.RunnerTests',
  );
}
