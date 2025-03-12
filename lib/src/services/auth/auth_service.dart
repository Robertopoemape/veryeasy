import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/profile_user.dart';

part 'auth_service.g.dart';

abstract class AuthService {
  ProfileUser? get currentUser;
  Future<ProfileUser?> signUp(String email, String password);
  Future<ProfileUser?> signIn(String email, String password);
  Future<ProfileUser?> signInWithGoogle();
  Future<void> signOut();
}

@riverpod
AuthService authService(Ref ref) {
  return FirebaseAuthService();
}

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  ProfileUser? get currentUser {
    final user = _auth.currentUser;
    return user != null ? ProfileUser.fromFirebaseUser(user) : null;
  }

  @override
  Future<ProfileUser?> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ProfileUser.fromFirebaseUser(userCredential.user);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ProfileUser?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return ProfileUser.fromFirebaseUser(userCredential.user);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<ProfileUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return ProfileUser.fromFirebaseUser(userCredential.user);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
