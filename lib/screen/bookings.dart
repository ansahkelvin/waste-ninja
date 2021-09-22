import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/provider/auth.dart';

class Bookings extends StatefulWidget {
  Bookings({Key? key}) : super(key: key);

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
      final userId = Provider.of<AuthBase>(context, listen: false).currentUser!.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookings",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection("bookings")
              .snapshots(),
          builder: (context, snapshot) {
            final data = snapshot.data!;
            if(snapshot.hasData){
            
            }
            return Column(
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
            );
          }),
    );
  }
}
