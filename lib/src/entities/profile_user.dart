import 'package:firebase_auth/firebase_auth.dart';

class ProfileUser {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;

  ProfileUser({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
  });

  factory ProfileUser.fromFirebaseUser(User? user) {
    if (user == null) throw ArgumentError("User cannot be null");
    return ProfileUser(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoURL: user.photoURL,
    );
  }
}
