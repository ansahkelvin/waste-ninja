import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class FirestoreBase {
  Future<void> addUser(String name, String email, LatLng location);
}

class FirestoreDB implements FirestoreBase {
  FirestoreDB(this.uid);
  final String uid;
//  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  // final documentReference =
  //     FirebaseFirestore.instance.collection("users").doc(uid);

  Future<void> addUser(String name, String email, LatLng location) async {
    try {
      // Users user = Users(
      //   email: email,
      //   name: name,
      // );
      //await documentReference.add(user.toMap());
    } catch (e) {
      throw e;
    }
  }
}
