import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class AppProvider with ChangeNotifier {
  Position? userPosition;
  String? placeAddress;
  String? userName;
  String? userEmail;

  Future<void> setPosition(Position location) async {
    userPosition = location;
    notifyListeners();
  }

  Future<void> setPlaceAddress(String address) async {
    placeAddress = address;
    notifyListeners();
  }

  Future<void> setUserInfo(String email, String name) async {
    userEmail = email;
    userName = name;
    notifyListeners();
  }
  
}
