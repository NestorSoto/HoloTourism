import 'package:flutter/material.dart';
import 'package:untitled1/registro.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login de acceso ',
        theme: ThemeData(
            primaryColor: Colors.blue
        ),
        home: RegistroApp()
    );
  }
}
