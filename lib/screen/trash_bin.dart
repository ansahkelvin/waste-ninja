import 'package:flutter/material.dart';


class BuyBins extends StatefulWidget {
  const BuyBins({ Key? key }) : super(key: key);

  @override
  _BuyBinsState createState() => _BuyBinsState();
}

class _BuyBinsState extends State<BuyBins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trash Bin",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}