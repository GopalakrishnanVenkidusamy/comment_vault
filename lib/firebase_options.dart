import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

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

// static const FirebaseOptions ios = FirebaseOptions(
//   apiKey: 'AIzaSyCCM7HloaBR-ssXimYx9m3NmxeKMJad0CQ',
//   appId: '1:389273765439:ios:65d19d07702512e3c3da8a',
//   messagingSenderId: '383294896292',
//   projectId: 'com.bala.tracker',
//   storageBucket: 'bala-expense-tracker.appspot.com',
//   iosClientId: '335311491157-c5flgeet9q75j3nrujvpjp21hljn7f5c.apps.googleusercontent.com',
//   iosBundleId: 'com.bala.tracker',
// );

}

