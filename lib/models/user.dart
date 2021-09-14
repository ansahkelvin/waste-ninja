import 'package:google_maps_flutter/google_maps_flutter.dart';

class Users {
  String? name;
  String? email;

  Users({
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
     
    };
  }

  Users.fromMap(Map<String, dynamic> jsonData) {
    name = jsonData["name"];
    email = jsonData["email"];
   
  }
}
