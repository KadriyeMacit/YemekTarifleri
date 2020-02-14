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
      theme: ThemeData(
          primaryColor: Color(0xFF0EDED2), accentColor: Color(0xFFFc6076)),

      home: Scaffold(
          appBar: AppBar(
            title: Text("Yeni Tarif"),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                          "Resim eklemek için tıklayın",
                        textAlign: TextAlign.center,
                      ),

                      Container(
                        width: 220,
                          height: 170,
                          child: Image.asset("resimler/yemeeek.png")
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:3),
                        child: Text(
                            "Malzemeler:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:3),
                        child: TextField(
                                maxLines: 3,
                              decoration: InputDecoration(
                                hintText: ("1 kuru soğan, "
                                    "2 domates"),

                                border: OutlineInputBorder(
                                  //dışını kutu içine alır
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10))),

                              ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:3),
                        child: Text(
                            "Yapılışı:",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:3),
                        child: TextField(
                            maxLines: 5,
                          decoration: InputDecoration(
                            hintText: ("Soğanları ince ince doğrayıp "
                                "salça ile beraber tavada kızartıyoruz."),

                            border: OutlineInputBorder(
                              //dışını kutu içine alır
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),

                        ),

                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RaisedButton(
                          child: Text("Kaydet"),
                          color: Color(0xFFFc6076),
                          onPressed: (){

                          },
                        ),
                      )



                    ],
                  ),
                ),
              ),
            )



          )
      ),
    );
  }
}


const List<Color> koyuRenk = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> acikRenk = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];