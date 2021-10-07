import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/provider/provider.dart';
import 'package:wasteninja/widget/container_field.dart';
import 'package:wasteninja/widget/priceRow.dart';

enum HouseType { oldHome, newlyBuilt }

class HomeService extends StatefulWidget {
  HomeService({Key? key}) : super(key: key);

  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  final locationController = TextEditingController();
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
    print(selectedTime!.format(context));
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

  @override
  Widget build(BuildContext context) {
    final location = Provider.of<AppProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          "Home Service",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 18.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Home Location",
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
                  controller: locationController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.location_city_outlined,
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
                  controller: locationController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.room,
                      color: Colors.green,
                    ),
                    hintText: "Home Address",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ContainerField(
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.home_outlined,
                      color: Colors.green,
                    ),
                    hintText: "Number of bedrooms",
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
              Text(
                "Home Type",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                title: Text("Regular Home"),
                leading: Radio<HouseType>(
                  value: HouseType.oldHome,
                  groupValue: homeType,
                  onChanged: (value) {
                    setState(() {
                      homeType = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("Post Construction"),
                leading: Radio<HouseType>(
                  value: HouseType.newlyBuilt,
                  groupValue: homeType,
                  onChanged: (value) {
                    setState(() {
                      homeType = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              homeType.index == 0
                  ? Container(
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
                              rightText: "Home Service",
                            ),
                            SizedBox(height: 10),
                            PriceRow(
                              leftText: "Home Type",
                              rightText: homeType.index == 0
                                  ? "Regular"
                                  : "Post Construction",
                            ),
                            SizedBox(height: 10),
                            PriceRow(
                              leftText: "Total Price",
                              rightText: "GHC 450",
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      child: Text(
                        "Press on make enquires button to find more about the price of your booking request",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      homeType.index == 0 ? "Book now" : "Make Enquires",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
