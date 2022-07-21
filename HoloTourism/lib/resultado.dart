// import 'dart:js';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart' as Path;
import 'package:untitled1/ubicacion.dart';
import 'dart:io';

class Primera extends StatelessWidget {
  File imagen;
  String title;
  String descripcion = "no hay descripcion disponible";

  Primera({super.key, required this.imagen, required this.title});
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
                Text(title,
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Image.file(
                  imagen,
                  width: 450.0,
                ),
                Text(descripcion),
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
                  child: Boton(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Boton(context) {
    return FlatButton(
      child: Text(
        'Ir a ubicación',
        style: TextStyle(fontSize: 40),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Location()));
      },
    );
  }

/*
  Widget BotonRetornar(){
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: (){
            //Navigator.pop(context);

          },
          child: Text("retornar"),
        ),
      ),
    )
  }
  */

}
