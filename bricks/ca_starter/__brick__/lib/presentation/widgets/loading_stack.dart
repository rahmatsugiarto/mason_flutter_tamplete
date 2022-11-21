import 'custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';

class LoadingStack extends StatelessWidget {
  final bool isLoading;
  final Widget widget;

  const LoadingStack({
    Key? key,
    this.isLoading = false,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        _handleLoadingDialog(context),
      ],
    );
  }

  Widget _handleLoadingDialog(BuildContext context) {
    if (isLoading) {
      Future.delayed(
        Duration.zero,
        () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext diaContext) {
              return const SimpleDialog(
                backgroundColor: Colors.white,
                children: [
                  Center(child: CustomCircularProgressIndicator()),
                  SizedBox(height: 10),
                  Center(
                    child: Text('Loading...'),
                  ),
                ],
              );
            },
          );
        },
      );
      return const SizedBox();
    } else {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.of(context).pop();
        },
      );
      return const SizedBox();
    }
  }
}
