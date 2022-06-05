import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



class Primera extends StatelessWidget {
  String imagen;


  Primera({super.key, required this.imagen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: Text('LOGO')),
        body: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 25.0,
                  spreadRadius: 5.0,
                  offset: Offset(5.0, 5.0))
            ],
            color: Color(0xFFEEEDDE),
          ),
          //margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$imagen",
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Image.asset(
                  'assets/tourism/$imagen.jpg',
                  width: 450.0,
                ),
                Text(
                    "Ruinas de una ciudad inca del siglo XV situadas en un \n promontorio  incluye diversas esculturas y terrazas"),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 25.0,
                            spreadRadius: 5.0,
                            offset: Offset(5.0, 5.0))
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(1)),
                  child: Boton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Boton() {
    return FlatButton(
      child: Text(
        'Ir a ubicación',
        style: TextStyle(fontSize: 40),
      ),
      onPressed: () {},
    );
  }
}
