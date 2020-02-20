import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:input_islemler/sayfalar/anasayfa.dart';

class YemekSayfasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodPage();
  }
}

class FoodPage extends State<YemekSayfasi> {

  String id;
  final db = Firestore.instance;
  final _formKey2 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String name, malzeme, yapilis;

  TextFormField buildTextFormField() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          //dışını kutu içine alır
            borderRadius:
            BorderRadius.all(Radius.circular(10))),
        hintText: 'Menemen',

      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Lütfen bir şey yazın';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  TextFormField malzemelerForm() {
    return TextFormField(
      maxLines: 2,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10))),
        hintText: 'yumurta, soğan, domates',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Lütfen bir şey yazın';
        }
      },
      onSaved: (value) => malzeme = value,
    );
  }

  TextFormField yapilisForm() {
    return TextFormField(
      maxLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10))),
        hintText: 'soğanları tavada kızartın',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Lütfen bir şey yazın';
        }
      },
      onSaved: (value) => yapilis = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0EDED2), accentColor: Color(0xFFFc6076)
      ),

      home: Scaffold(
          appBar: AppBar(
            title: Text('Yeni Tarif'),
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
                        child: Form(
                          key: _formKey,
                          child: buildTextFormField(),
                        ),
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
                        child: Form(
                          key: _formKey2,
                          child: malzemelerForm(),
                        ),
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
                        child: Form(
                          key: _formKey3,
                          child: yapilisForm(),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: RaisedButton(
                          onPressed: createData,
                          child: Text('Kaydet', style: TextStyle(color: Colors.white)),
                          color: Color(0xFFFc6076),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );

  }

  void createData() async {
    if (_formKey.currentState.validate() && _formKey2.currentState.validate()
    && _formKey3.currentState.validate()) {
      _formKey.currentState.save();
      _formKey2.currentState.save();
      _formKey3.currentState.save();
      DocumentReference ref = await db.collection('post').
      add({'name': '$name', 'material': "$malzeme", 'recipe': "$yapilis"});
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

}