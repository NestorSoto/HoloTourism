import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/welcome.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to HoloTourism ',
        theme: ThemeData(
            primaryColor: Colors.blue
        ),
        home: welcome()
    );
  }
}
