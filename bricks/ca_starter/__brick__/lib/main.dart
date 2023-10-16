import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'core/utils/log.dart';
import 'injection_container.dart' as di;
import 'presentation/bloc/home_bloc/home_cubit.dart';
import 'presentation/pages/home_screen.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(getRandomUseCase: di.sl()),
        ),
      ],
      child: MaterialApp(
        title: 'Starter',
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
