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
    apiKey: 'AIzaSyAMDR7m4R9lo5NumFPEm-Q-qGrtQ4y3CXo',
    appId: '1:370662528090:web:e2aa5537f4792bfda1f463',
    messagingSenderId: '370662528090',
    projectId: 'chat-app-12d51',
    authDomain: 'chat-app-12d51.firebaseapp.com',
    storageBucket: 'chat-app-12d51.appspot.com',
    measurementId: 'G-MR002HNYEN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBAoX-c8-MtO8RiHX0jDMLP6qyT-AL6QRY',
    appId: '1:370662528090:android:f66d8d4aca0d23c9a1f463',
    messagingSenderId: '370662528090',
    projectId: 'chat-app-12d51',
    storageBucket: 'chat-app-12d51.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5MjQ5cGieu3GalInU4pbpZuTJ2J1-aug',
    appId: '1:370662528090:ios:562c72230893609da1f463',
    messagingSenderId: '370662528090',
    projectId: 'chat-app-12d51',
    storageBucket: 'chat-app-12d51.appspot.com',
    iosClientId: '370662528090-ie40n9bts1abjdqloptv136vk9990p0n.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5MjQ5cGieu3GalInU4pbpZuTJ2J1-aug',
    appId: '1:370662528090:ios:562c72230893609da1f463',
    messagingSenderId: '370662528090',
    projectId: 'chat-app-12d51',
    storageBucket: 'chat-app-12d51.appspot.com',
    iosClientId: '370662528090-ie40n9bts1abjdqloptv136vk9990p0n.apps.googleusercontent.com',
    iosBundleId: 'com.example.oneApp',
  );
}