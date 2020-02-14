import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:input_islemler/sayfalar/bbb.dart';
import 'package:input_islemler/tasarim/loginUi.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return InputIslemleri();
  }
}

class InputIslemleri extends State<MyApp>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          primaryColor: Colors.orange[800],
          accentColor: Colors.orange
      ),

      home: Scaffold(

          body:   Stack(
            children: <Widget>[
              Login(),
              Background()

            ],
          )
      ),
    );
  }
}

