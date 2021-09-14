import 'package:google_maps_flutter/google_maps_flutter.dart';

class Users {
  String? name;
  String? email;
  LatLng? location;

  Users({
    this.name,
    this.email,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "location": this.location,
    };
  }

  Users.fromMap(Map<String, dynamic> jsonData) {
    name = jsonData["name"];
    email = jsonData["email"];
    location = jsonData["location"];
   
  }
}
