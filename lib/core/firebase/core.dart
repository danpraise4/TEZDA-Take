import 'package:firebase_core/firebase_core.dart';

class FirebaseCore {
  static create() async {
    await Firebase.initializeApp();
  }
}
