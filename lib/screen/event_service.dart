import 'package:flutter/material.dart';

class EventService extends StatefulWidget {
  EventService({Key? key}) : super(key: key);

  @override
  _EventServiceState createState() => _EventServiceState();
}

class _EventServiceState extends State<EventService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0.0,
        title: Text(
          "Event Service",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }
}
