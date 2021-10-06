import 'package:flutter/material.dart';
import 'package:wasteninja/helper/color.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.text,
    required this.height,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: kprimaryDeep,
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }
}
