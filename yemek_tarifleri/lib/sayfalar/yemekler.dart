import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YemekListesi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodList();
  }
}

class FoodList extends State<YemekListesi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0EDED2), accentColor: Color(0xFFFc6076),
      ),

      home: Scaffold(
          appBar: AppBar(
            title: Text("Yemekler"),
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

                        Container(
                            width: 220,
                            height: 150,
                            child: Image.asset("resimler/yemeeek.png")
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:3),
                          child: Text(
                            "Yemeğin ismi:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFFc6076),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:3),
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF0EDED2),
                                  width: 2
                                ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "Menemen",
                              ),
                            ),
                          )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:3),
                          child: Text(
                            "Malzemeler:",
                            style: TextStyle(
                              fontSize: 16,
                                color: Color(0xFFFc6076),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.only(top:3),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFF0EDED2),
                                    width: 2
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0) //                 <--- border radius here
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    "1 kuru soğan, 2 domates"
                                ),
                              ),
                            )
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:3),
                          child: Text(
                            "Yapılışı:",
                            style: TextStyle(
                              fontSize: 16,
                                color: Color(0xFFFc6076),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.only(top:3),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xFF0EDED2)
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0) //                 <--- border radius here
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                    "Soğanları ince ince doğrayıp "
                                        "salça ile beraber tavada kızartıyoruz."
                                ),
                              ),
                            )
                        ),


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