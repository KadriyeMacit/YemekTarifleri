import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:input_islemler/sayfalar/anasayfa.dart';

class YemekSayfasi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodPage();
  }
}

class FoodPage extends State<YemekSayfasi> {
  File imageFile;

  final Firestore _firestore = Firestore.instance;

  String id;
  final db = Firestore.instance;
  final _formKey2 = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String name, malzeme, yapilis;

  var url;

  _openGallery(BuildContext context) async {

    var resim = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() //arayüze de yansıması için setState
    {
      imageFile = resim;
    });


    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("kadriye")
        .child("yemek.png");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

     url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);


  }

  _openCamera(BuildContext context) async {

    var resim = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
     imageFile = resim;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("macit")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

     url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);


  }





  Future<void> _showChoiseDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                "Test sonucu görmek için seçin!",
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(color: Colors.blue[100], width: 3)),
                child: ListView(children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.photo_size_select_actual,
                        color: Colors.blue[200], size: 60),
                    title: Text(
                      'Galeri',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.camera,
                        color: Colors.blue.shade200, size: 60),
                    title: Text(
                      'Kamera',
                      style: TextStyle(fontSize: 20),
                    ),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ]),
              ));
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Material(
          child: InkWell(
        onTap: () {},
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset('resimler/yemeeek.png', width: 220, height: 150),
          ),
        ),
      ));
    } else {
      return ResimSecince();
    }
  }

  Widget ResimSecince() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image.file(
            imageFile,
            width: 200,
            height: 150,
          ),
        ),
      ],
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            //dışını kutu içine alır
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF0EDED2), accentColor: Color(0xFFFc6076)),
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
                    new GestureDetector(
                      onTap: () {
                        _showChoiseDialog(context);
                      },
                      child: new Text("Resim eklemek için tıklayın.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    _decideImageView(),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Yemeğin ismi:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFc6076),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Form(
                        key: _formKey,
                        child: buildTextFormField(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Malzemeler:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFc6076),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Form(
                        key: _formKey2,
                        child: malzemelerForm(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        "Yapılışı:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFc6076),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Form(
                        key: _formKey3,
                        child: yapilisForm(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RaisedButton(
                        onPressed: createData,
                        child: Text('Kaydet',
                            style: TextStyle(color: Colors.white)),
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
    if (_formKey.currentState.validate() &&
        _formKey2.currentState.validate() &&
        _formKey3.currentState.validate()) {
      _formKey.currentState.save();
      _formKey2.currentState.save();
      _formKey3.currentState.save();
      DocumentReference ref = await db
          .collection('post')
          .add({'name': '$name', 'material': "$malzeme", 'recipe': "$yapilis",
        'image': "$url"});
      setState(() => id = ref.documentID);
      print(ref.documentID);
    }
  }

}
