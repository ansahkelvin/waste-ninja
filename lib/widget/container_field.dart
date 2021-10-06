import 'package:flutter/material.dart';


class ContainerField extends StatelessWidget {
  const ContainerField({ Key? key, required this.child }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: child,
    );
  }
}