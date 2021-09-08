import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/screen/bookings.dart';
import 'package:wasteninja/screen/homePage.dart';
import 'package:wasteninja/screen/user_account.dart';

class BottomController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingNavBar(
        color: Colors.white,
        selectedIconColor: Colors.green,
        unselectedIconColor: Colors.grey,
        items: [
          FloatingNavBarItem(
            iconData: CupertinoIcons.home,
            page: HomePage(),
            title: 'Home',
          ),
          FloatingNavBarItem(
            iconData: CupertinoIcons.doc_on_clipboard,
            page: Bookings(),
            title: 'Bookings',
          ),
          FloatingNavBarItem(
            iconData: CupertinoIcons.person,
            page: UserAccount(),
            title: 'Account',
          ),
        ],
        horizontalPadding: 30.0,
        hapticFeedback: true,
        showTitle: false,
      ),
    );
  }
}
