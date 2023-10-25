import '../widgets/custom_button.dart';
import '../widgets/custom_button_outlined.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const CustomTextFormField(),
            CustomButton(
              onPressed: () {
                CustomDialog.showInfo(message: "message");
              },
              child: const Text("text"),
            ),
            const CustomButton(
              onPressed: null,
              child: Text("text"),
            ),
            const CustomButtonOutlined(
              onPressed: null,
              child: Text("text"),
            ),
            CustomButtonOutlined(
              onPressed: () {},
              child: const Text("text"),
            ),
          ],
        ),
      ),
    ));
  }
}
