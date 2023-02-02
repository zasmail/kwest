import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA_aQC02-XJapGfxKxGInf3sqq78B2fJe4",
            authDomain: "kwest-766e9.firebaseapp.com",
            projectId: "kwest-766e9",
            storageBucket: "kwest-766e9.appspot.com",
            messagingSenderId: "415086576716",
            appId: "1:415086576716:web:4abc4a22a6e29bfda0e0e9",
            measurementId: "G-50WRRY6RZ2"));
  } else {
    await Firebase.initializeApp();
  }
}
