import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'custom_circular_progress_indicator.dart';

class CustomDialogLoading {
  static void show() => SmartDialog.showLoading(
        builder: (context) {
          return Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomCircularProgressIndicator(),
                SizedBox(height: 10.0),
                Text(
                  "Loading",
                ),
              ],
            ),
          );
        },
      );

  static void dismiss() => SmartDialog.dismiss();
}
