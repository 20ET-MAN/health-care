import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:healthcare/src/presentation/config/app_theme.dart';
import 'package:healthcare/src/presentation/screens/splash_screen.dart';
//import 'package:healthcare/src/presentation/config/routes.gr.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //getIt.registerSingleton<AppRouter>(AppRouter());
  runApp(const MyApp());
}

//final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      // routerDelegate: AutoRouterDelegate(_appRouter),
      //routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes().buildDarkTheme(),
      theme: AppThemes().buildLightTheme(),
    );
  }
}
