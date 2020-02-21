import 'package:flutter/material.dart';


class ProfilSayfasi extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5.dart";
  @override
  Widget build(BuildContext context){
    final Color color1 = Color(0xFF0EDED2);
    final Color color2 = Color(0xFFFc6076);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
                gradient: LinearGradient(
                    colors: [color1,color2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text("Profilim", style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontStyle: FontStyle.italic
                ),),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: double.infinity,
                        margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.asset("resimler/anime_b.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Kadriye Macit", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 16.0, color: Colors.grey,),
                    Text("Ankara, Türkiye", style: TextStyle(color: Colors.grey.shade600),)
                  ],
                ),
                SizedBox(height: 5.0),
                
                SizedBox(height: 10.0),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                        margin: const EdgeInsets.only(top: 30 ,left: 20.0, right: 20.0,bottom: 20.0),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [color1,color2],
                            ),
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Row(
                          children: <Widget>[
                            
                            IconButton(
                              color: Colors.white,
                              icon: Image.asset("resimler/insta.png"),
                              onPressed: (){},
                            ),
                            Spacer(),
                            IconButton(
                              color: Colors.white,
                              icon: Image.asset("resimler/youtube.png"),
                              onPressed: (){},
                            ),
                            
                          ],
                        ),
                      ),
                      Center(
                        child: FloatingActionButton(
                          child: Icon(Icons.favorite, color: Colors.pink,),
                          backgroundColor: Colors.white,
                          onPressed: (){},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              
            ],
          ),
        ],
      ),
    );
  }
}