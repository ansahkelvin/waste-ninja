import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/helper/color.dart';

class BookCleaningService extends StatefulWidget {
  const BookCleaningService({Key? key}) : super(key: key);

  @override
  _BookCleaningServiceState createState() => _BookCleaningServiceState();
}

class _BookCleaningServiceState extends State<BookCleaningService> {
  late DateTime selectedDate;
  bool selectedType = false;
  String? dropDownValue;

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
              Text(
                "Fill out the form to book",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 17,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  //controller: infoController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                    ),
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "email@com",
                  ),
                ),
              ),
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
                    hintText: "Phone Number",
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
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Platform.isIOS
                  ? Container(
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
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
