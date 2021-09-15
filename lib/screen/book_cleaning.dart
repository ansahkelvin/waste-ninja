// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

class BookCleaningService extends StatefulWidget {
  const BookCleaningService({Key? key}) : super(key: key);

  @override
  _BookCleaningServiceState createState() => _BookCleaningServiceState();
}

class _BookCleaningServiceState extends State<BookCleaningService> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  double sqft = 0.0;

  bool selectedType = false;
  String? dropDownValue;

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
        context: context,
        builder: (context) => Container(
          height: 200,
          width: double.infinity,
          child: CupertinoDatePicker(
            minimumDate: DateTime.now(),
            onDateTimeChanged: (time) {
              setState(() {
                selectedDate = time;
              });
              print(selectedDate);
              if (time.day > DateTime.now().day) {}
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          "Book Service",
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
                height: 20,
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
                height: 10,
              ),
              // Container(
              //   height: 50,
              //   decoration: BoxDecoration(
              //     color: Colors.grey[200],
              //     borderRadius: BorderRadius.circular(3),
              //   ),
              //   child: TextFormField(
              //     //controller: infoController,
              //     textInputAction: TextInputAction.done,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         CupertinoIcons.mail,
              //       ),
              //       focusColor: kprimaryDeep,
              //       border: InputBorder.none,
              //       hintText: "email@com",
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Container(
                //padding: EdgeInsets.only(bottom: 10, left: 12, top: 12),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.phone,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "Contact",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cleaning Type",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15)),
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.black,
                            underline: Container(),
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                            elevation: 0,
                            value: dropDownValue,
                            onChanged: (value) {
                              setState(() {
                                dropDownValue = value;
                              });
                            },
                            items: <String>[
                              'Event Service',
                              'Home Service',
                              'Office Service',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Text(
                              "Please choose event",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: pickDateAndTime,
                            child: Text("Pick date "),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Platform.isAndroid
                  ? TextButton(
                      onPressed: selectTime,
                      child: Text("Pick Time"),
                    )
                  : Container(),
              SizedBox(height: 20),
              selectedDate != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date Chosen:",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
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
                            selectedDate.toString(),
                            style: TextStyle(color: Colors.black54),
                          )),
                        ),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 30,
              ),
              dropDownValue == null
                  ? Container()
                  : Container(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              dropDownValue!,
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
                            max: 1000,
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
                          )
                        ],
                      ),
                    ),
                    
              SizedBox(
                height: 60,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: Center(
                      child: Text(
                    "Book now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
