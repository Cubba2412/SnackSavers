import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCTzMwQ2Ggjr0JXXhae353bpu7CJcSnuMk",
            authDomain: "snacksavers-6300d.firebaseapp.com",
            projectId: "snacksavers-6300d",
            storageBucket: "snacksavers-6300d.appspot.com",
            messagingSenderId: "445595031900",
            appId: "1:445595031900:web:b27f6b6d601d0d8fa68999",
            measurementId: "G-Z3LFDV88S3"));
  } else {
    await Firebase.initializeApp();
  }
}
