import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../core/resources/text_styles.dart';

class CustomToast {
  static showToast({required String message}) => SmartDialog.showToast(
        "",
        builder: (context) {
          return Container(
            margin: const EdgeInsets.only(bottom: 40),
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: TextStyles.pop12W400(
                color: Colors.white,
              ),
            ),
          );
        },
      );
}
