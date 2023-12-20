import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/constants/app_constants.dart';
import 'custom_button.dart';

class CustomDialog {
  static showInfo({required String message}) {
    return SmartDialog.show(
      tag: AppConstants.tagDialog.tagDialog,
      animationType: SmartAnimationType.fade,
      builder: (context) {
        return Container(
          width: 280,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Info",
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24.0,
              ),
              const CustomButton(
                width: 150,
                onPressed: dismiss,
                child: Text("OK"),
              )
            ],
          ),
        );
      },
    );
  }

  static void dismiss() => SmartDialog.dismiss(
        tag: AppConstants.tagDialog.tagDialog,
      );
}
