import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteninja/models/user.dart';

abstract class FirestoreBase {
  Future<void> getUserData();
}

class FirestoreDB implements FirestoreBase {
  FirestoreDB(this.uid);
  final String uid;
  String? name;
  String? email;

  Future<void> getUserData() async {
    final data = FirebaseFirestore.instance.doc("users/$uid").get();
    data.then((value) {
      name = value["name"];
      email = value["email"];
    });
  }
}
