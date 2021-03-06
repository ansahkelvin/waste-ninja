// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/models/office_booking_model.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/provider/provider.dart';
import 'package:wasteninja/widget/container_field.dart';

import 'package:wasteninja/widget/priceRow.dart';
import 'package:wasteninja/widget/spinner.dart';
import 'package:wasteninja/widget/submit_button.dart';

class OfiiceBooking extends StatefulWidget {
  const OfiiceBooking({Key? key}) : super(key: key);

  @override
  _OfiiceBookingState createState() => _OfiiceBookingState();
}

class _OfiiceBookingState extends State<OfiiceBooking> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  double sqft = 50.0;
  final controller = TextEditingController();

  bool selectedType = false;
  double? price = 0;
  double? rate = 50;
  String? dateFormat;

  Future<void> selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
    print(selectedTime!.format(context));
  }

  String getPrice() {
    if (sqft >= 50) {
      price = (rate! * 30) / 4;
    } else if (sqft < 250) {
      price = (rate! * 50) / 50;
    } else if (sqft > 550) {
      price = (rate! * 70) / 5;
    }

    return "GHC $price";
  }

  Future<void> pickDateAndTime() async {
    if (Platform.isAndroid) {
      final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023),
      );
      if (picked != null) {
        setState(() {
          selectedDate = picked;
        });
        print(selectedDate);
      }
    } else if (Platform.isIOS) {
      showCupertinoModalPopup(
        barrierColor: Colors.white,
        context: context,
        builder: (context) => Container(
          height: 200,
          width: double.infinity,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            minimumDate: DateTime.now(),
            onDateTimeChanged: (time) {
              setState(() {
                selectedDate = time;
              });
            },
          ),
        ),
      );
    }
  }

  Future<void> submitBooking() async {
    final user = Provider.of<AuthBase>(context, listen: false).currentUser;
    final locationProvider = Provider.of<AppProvider>(context, listen: false);
    showDialog(
        context: context, builder: (context) => Spinner(text: "Booking"));
    final getUserData = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get();
    setState(() {});

    Office officeModel = Office(
      price: this.price.toString(),
      longitude: locationProvider.userPosition!.longitude,
      latitude: locationProvider.userPosition!.latitude,
      userName: getUserData["name"],
      selectedDate: selectedDate!,
      selectedTime: selectedTime!.format(context).toString(),
      officeLocation: locationProvider.placeAddress!,
      officeName: controller.text,
      officeSpace: sqft,
      userId: user.uid,
    );

    await FirebaseFirestore.instance
        .collection("office")
        .add(officeModel.toMap());
    Navigator.of(context).pop();
    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You have successfully booked the service"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final placeAddress = Provider.of<AppProvider>(context).placeAddress;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        automaticallyImplyLeading: true,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Office Booking",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Fill out the form to book",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Office Location",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ContainerField(
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.location,
                      color: kprimaryDeep,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: placeAddress == null
                        ? "loading"
                        : placeAddress.toString(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ContainerField(
                child: TextFormField(
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.bag,
                      color: kprimaryDeep,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "Name of Office",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: selectTime,
                    child: Text("Cleaning Time"),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      selectedTime == null
                          ? "Select Time"
                          : selectedTime!.format(context).toString(),
                      style: TextStyle(color: Colors.black54),
                    )),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: pickDateAndTime,
                    child: Text("Cleaning Date"),
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.year.toString()}/${selectedDate!.month.toString()}/${selectedDate!.day}",
                      style: TextStyle(color: Colors.black54),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose Place Size",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            "Office Service",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Slider(
                          value: sqft,
                          label: "${sqft.toString()} sqft",
                          min: 0,
                          divisions: 20,
                          max: 400,
                          onChanged: (value) {
                            setState(() {
                              sqft = value;
                              price = price! + sqft;
                            });
                            print(sqft.toString());
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Text(
                            "${sqft.toString()} sqft",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: kprimaryDeep),
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "Cleaning Type",
                        rightText: "Office Service",
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "Office Space",
                        rightText: "${sqft.toString()} ft",
                      ),
                      SizedBox(height: 10),
                      PriceRow(
                        leftText: "Total Price",
                        rightText: getPrice(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SubmitButton(text: "Book now", height: 45, onTap: submitBooking),
            ],
          ),
        ),
      ),
    );
  }
}
