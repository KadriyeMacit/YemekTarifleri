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


        body: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

              children: <Widget>[

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage("resimler/anime_b.png"),
                            ),
                          ],
                        ),
                      ),
                    ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 10, 35, 10),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: ("Bir Tutam Fesleğen"),

                        border: OutlineInputBorder(  //dışını kutu içine alır
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))
                        ),
                      ),
                    textAlign: TextAlign.center,
                  ),
                ),
                

                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ("Yemek yapmayı ve yeni lezzetler denemeyi"
                          "çok seviyorum. Sağlıklı beslenmeye dikkat ederek,"
                          "doğal besinler tüketmeye çalışıyorum."),
                      hintMaxLines: 400,

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10))
                      ),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,

                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 100,
                        child: Column(
                          children: <Widget>[
                           Image.asset("resimler/insta.png"),
                            Text("/birtutamfeslegen",
                                style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: 100,
                        child: Column(
                          children: <Widget>[
                            Image.asset("resimler/you.png"),
                            Text("/birtutamfeslegen",
                            style: TextStyle(fontSize: 12),)
                          ],
                        ),
                      ),
                    )



                  ],
                )


              ],
            ),
        ),
      ),
    );
  }
}
