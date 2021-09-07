import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wasteninja/models/splashModel.dart';

class SplashItems extends StatelessWidget {
  const SplashItems({Key? key, required this.model}) : super(key: key);
  final SplashModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
        vertical: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Lottie.asset(
              model.image,
              repeat: false,
            ),
            height: 400,
            width: double.infinity,
          ),
          Text(
            model.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Text(
              model.content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
