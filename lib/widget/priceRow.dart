import 'package:flutter/material.dart';

class PriceRow extends StatelessWidget {
  const PriceRow({
    Key? key,
    required this.leftText,
    required this.rightText,
  }) : super(key: key);
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText),
        SizedBox(
          width: 40,
        ),
        Expanded(child: Text(rightText, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
