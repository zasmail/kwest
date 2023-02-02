import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class KwestFirebaseUser {
  KwestFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

KwestFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<KwestFirebaseUser> kwestFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<KwestFirebaseUser>(
      (user) {
        currentUser = KwestFirebaseUser(user);
        return currentUser!;
      },
    );
