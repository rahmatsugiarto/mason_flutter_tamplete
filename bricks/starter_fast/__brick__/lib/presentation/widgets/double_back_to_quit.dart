import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_toast.dart';

class DoubleBackToQuit extends StatelessWidget {
  final Widget child;
  const DoubleBackToQuit({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime ?? now) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          
          CustomToast.showToast(message: "Tekan lagi Untuk Keluar");
          return;
        }
        SystemNavigator.pop();
      },
      child: child,
    );
  }
}
