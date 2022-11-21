import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


customDialog({
  required BuildContext context,
  required String title,
  required String message,
  List<Widget> action = const <Widget>[],
  bool willPopScope = false,
}) {
  if (Platform.isIOS) {
    Future.delayed(
      Duration.zero,
      () {
        showCupertinoDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            if (willPopScope == false) {
              return CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: action,
              );
            } else {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  title: Text(title),
                  content: Text(message),
                  actions: action,
                ),
              );
            }
          },
        );
      },
    );
  } else {
    Future.delayed(
      Duration.zero,
      () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            if (willPopScope == false) {
              return AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                title: Text(title),
                content: Text(message),
                actions: action,
              );
            } else {
              return WillPopScope(
                onWillPop: () => Future.value(false),
                child: AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  title: Text(title),
                  content: Text(message),
                  actions: action,
                ),
              );
            }
          },
        );
      },
    );
  }
}
