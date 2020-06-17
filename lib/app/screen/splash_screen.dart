import 'package:flutter/material.dart';
import 'package:nyatetyuk/app/utilities/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  _handlerTapEvent() {
    Navigator.pushReplacementNamed(context, homeRoute);
    //Navigator.pushNamed(context, loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), _handlerTapEvent);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .8
            ),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}