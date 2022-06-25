import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled1/resultado.dart';
import './custom_widgets/customlist.dart';
import 'package:untitled1/screens/home_screen.dart';

const topColor = Color(0xFF00ac83);
class MyHomePage extends StatefulWidget {
  List<File> touristicPlaces = <File>[];
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final List<bool> _selections;
  callback(varImage){
    setState((){
      widget.touristicPlaces.add(varImage);
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
        title: Image.asset('assets/logohastalqso.png',fit: BoxFit.cover, height: 60,width: 70),
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
      body: CustomList(
        selections: _selections,
        touristicPlaces: widget.touristicPlaces,
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
