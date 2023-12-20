import 'package:flutter/material.dart';

class CustomButtonOutlined extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final void Function()? onPressed;

  const CustomButtonOutlined({
    super.key,
    this.height,
    this.width,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: Colors.blue,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
