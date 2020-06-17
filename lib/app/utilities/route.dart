import 'package:flutter/material.dart';
import 'package:nyatetyuk/app/screen/home/home_page.dart';
import 'package:nyatetyuk/app/screen/login/login_page.dart';
import 'package:nyatetyuk/app/screen/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(
            child: Text('No rote defined for ${settings.name}'),
          ),
        ));
    }
  }
}

const String loginRoute = '/login';
const String homeRoute = '/homePage';