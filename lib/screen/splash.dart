import 'package:flutter/material.dart';
import 'package:wasteninja/models/splashModel.dart';
import 'package:wasteninja/widget/pageItems.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController pageViewController;
  late SplashData splashData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              PageView(
                controller: pageViewController,
                physics: ClampingScrollPhysics(),
                children: [
                  // ListView.builder(
                  //   itemBuilder: (context, index) => SplashItems(
                  //     model: splashData,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
