import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'core/di/service_locator.dart';
import 'core/utils/log.dart';
import 'presentation/blocs/home_bloc/home_cubit.dart';
import 'presentation/pages/home_screen.dart';
import 'presentation/widgets/double_back_to_quit.dart';
import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
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
        home: const DoubleBackToQuit(child: HomeScreen()),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
