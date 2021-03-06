import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:untitled1/welcome.dart';
import 'package:untitled1/ubicacion.dart';
import 'package:untitled1/pages/login_page.dart';
import 'package:untitled1/pages/register_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to HoloTourism ',
      theme: ThemeData(primaryColor: Colors.blue),
      home: welcome(),
      routes:{
        RegisterPage.routeName: (_) => RegisterPage(),
        LoginPage.routeName:(_) => LoginPage(),
      },
    );
  }
}
