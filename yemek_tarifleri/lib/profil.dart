import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilSayfasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePage();
  }
}

class ProfilePage extends State<ProfilSayfasi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.green[300], accentColor: Colors.orange),

      home: Scaffold(
        appBar: AppBar(
          title: Text("Profilim"),
        ),


        body: Column(
            children: <Widget>[

                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("resimler/anime_b.png")
                  )



            ],
          ),
      ),
    );
  }
}
