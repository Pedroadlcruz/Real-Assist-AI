import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

/// Custom App Alerts
class Alerts {
  Alerts._();

  ///Build a [Custom Alert Dialog] base on the current Platform [IOS] and [Android]
  static Future<void> alertDialog({
    required BuildContext context,
    required String content,
    required void Function()? onOk,
  }) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Icon(
              Icons.cancel_outlined,
              color: const Color(0xff17005A),
              size: 60.dW,
            ),
            content: Text(content),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: onOk,
                  child: const Text("Ok"),
                ),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: Icon(
              Icons.cancel_outlined,
              color: const Color(0xff17005A),
              size: 60.dW,
            ),
            content: Text(content),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: onOk,
                  child: const Text("OK"),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  ///Build a [Custom Dialog] base on the current Platform [IOS] and [Android]
  static Future<Future> confirmDialog({
    required BuildContext context,
    required String title,
    required void Function()? onYes,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                onPressed: onYes,
                child: const Text("Yes"),
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: Text(title),
            actions: <Widget>[
              TextButton(
                onPressed: onYes,
                child: const Text("Yes"),
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
      },
    );
  }
}
