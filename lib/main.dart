import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:workmate/core/config/app_config.dart';
import 'package:toastification/toastification.dart';
import 'core/di/injection_container.dart';
import 'core/presentation/design_system/theme/workmate_theme.dart';
import 'core/presentation/routes/config/app_startup_service.dart';
import 'core/presentation/routes/route_generator.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await AppConfig.init();
  await setupDependencies();
  await sl<AppStartupService>().initialize();
  FlutterNativeSplash.remove();

  runApp(
    ToastificationWrapper(
      child: EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'WorkMate',
      theme: WorkMateTheme.light(),
      darkTheme: WorkMateTheme.dark(),
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}