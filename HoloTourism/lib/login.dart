import 'package:flutter/material.dart';
import 'package:untitled1/registro.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 25.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0))
          ],
          color: Colors.yellowAccent,

        ),
        margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/logohastalqso.png', height: 200), //cambia el nombre de tu imagen
            CampoText1(),
            SizedBox(
              height: 50,
            ),
            CampoText2(),
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Boton(),
            ),
            SizedBox(
              height: 50,
            ),
            Text("¿No tienes una cuenta?"),
            Text("Regístrese aquí!", style: TextStyle(color: Colors.greenAccent))
          ]),
        ),
      ),
    );
  }

  Widget CampoText1() {
    return TextField(
            controller: email,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
          hintText: "Escriba su correo electrónico"),
    );
  }

  Widget CampoText2(){
    return TextField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.security),
          border: OutlineInputBorder(),
          hintText: "Escriba su contraseña"),
    );
  }


  Widget Boton(){
    return FlatButton(
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
