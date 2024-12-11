import 'package:testflutter/app/resources/language_manager.dart';
import 'package:testflutter/app/resources/routes_manager.dart';
import 'package:testflutter/presentation/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getLocal();
    super.didChangeDependencies();
  }

  void _getLocal() {
    context.setLocale(vietnamLocal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        //routes: Routes.routes,
      );
  }
}
