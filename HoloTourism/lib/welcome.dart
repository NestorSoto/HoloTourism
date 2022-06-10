import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/registro.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 237, 222, 1),
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logohastalqso.png",
                height: 200,
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                decoration: BoxDecoration(
                  boxShadow: [shadowButton()],
                ),
                child: RaisedButton(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  padding: EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 3),
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginApp()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
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
                    'Registrarse',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroApp()),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
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
