import 'presentation/bloc/home_bloc/home_cubit.dart';
import 'presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/constants/app_routes.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        home: BlocProvider(
            create: (context) =>
                HomeCubit(getRandomUseCase: di.sl())..getNumberTriviaRandom(),
            child: const HomeScreen()),
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AppRoutes.home:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => HomeCubit(getRandomUseCase: di.sl())
                    ..getNumberTriviaRandom(),
                  child: const HomeScreen(),
                ),
              );

            default:
              return MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => HomeCubit(getRandomUseCase: di.sl())
                    ..getNumberTriviaRandom(),
                  child: const HomeScreen(),
                ),
              );
          }
        },
      ),
    );
  }
}
