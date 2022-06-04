import 'package:flutter/material.dart';

class Registro extends StatefulWidget
{
  @override
  _registro createState() => _registro();
}

class _registro extends State<Registro>
{
  TextEditingController nombres = new TextEditingController();
  TextEditingController apellidos = new TextEditingController();
  TextEditingController numero_celular = new TextEditingController();
  TextEditingController correo = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController password_repeat = new TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Proyecto'),
              TextField(
                controller: nombres,
                decoration: InputDecoration(hintText: 'Nombres'),
              ),
              SizedBox(height: 20),
              TextField(
                controller: apellidos,
                decoration: InputDecoration(hintText: 'Apellidos'),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: numero_celular,
                decoration: InputDecoration(hintText: 'Número Movil'),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: correo,
                decoration: InputDecoration(hintText: 'Correo'),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: password,
                decoration: InputDecoration(hintText: 'Contraceña'),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: password_repeat,
                decoration: InputDecoration(hintText: 'Repetir Contraceña'),
              ),
              SizedBox(height: 50,),
              MaterialButton(
                minWidth: 800.0,
                height: 80.0,
                onPressed: () {},
                color: Colors.green,
                child: Text('Registrarse', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
