import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/widget/priceRow.dart';

class BookingPlace extends StatefulWidget {
  BookingPlace({Key? key}) : super(key: key);

  @override
  _BookingPlaceState createState() => _BookingPlaceState();
}

class _BookingPlaceState extends State<BookingPlace> {
  
  @override
  Widget build(BuildContext context) {
    final userId =
        Provider.of<AuthBase>(context, listen: false).currentUser!.uid;
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
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection("bookings")
            .where("user_id", isEqualTo: userId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                final dt = (data['booked_date'] as Timestamp).toDate();
                final bookedDateString = "${dt.day}-${dt.month}-${dt.year}";

                return bookCards(data, bookedDateString);
              }).toList(),
            );
          } else {
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
          }
        },
      ),
    );
  }

  Padding bookCards(Map<String, dynamic> data, String bookedDateString) {
    final date = (data['booked_date'] as Timestamp).toDate();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "GHC " + data["price"].toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            PriceRow(
              leftText: "Booked Date:",
              rightText: bookedDateString,
            ),
            SizedBox(height: 10),
            PriceRow(
              leftText: "Booked Time:",
              rightText: data['booked_time'],
            ),
            SizedBox(height: 10),
            PriceRow(
              leftText: "Cleaning Type",
              rightText: data['cleaning_type'],
            ),
            SizedBox(height: 10),
            PriceRow(
              leftText: "Building Size: ",
              rightText: data['square_feet'].toString(),
            ),
            SizedBox(height: 10),
            PriceRow(
              leftText: "Place Location",
              rightText: data['user_location'],
            ),
            SizedBox(height: 10),
            date.isAfter(DateTime.now())
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {},
                      ),
                    ],
                  )
                : Container()
          ]),
        ),
      ),
    );
  }
}
