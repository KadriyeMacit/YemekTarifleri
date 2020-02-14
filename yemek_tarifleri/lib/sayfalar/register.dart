import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:input_islemler/tasarim/ccc.dart';
import 'package:input_islemler/tasarim/kayitUi.dart';



class Kayit extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return KayitIslemleri();
  }
}

class KayitIslemleri extends State<Kayit>
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
              BackgroundRegister(),
              Register()

            ],
          )
      ),
    );
  }
}

