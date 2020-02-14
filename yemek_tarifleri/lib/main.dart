import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'file:///C:/Users/Kadriye/Desktop/YemekTarifleri/yemek_tarifleri/lib/tasarim/bbb.dart';
import 'package:input_islemler/tasarim/loginUi.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return YemekIslemleri();
  }
}

class YemekIslemleri extends State<MyApp>
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
              Background(),
              Login()


            ],
          )
      ),
    );
  }
}

