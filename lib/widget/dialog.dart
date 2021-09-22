import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> customDialog(
  BuildContext context, {
  required String contentText,
  required String title,
  required String actionText,
  required String cancelActionText,
}) async {
  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(contentText),
        actions: [
          CupertinoDialogAction(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                cancelActionText,
              ),
            ),
          ),
          CupertinoDialogAction(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                actionText,
              ),
            ),
          ),
        ],
      ),
    );
  }
  if (Platform.isAndroid) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(contentText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
              cancelActionText,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              actionText,
            ),
          ),
        ],
      ),
    );
  }
}
