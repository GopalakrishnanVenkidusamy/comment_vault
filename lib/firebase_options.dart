import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {

  static const FirebaseOptions android =  FirebaseOptions(
    apiKey: 'AIzaSyB4wn2fimCDgg86HQYnfoMtC2b6tNWmR5w',
    appId: '1:867308386698:android:bfc8fd6a7270b1bd30f073',
    projectId: 'commentvault',
    storageBucket: 'commentvault.appspot.com',
    messagingSenderId: '',
  );


  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
      //  return ios;
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}

