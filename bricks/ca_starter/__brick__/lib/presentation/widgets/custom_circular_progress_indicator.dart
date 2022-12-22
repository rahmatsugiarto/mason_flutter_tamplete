import 'package:example_clean_architecture/common/resources/colors.gen.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: ColorName.lightBlue,
      valueColor: AlwaysStoppedAnimation<Color>(
        ColorName.babyBlue,
      ),
    );
  }
}
