import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/provider/auth.dart';
import 'package:wasteninja/screen/book_cleaning.dart';
import 'package:wasteninja/screen/bookings.dart';
import 'package:wasteninja/screen/landingPage.dart';
import 'package:wasteninja/screen/user_account.dart';
import 'package:wasteninja/widget/dialog.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kprimaryLight),
            margin: EdgeInsets.zero,
            accountName: Text(
              "Kelvin Ansah",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text("Kelvinansah@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1563453392212-326f5e854473?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Account",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text("Account Settings"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserAccount())),
                ),
                ListTile(
                  leading: Icon(CupertinoIcons.bell_circle),
                  title: Text("Bookings"),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bookings())),
                ),
                SizedBox(
                  height: 19,
                ),
                Text(
                  "Services",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 19,
                ),
                ListTile(
                  leading: Icon(Icons.repeat_outlined),
                  title: Text("Recycling"),
                ),
                ListTile(
                  leading: Icon(Icons.bathroom_outlined),
                  title: Text("Mobile bin sales"),
                ),
                ListTile(
                  leading: Icon(Icons.room_service_outlined),
                  title: Text("Cleaning Services"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookCleaningService(),
                    ),
                  ),
                ),
                ListTile(
                  onTap: () async {
                    final response = await customDialog(
                      context,
                      contentText: "Are you sure you want to log out",
                      title: "Confirm logout",
                      actionText: "OK",
                      cancelActionText: "CANCEL",
                    );
                    print(response);
                    if (response == true) {
                      await Provider.of<AuthBase>(context, listen: false)
                          .logout();
                      Navigator.of(context).pushReplacementNamed(
                        LandingPage.route,
                      );
                    }
                  },
                  leading: Icon(Icons.exit_to_app_outlined),
                  title: Text("Logout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
