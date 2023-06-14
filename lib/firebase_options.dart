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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9mxi8v3Pp7m-Rq0uFVjHnYhoBKY4OCWE',
    appId: '1:503097429936:android:75772c152c8a74d0995075',
    messagingSenderId: '503097429936',
    projectId: 'buyble-real',
    storageBucket: 'buyble-real.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCT5zv5A8dhKjpVVNCpy0Ze-SpPh1RTF2k',
    appId: '1:503097429936:ios:fe54c19e6b12abd1995075',
    messagingSenderId: '503097429936',
    projectId: 'buyble-real',
    storageBucket: 'buyble-real.appspot.com',
    androidClientId: '503097429936-lm5dmf68uevnlem58m10g7iia28rdvm0.apps.googleusercontent.com',
    iosClientId: '503097429936-i82snop7h6j451mqhc82998sic308knl.apps.googleusercontent.com',
    iosBundleId: 'com.example.buybleReal',
  );
}