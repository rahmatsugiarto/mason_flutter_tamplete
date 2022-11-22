import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/pages/home_screen.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, __) => MaterialApp(
        title: 'Starter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
