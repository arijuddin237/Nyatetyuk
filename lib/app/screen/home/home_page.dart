import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nyatetyuk/app/bloc/firebase_bloc.dart';
import 'package:nyatetyuk/data/model.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  final GoogleSignIn googleSignInsignIn;

  const HomePage({Key key, this.user, this.googleSignInsignIn}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TaskModel> tasks = [
    TaskModel(title: 'Task1', detailTask: ['detail1', 'detail2', 'detail3']),
    TaskModel(title: 'Task2', detailTask: []),
    TaskModel(title: 'Task3', detailTask: ['detailTask3-1', 'detailTask3-2'])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: (){
              print('setting');
              //-TODO: show setting
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'assets/support-notes-colour-400px.png'
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    //fillColor: Color.fromRGBO(231, 231, 231, 1)
                  ),
                ),
                /*yPadding(
                  padding: const EdgeInsets.only(
                    top: 16
                  ),
                  child: Container(
                    height: 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: tasks.length,
                      itemBuilder: (context, index){
                        return Container(
                          width: double.infinity,
                          height: 10,
                          child: Row(
                            children: <Widget>[
                              Checkbox(value: null, onChanged: null),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text('- '+tasks[index].title, style: TextStyle(
                                  fontWeight: FontWeight.bold
                                )),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )*/
              ],
            ),
          )
        ],
      )
    );
  }
}