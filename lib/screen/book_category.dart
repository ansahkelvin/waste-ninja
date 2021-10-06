import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/screen/office_booking.dart';
import 'package:wasteninja/widget/container.dart';

class BookingCategory extends StatelessWidget {
  const BookingCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cleaning Type",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Text(
                      "Select Category",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(
                height: 30,
              ),
              MaterialContainer(
                color: Colors.yellow[700]!,
                icon: CupertinoIcons.house_alt,
                text: "Home Service",
                subText:
                    "Book your home services to get your apartment cleaned",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingCategory(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialContainer(
                color: Colors.orangeAccent,
                icon: CupertinoIcons.briefcase,
                text: "Office Cleaning",
                subText:
                    "Select your square meters and get all your office space cleaned.",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OfiiceBooking(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialContainer(
                color: Colors.green[200]!,
                icon: CupertinoIcons.play_circle,
                text: "Event Cleaning",
                subText: "Choose your event type and make it clean !!",
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingCategory(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
