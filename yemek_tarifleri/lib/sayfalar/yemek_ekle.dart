import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YemekSayfasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodPage();
  }
}

class FoodPage extends State<YemekSayfasi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green[300], accentColor: Colors.orange),

      home: Scaffold(
          appBar: AppBar(
            title: Text("Yeni Tarif"),
          ),

          body: SingleChildScrollView(

          )
      ),
    );
  }
}
