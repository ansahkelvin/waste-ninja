class Users {
  String? name;
  String? email;
  String? latitude;
  String? longitude;

  Users({
    this.name,
    this.email,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "latitude": this.latitude,
      "longitude": this.longitude,
    };
  }

  Users.fromMap(Map<String, dynamic> jsonData) {
    name = jsonData["name"];
    email = jsonData["email"];
    latitude = jsonData["latitude"];
    longitude = jsonData["longitude"];
  }
}
