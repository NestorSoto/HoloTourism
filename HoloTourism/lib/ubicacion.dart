import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/models/lugar_model.dart';

const topColor = Color(0xFF00ac83);

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

class Location extends StatefulWidget {
  final LugarModel lugar;
  Location({Key? key, required this.lugar}) : super(key: key);
  @override
  _LocationState createState() => _LocationState(lugar: lugar);
}

class _LocationState extends State<Location> {
  LugarModel lugar;
  _LocationState({required this.lugar});
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
      backgroundColor: const Color.fromRGBO(239, 237, 222, 1),
      appBar: AppBar(
        title: Image.asset('assets/logohastalqso.png',
            fit: BoxFit.cover, height: 60, width: 70),
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
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("data"),
              Expanded(child: _mapa()),

              /*
              const Text('Macchu Picchu',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              )
              ,
              Image.asset(
                "assets/macchu_picchu.jpg",
                height: 300,
              ),
              
              ,
              Expanded(child: _mapa()),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                  boxShadow: [shadowButton()],
                ),
                child: RaisedButton(
                  color: Color.fromRGBO(15, 242, 187, 1),
                  padding: EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Text(
                    'Trazar ruta desde mi ubicación',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    //print(_determinePosition());
                    debugPrint(lugar.nombre);
                    _determinePosition().then((position) {
                      debugPrint('position: $position');
                      debugPrint('lugar: ${lugar.latitud} ${lugar.longitud}');
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            */
            ],
          ),
        ),
      ),
    );
  }
}

BoxShadow shadowButton() {
  return const BoxShadow(
    color: Colors.black,
    spreadRadius: 1,
    blurRadius: 1,
    offset: Offset(2, 2), // changes position of shadow
  );
}

class _mapa extends StatelessWidget {
  Widget build(BuildContext context) {
    //-12.1792, -77.0750
    double latitude = -12.1792;
    double longitude = -77.0750;
    _determinePosition().then((position) {
      latitude = -12.1792;
      longitude = -77.0750;
    });
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 10,
      ),
    );
  }
}
