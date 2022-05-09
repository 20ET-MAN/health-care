import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_theme.dart';
import 'package:healthcare/src/presentation/controller/auth_service_controller.dart';
import 'package:healthcare/src/presentation/route/routes.gr.dart';
import 'package:healthcare/src/presentation/widget/custom_animation.dart';
import 'package:provider/provider.dart';

GetIt getIt = GetIt.instance;

final _appRouter = AppRouter();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getIt.registerSingleton<AppRouter>(AppRouter());
  configLoading();
  runApp(
    const App(),
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColor.colorOrange
    ..backgroundColor = AppColor.colorWhile
    ..indicatorColor = AppColor.colorOrange
    ..textColor = AppColor.colorOrange
    ..maskColor = Colors.blue.withOpacity(0.05)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthServiceController()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser: _appRouter.defaultRouteParser(),
        darkTheme: AppThemes().buildDarkTheme(),
        theme: AppThemes().buildLightTheme(),
      ),
    );
  }
}
