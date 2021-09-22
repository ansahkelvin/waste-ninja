import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/config.dart';
import 'package:wasteninja/helper/httpRequests.dart';
import 'package:wasteninja/provider/provider.dart';

class HelperMethods {
  static Future<File?> openCamera() async {
    final cameraImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (cameraImage != null) {
      File image = File(cameraImage.path);

      return image;
    }
  }

  static Future<String> getPlaceAddress(
      Position position, BuildContext context) async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    String placeName = '';
    String addressName = '';
    String requestUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    final response = await RequestAssistant.makeRequests(requestUrl);
    if (response != "failed") {
      placeName = response["results"][0]["formatted_address"];
      provider.setPlaceAddress(placeName);
      addressName = placeName;
      print(placeName);
    }
    return addressName;
  }
}
