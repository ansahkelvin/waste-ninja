import 'package:flutter/material.dart';

class CheckBoxList extends StatelessWidget {
  const CheckBoxList({Key? key, required this.onSelect}) : super(key: key);
  final Function onSelect;
  final bool onValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (value) {},
          value: onValue,
        ),
        
      ],
    );
  }
}
