import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteninja/helper/color.dart';
import 'package:wasteninja/screen/loginPage.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Enter email",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                  fullscreenDialog: true,
                ),
                (route) => false,
              );
            },
            icon: Icon(
              CupertinoIcons.arrow_left,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Icon(
                Icons.mail_outline,
                size: 90,
                color: kprimaryDeep,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 10, top: 12),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    focusColor: kprimaryDeep,
                    border: InputBorder.none,
                    hintText: "Enter your email address",
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 500,
                ),
                height: 55,
                width: 350,
                decoration: BoxDecoration(
                  color: kprimaryDeep,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
