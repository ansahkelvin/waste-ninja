import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteninja/models/user.dart';

abstract class AuthBase {
  User? get currentUser;
  String get uid;
  Stream<User?> onAuthChange();
  Future<User?> signIn(
    String email,
    String password,
  );
  Future<User?> createUserAccount(
    String email,
    String password,
    LatLng location,
    String name,
  );
}

class Auth implements AuthBase {
  final _firebaseInstance = FirebaseAuth.instance;

  User? get currentUser => _firebaseInstance.currentUser;
  String get uid => _firebaseInstance.currentUser!.uid;

  Stream<User?> onAuthChange() => _firebaseInstance.authStateChanges();
  Future<User?> createUserAccount(
      String email, String password, LatLng location, String name) async {
    try {
      final UserCredential firebaseUser =
          await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final reference = FirebaseFirestore.instance
          .collection("users/${firebaseUser.user!.uid}");
      Users userData = Users(
        email: email,
        name: name,
        location: location,
      );
      await reference.add(userData.toMap());

      return firebaseUser.user;
    } catch (e) {
      throw e;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential firebaseUser =
          await _firebaseInstance.signInWithCredential(
        EmailAuthProvider.credential(
          email: email,
          password: password,
        ),
      );
      return firebaseUser.user;
    } catch (e) {
      throw e;
    }
  }
}
