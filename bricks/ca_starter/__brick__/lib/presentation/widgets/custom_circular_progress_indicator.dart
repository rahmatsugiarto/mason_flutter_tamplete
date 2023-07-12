import 'package:flutter/material.dart';

import '../../common/resources/colors.gen.dart';

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
