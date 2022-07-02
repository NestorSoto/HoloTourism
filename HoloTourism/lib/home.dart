import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:untitled1/resultado.dart';
import './custom_widgets/customlist.dart';
import 'package:untitled1/screens/home_screen.dart';

const topColor = Color(0xFF00ac83);

class MyHomePage extends StatefulWidget {
  List<File> touristicPlaces = <File>[];
  List<String> textNames = [];
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final List<bool> _selections;
  callback(varImage, fileName){
    setState((){
      widget.touristicPlaces.add(varImage);
      widget.textNames.add(fileName);
    });
  }
  @override
  void initState() {
    _selections = [false, true];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset("assets/logohastalqso.png", fit: BoxFit.cover, height: 60, width: 70),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => super.widget));
            }),
        actions: <Widget>[
          ToggleButtons(
            isSelected: _selections,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selections.length; i++) {
                  _selections[i] = i == index;
                  debugPrint('movieTitle: $_selections');
                }
              });
            },
            fillColor: const Color(0xFF0FF2BC),
            splashColor: const Color(0xFF0FF2BC),
            children: const [
              Icon(Icons.format_list_bulleted),
              Icon(Icons.grid_view_sharp)
            ],
          )
        ],
        backgroundColor: topColor,
      ),
      body: widget.touristicPlaces.isEmpty ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 60),
            Text.rich(TextSpan(
                text: "¿Aún no sube ninguna imagen?",
                style: TextStyle(fontWeight: FontWeight.bold))),
            Text.rich(TextSpan(
                text: "¡Haga click en el signo '+' para iniciar!",
                style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ),
      ) : CustomList(
        selections: _selections,
        touristicPlaces: widget.touristicPlaces,
        textNames: widget.textNames
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          HomeScreenDialogs().build(context, callbackFunction:callback);
        },

        backgroundColor: topColor,
        tooltip: 'Upload Image',
        child: const Icon(Icons.add),
      ),  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
