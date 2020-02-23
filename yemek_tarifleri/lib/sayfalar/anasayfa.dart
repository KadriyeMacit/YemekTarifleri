import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:input_islemler/main.dart';
import 'file:///C:/Users/Kadriye/Desktop/YemekTarifleri/yemek_tarifleri/lib/sayfalar/profil.dart';
import 'file:///C:/Users/Kadriye/Desktop/YemekTarifleri/yemek_tarifleri/lib/sayfalar/yemek_ekle.dart';
import 'package:input_islemler/tasarim/loginUi.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<Anasayfa> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0EDED2), accentColor: Color(0xFFFc6076)),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Anasayfa",
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Kadriye Macit"),
                  accountEmail: Text("kadriyemacit9655@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("resimler/anime_a.png"),
                  ),
                ),
                ListTile(
                  title: Text('Anasayfa'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Anasayfa()));
                  },
                ),
                ListTile(
                  title: Text('Profilim'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilSayfasi()));
                  },
                  leading: Icon(Icons.person),
                ),
                ListTile(
                  title: Text('Çıkış yap'),
                  onTap: () {
                    _auth.signOut().then((oturumKapatildi) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    });
                  },
                  leading: Icon(Icons.remove_circle),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YemekSayfasi()));
            },
          ),
          body: StreamBuilder(
            stream: Firestore.instance.collection("post").snapshots(),
            builder: (context, snaphot) {
              if (!snaphot.hasData) {
                const Text("Yükleniyor");
              } else {
                return ListView.builder(
                    itemCount: snaphot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot mypost = snaphot.data.documents[index];



                      Future<void> _showChoiseDialog(BuildContext context) {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text(
                                    "Silmek istediğinize emin misiniz?",
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  content: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              var silenecek_veri = Firestore
                                                  .instance
                                                  .collection('post')
                                                  .document(mypost.documentID)
                                                  .delete();

                                              debugPrint("$silenecek_veri");

                                              debugPrint("Veri silindi!");

                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Evet",
                                              style: TextStyle(
                                                  color: Color(0xFF0EDED2),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "Vazgeç",
                                              style: TextStyle(
                                                  color: Color(0xFF0EDED2),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      )));
                            });
                      }

                      return Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 350.0,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8),
                                  child: Material(
                                    color: Colors.white,
                                    elevation: 14,
                                    shadowColor: Color(0x802196F3),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                    onTap: () {

                                                      _showChoiseDialog(context);

                                                    },
                                                    child: Image.network(
                                                      "${mypost['image']}",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Yemek adı: ",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xFFFc6076)),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "${mypost['name']}",
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Malzemeler: ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFFFc6076)),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${mypost['material']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    "Yapılışı: ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xFFFc6076)),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "${mypost['recipe']}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    });
              }
            },
          )),
    );
  }
}
