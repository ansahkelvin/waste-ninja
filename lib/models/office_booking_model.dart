import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Office {
 
  final String userId;
  final String officeLocation;
  final String officeName;
  final String selectedDate;
  final String selectedTime;
  final String price;
  final double latitude;
  final double longitude;
  final String userName;
  final double officeSpace;

  Office({
    required this.userId,
    required this.officeLocation,
    required this.officeName,
    required this.selectedDate,
    required this.selectedTime,
    required this.price,
    required this.latitude,
    required this.longitude,
    required this.userName,
    required this.officeSpace,
  });

  Map<String, dynamic> toMap() {
    return {
        "user_id": userId,
      "user_name": userName,
      "user_location": officeLocation,
      "longitude": longitude,
      "latitude": latitude,
      "booked_date": selectedDate,
      "office_name":officeName,
      "booked_time": selectedTime,
      "cleaning_type": "Office service",
      "square_feet": officeSpace,
      "price": price,
      "createdAt": Timestamp.now(),
    };
  }
}
