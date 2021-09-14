import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Bookings extends StatefulWidget {
  Bookings({Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 39,
          ),
          SizedBox(
            height: 300,
            child: SvgPicture.asset(
              "assets/images/undraw_inbox_cleanup_w2ur.svg",
            ),
          ),
          SizedBox(
            height: 39,
          ),
          Text(
            "You have no bookings",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}