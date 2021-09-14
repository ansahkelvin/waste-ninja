import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(
              "assets/images/38916-infinity-rainbow.json",
              repeat: true,
              height: 80,
              width: 100,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
