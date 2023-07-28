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
    apiKey: 'AIzaSyCS7mSsEElsNiRFk2K7mGoBlbKCDPknRgk',
    appId: '1:302156416436:web:f4241a976b4c2deb8b5ee1',
    messagingSenderId: '302156416436',
    projectId: 'fir-examples-ff4ed',
    authDomain: 'fir-examples-ff4ed.firebaseapp.com',
    storageBucket: 'fir-examples-ff4ed.appspot.com',
    measurementId: 'G-WBSRWHQMBF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZacbovi01f0U2MkF1-iWCSwgvcYoVCmg',
    appId: '1:302156416436:android:997240c6dcaedbab8b5ee1',
    messagingSenderId: '302156416436',
    projectId: 'fir-examples-ff4ed',
    storageBucket: 'fir-examples-ff4ed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJgsliwPo0Ez6UmFD2hz_WSZ6jq7VWHHI',
    appId: '1:302156416436:ios:d8ac27e17cf9f1b38b5ee1',
    messagingSenderId: '302156416436',
    projectId: 'fir-examples-ff4ed',
    storageBucket: 'fir-examples-ff4ed.appspot.com',
    iosClientId: '302156416436-ufvdo0jvq0lt5geohjqjitvq3p0cosl4.apps.googleusercontent.com',
    iosBundleId: 'de.chauss.firebaseexamples.firebaseExamples',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJgsliwPo0Ez6UmFD2hz_WSZ6jq7VWHHI',
    appId: '1:302156416436:ios:d20826cd67d5ecb08b5ee1',
    messagingSenderId: '302156416436',
    projectId: 'fir-examples-ff4ed',
    storageBucket: 'fir-examples-ff4ed.appspot.com',
    iosClientId: '302156416436-ljcjbim25ahlakl3k4g0ceh0cqoi7aie.apps.googleusercontent.com',
    iosBundleId: 'de.chauss.firebaseexamples.firebaseExamples.RunnerTests',
  );
}