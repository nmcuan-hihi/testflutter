import 'package:testflutter/app/configs/route_name.dart';
import 'package:testflutter/presentation/login_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static final routes = <String, WidgetBuilder>{
    RouteName.loginScreen: (BuildContext context) => const LoginScreen(),
  };
}
