import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteninja/models/user.dart';
import 'package:wasteninja/provider/auth.dart';

abstract class FirestoreBase {
  Future<void> addUser(String name, String email, LatLng location);
}

class FirestoreDB implements FirestoreBase {
  FirestoreDB({required this.uid});
   late String uid;
//  final currentUserId = FirebaseAuth.instance.currentUser!.uid;





  Future<void> addUser(String name, String email, LatLng location) async {
    try {
     
    } catch (e) {
      throw e;
    }
  }
}
