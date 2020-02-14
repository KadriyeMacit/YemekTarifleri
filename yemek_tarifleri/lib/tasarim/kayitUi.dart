import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:input_islemler/sayfalar/anasayfa.dart';
import 'package:input_islemler/sayfalar/register.dart';

import '../main.dart';


class Register extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final kayitEmailController = TextEditingController();
  final kayitParolaController = TextEditingController();
  final isimController = TextEditingController();
  final parolaTekrarController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.7),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text("Bir Tutam Fesleğen",
              style: TextStyle(fontSize: 20),),
          ),

          Column(
            children: <Widget>[
              ///holds email header and inputField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(right: 40, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(300))),
                            child: Padding(
                              padding: EdgeInsets.only(left: 40, right: 20, top: 0, bottom: 0),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Kadriye",
                                    suffixText: "Kullanıcı adı",
                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                controller:  isimController,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(right: 40, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(300),
                                    topRight: Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.only(left: 40, right: 20, top: 0, bottom: 0),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "kadriyemacit@gmail.com",
                                    suffixText: "E-mail adresi",
                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                controller: kayitEmailController,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),


                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(left: 40, bottom: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(300))),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 40, top: 0, bottom: 0),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "*****",
                                    prefixText: "Parola",
                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                controller: kayitParolaController,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(left: 40, bottom: 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Material(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(300),
                                    topLeft: Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 40, top: 0, bottom: 0),
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "*****",
                                    prefixText: "Parola Tekrar",
                                    hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                controller: parolaTekrarController,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),


                ],
              ),



              Padding(
                padding: EdgeInsets.only(bottom: 50),
              ),


              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Stack(
                  alignment: Alignment(1.0, 0.0),
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.7,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        gradient: LinearGradient(
                            colors: signUpGradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: InkWell(
                        child: Text("Kayıt ol",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        onTap: (){

                             if (isimController.text.trim().isNotEmpty &&
                              kayitEmailController.text.trim().isNotEmpty &&
                              kayitParolaController.text.trim().isNotEmpty &&
                              parolaTekrarController.text.trim().isNotEmpty) {

                               if (kayitParolaController.text
                                   .trim()
                                   == parolaTekrarController.text.trim())
                                 {


                                   _auth.createUserWithEmailAndPassword(
                                       email: kayitEmailController.text,
                                       password: kayitParolaController.text)
                                       .catchError((hata) =>
                                       debugPrint("HATA: " + hata.toString()));

                                   Navigator.push(context,
                                       MaterialPageRoute(builder: (context) => MyApp()));

                                 }

                               else
                               {
                                 showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return AlertDialog(
                                         title: Text("Kayıt oluşturulamadı"),
                                         content: Text("Parolalar eşleşmiyor"),
                                         actions: <Widget>[
                                           FlatButton(
                                             child: Text("Kapat"),
                                             onPressed: () {
                                               Navigator.of(context).pop();
                                             },
                                           )
                                         ],
                                       );
                                     });
                               }

                             }

                             else
                               {
                                 showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return AlertDialog(
                                         title: Text("Kayıt oluşturulamadı"),
                                         content: Text("Boş alan bırakmayınız!"),
                                         actions: <Widget>[
                                           FlatButton(
                                             child: Text("Kapat"),
                                             onPressed: () {
                                               Navigator.of(context).pop();
                                             },
                                           )
                                         ],
                                       );
                                     });
                               }


                        },
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),

                  ],
                ),
              )


            ],
          )
        ],
      ),
    );
  }
}


const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];