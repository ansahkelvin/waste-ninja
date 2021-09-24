import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  String get uid => FirebaseAuth.instance.currentUser!.uid;

  void updateUserInfo(
    String email,
    String userName,
  ) async {
    final userData =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
  }
}
