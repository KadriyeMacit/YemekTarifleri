import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:input_islemler/sayfalar/anasayfa.dart';
import 'package:input_islemler/sayfalar/register.dart';


class Login extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final parolaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
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
                          padding: EdgeInsets.only(right: 40, bottom: 15, top:10),
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
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Kullanıcı adı",
                                      hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                  controller: emailController,
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
                          padding: EdgeInsets.only(right: 40, bottom: 0),
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
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Parola",
                                      hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
                                  controller: parolaController,
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
                            colors: signInGradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: InkWell(
                        child: Text("Haydi başla!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                        onTap: (){
                          _auth.signInWithEmailAndPassword
                            (email: emailController.text
                              , password: parolaController.text)
                              .then((oturumAcildi){
                            // then() ile giriş işlemi yapıldıktan sonra sayfa geçişini sağlıyoruz
                            debugPrint("Giriş başarılı");

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Anasayfa()
                            ));
                          })
                              .catchError((hata) => debugPrint("Hata: "+ hata.toString()));
                        },
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),

                  ],
                ),
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
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Kayit()
                          ));
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