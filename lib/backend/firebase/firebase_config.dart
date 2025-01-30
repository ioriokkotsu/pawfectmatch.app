import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBwqdSGNE43oR0uS1a9GTEvQDukNgR5plk",
            authDomain: "pawfect-match-34c4f.firebaseapp.com",
            projectId: "pawfect-match-34c4f",
            storageBucket: "pawfect-match-34c4f.firebasestorage.app",
            messagingSenderId: "801692932561",
            appId: "1:801692932561:web:f0e47e69cfa0800fa528f0",
            measurementId: "G-89RVW9XFDT"));
  } else {
    await Firebase.initializeApp();
  }
}
