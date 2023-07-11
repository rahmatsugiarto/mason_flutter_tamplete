import 'package:flutter/material.dart';

import 'common/constants/app_routes.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/pages/second_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.secondScreen:
      return MaterialPageRoute(builder: (_) => const SecondScreen());

    default:
      return MaterialPageRoute(builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text(
              "PAGE NOT FOUND",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      });
  }
}
