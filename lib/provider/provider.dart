import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class AppProvider with ChangeNotifier {
  Position? userPosition;

  Future<void> setPosition(Position location) async {
    userPosition = location;
    notifyListeners();
  }
}
