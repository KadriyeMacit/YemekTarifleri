import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:input_islemler/main.dart';
import 'file:///C:/Users/Kadriye/Desktop/YemekTarifleri/yemek_tarifleri/lib/sayfalar/profil.dart';
import 'file:///C:/Users/Kadriye/Desktop/YemekTarifleri/yemek_tarifleri/lib/sayfalar/yemek_ekle.dart';


class Anasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }
}

class HomePage extends State<Anasayfa> {
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
                    Navigator.pop(context);
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 200,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Image.network(
                                                  "${mypost['image']}",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),

                                              Padding(
                                                padding: const EdgeInsets.only(bottom:8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Yemek adı: ",
                                                      style: TextStyle(fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                        color:  Color(0xFFFc6076)
                                                      ),
                                                    ),
                                                    Text(
                                                      "${mypost['name']}",
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ],
                                                )
                                              ),


                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Malzemeler: ",
                                                      style: TextStyle(fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color:  Color(0xFFFc6076)
                                                      ),
                                                    ),
                                                    Text(
                                                      "${mypost['material']}",
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ],
                                                )
                                              ),
                                            ),

                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "Yapılışı: ",
                                                      style: TextStyle(fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color:  Color(0xFFFc6076)
                                                      ),
                                                    ),
                                                    Text(
                                                      "${mypost['recipe']}",
                                                      style: TextStyle(fontSize: 16),
                                                    ),
                                                  ],
                                                )
                                              ),
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

const List<Color> koyuRenk = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> acikRenk = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
