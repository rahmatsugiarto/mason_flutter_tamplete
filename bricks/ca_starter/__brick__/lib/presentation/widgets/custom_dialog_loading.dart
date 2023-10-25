import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/constants/app_constants.dart';
import 'custom_circular_progress_indicator.dart';

class CustomDialogLoading {
  static void show() => SmartDialog.show(
        keepSingle: true,
        clickMaskDismiss: false,
        animationType: SmartAnimationType.fade,
        tag: AppConstants.tagDialog.tagDialogLoading,
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircularProgressIndicator(),
                SizedBox(height: 10.0),
                Text(
                  "Loading",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        },
      );

  static void dismiss() => SmartDialog.dismiss(
        tag: AppConstants.tagDialog.tagDialogLoading,
      );
}
