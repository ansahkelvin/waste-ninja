import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/provider/provider.dart';
import 'package:wasteninja/screen/home_service.dart';
import 'package:wasteninja/widget/container_field.dart';
import 'package:wasteninja/widget/priceRow.dart';
import 'package:wasteninja/widget/submit_button.dart';

class EventService extends StatefulWidget {
  EventService({Key? key}) : super(key: key);

  @override
  _EventServiceState createState() => _EventServiceState();
}

class _EventServiceState extends State<EventService> {
  final eventLocation = TextEditingController();
  final placeAddress = TextEditingController();
  final numOfDays = TextEditingController();
  String? eventType;
  double sqft = 50.0;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? dateFormat;

  HouseType homeType = HouseType.oldHome;

  Future<void> selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
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

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          "Event Service",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Event Location",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ContainerField(
                child: TextField(
                  controller: eventLocation,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.room,
                      color: Colors.green,
                    ),
                    hintText: location.placeAddress!,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ContainerField(
                child: TextField(
                  controller: placeAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.location_city_outlined,
                      color: Colors.green,
                    ),
                    hintText: "Place Address",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ContainerField(
                child: TextField(
                  controller: numOfDays,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.event_available_outlined,
                      color: Colors.green,
                    ),
                    hintText: "Number of Days",
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
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
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                ),
                child: DropdownButton<String>(
                  iconEnabledColor: Colors.black,
                  underline: Container(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  elevation: 0,
                  value: eventType,
                  onChanged: (value) {
                    setState(() {
                      eventType = value;
                    });
                  },
                  items: <String>[
                    'Wedding',
                    'Party',
                    'School Event',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text(
                    "Choose Event Type",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
              ),
              SizedBox(
                height: 30,
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
                        rightText: "getPrice()",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SubmitButton(
                text: "Book now",
                height: 45,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
