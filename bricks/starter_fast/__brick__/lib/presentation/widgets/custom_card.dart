import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget? child;
  const CustomCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
