import 'package:flutter/material.dart';

import 'package:untitled1/home.dart';

import 'package:untitled1/login.dart';
import 'package:untitled1/welcome.dart';
import 'package:untitled1/ubicacion.dart';
import 'package:untitled1/registro.dart';

void main() {
  runApp(MyApp());
}

const bodyColor = Color(0xFFEEEDDE);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to HoloTourism ',
        theme: ThemeData(primaryColor: Colors.blue),
        home: welcome());
  }
}
