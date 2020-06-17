import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nyatetyuk/app/bloc/firebase_bloc.dart';
import 'package:nyatetyuk/app/screen/home/home_page.dart';
import 'package:nyatetyuk/app/utilities/text_style.dart';
import 'package:nyatetyuk/app/utilities/route.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Login', style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold
        )),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/unlock-1200px.png',
              width: 247, 
              height: 326,
            )
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20
            ),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('Sign In', style: FontStyle.loginTitle),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16
                    ),
                    child: SizedBox(
                      //width: double.infinity,
                      width: MediaQuery.of(context).size.width - 100,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color.fromRGBO(231, 231, 231, 1),
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/facebook_icon.png',
                                        width: 50,
                                        height: 50,
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Connect With Facebook', style: TextStyle(
                                          color: Color.fromRGBO(58, 85, 159, 1)
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              onPressed: (){
                                print('null');
                              },
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              color: Color.fromRGBO(231, 231, 231, 1),
                              elevation: 0.0,
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/google_icon.png',
                                        width: 50,
                                        height: 50,
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Connect With Google', style: TextStyle(
                                          color: Color.fromRGBO(234, 66, 53, 1)
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              onPressed: (){
                                firebaseBloc.sign().then((data){
                                  Navigator.pushReplacementNamed(context, homeRoute);
                                }).catchError((e){
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: Text(e.toString()),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('Close'),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    }
                                  );
                                });
                              },
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Well never post without your permission', style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey
                            ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0
                        ),
                        child: Text('OR', style: TextStyle(
                          fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold
                        )),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      height: 300,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'Email'
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: Icon(Icons.visibility_off)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16, left: 8.0, right: 8.0
                            ),
                            child: RaisedButton(
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: Center(
                                  child: Text('SIGN IN', style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white
                                  )),
                                ),
                              ),
                              onPressed: (){
                                print('test');
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16
                                ),
                                child: FlatButton(
                                  child: Text('Register', style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green
                                  )),
                                  onPressed: (){
                                    print('Test Register');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 16
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    print('test');
                                  },
                                  child: Text('Forgot Password?', style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.green
                                  ),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}