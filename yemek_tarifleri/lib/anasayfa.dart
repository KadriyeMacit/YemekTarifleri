import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:input_islemler/main.dart';
import 'package:input_islemler/profil.dart';
import 'package:input_islemler/yemek_ekle.dart';

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
      theme: ThemeData(primaryColor: Colors.green[300], accentColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Anasayfa",),

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
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Profilim'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
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
          child: Icon(Icons.add,),
          onPressed: (){

            Navigator.push(context, MaterialPageRoute(
                builder: (context) => YemekSayfasi()));

          },
        ),



        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Yemek Tarifleri',
                  style: TextStyle(fontSize: 18,
                  color: Colors.black),
                ),
              ),
              Card(
                child: ListTile(
                    title: Image.asset("resimler/pizza.jpg"),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Kendime özgü Tavuklu Pizza!",
                        style: TextStyle(color: Colors.black,
                        fontSize: 16,
                        fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,),
                    )),
              ),

              Card(
                child: ListTile(
                    title: Image.asset("resimler/bamya.jpg"),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Yazdan koydum dolaba, şimdi oldu miss gibi bamya!",
                        style: TextStyle(color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,),
                    )),
              ),

              Card(
                child: ListTile(
                    title: Image.asset("resimler/kumpir.jpg"),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Öyle bir kumpir yaptım ki masanın starı oldu!",
                        style: TextStyle(color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,),
                    )),
              ),

              Card(
                child: ListTile(
                    title: Image.asset("resimler/limon.jpg"),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Kana kan, cana can katan bir kek!",
                        style: TextStyle(color: Colors.black,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,),
                    )),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
