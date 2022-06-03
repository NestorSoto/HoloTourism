
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const topColor = Color(0xFF00ac83);
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late final List<bool> _selections;

  @override
  void initState() {
    _selections = [false, true];
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
      body: buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Añadir imagen',
        backgroundColor: topColor,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildList() => _selections[1] ?
  Padding(
    padding: const EdgeInsets.all(25.0),
    child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20
        ),
        itemCount: touristicPlaces.length,
        itemBuilder: (context, index){
          final item = touristicPlaces[index];
          return GridTile(
              footer: Container(
                alignment: Alignment.center,
                color: const Color(0xFFEEEDDE),
                child: Text(item),
                padding: const EdgeInsets.symmetric(vertical: 2),
              ),
              child: Image.asset('assets/tourism/$item.jpg', fit: BoxFit.cover)
          );
        }
    ),
  )
      : Padding(
    padding: const EdgeInsets.all(25.0),
    child: ListView.builder(
        itemCount: touristicPlaces.length,
        itemBuilder: (context, index) {
          final item = touristicPlaces[index];
          return Container(
            decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(
                    color: const Color(0xFF000000)
                )
            ),
            child: ListTile (
              leading: Image.asset(
                'assets/tourism/$item.jpg',
                height: 50,
                width: 70,
                fit: BoxFit.cover,
              ),
              title: Text(item),

            ),
          );}
    ),
  );
}
final touristicPlaces = ['chanchan','machu_picchu','mono'];