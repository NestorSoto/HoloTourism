import 'package:flutter/material.dart';
import 'package:untitled1/login.dart';

class RegistroApp  extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      final titulo ='Registro de Usuario !!';
      return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.greenAccent,
            body: Container(
                margin: EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
                child: MyHomeRegistroApp(),
            ),
        )
      );
  }
}

class MyHomeRegistroApp  extends StatefulWidget
{
  @override
  State< MyHomeRegistroApp> createState() => _MyHomePageState();

}

class _MyHomePageState extends State< MyHomeRegistroApp>
{

  final _formkey = GlobalKey<FormState>();
  final _correo = GlobalKey<FormState>();

  TextEditingController nombres = new TextEditingController();
  TextEditingController apellidos = new TextEditingController();
  TextEditingController numero_celular = new TextEditingController();
  TextEditingController correo = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController password_repeat = new TextEditingController();

  static final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$"
  );

  bool _esEmail(String email)
  {
    return _emailRegExp.hasMatch(email.toLowerCase());
  }

  bool _min8(String pass)
  {
    if(pass.length < 8)
    {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children:<Widget> [
            Image.asset('assets/logohastalqso.png', height: 200),
            TextFormField(
              controller: nombres,
              decoration: InputDecoration(hintText: 'Nombres'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: apellidos,
              decoration: InputDecoration(hintText: 'Apellidos'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: numero_celular,
              decoration: InputDecoration(hintText: 'Número Móvil'),
            ),
            SizedBox(height: 20),
            TextFormField(
                controller: correo,
                decoration: InputDecoration(
                    labelText: 'Correo: '
                ),
                validator: (value)
                {
                  if(!_esEmail(value.toString()))
                  {
                    return 'Correo invalido';
                  }
                }
            ),
            SizedBox(height: 20),
            TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Contraseña:'
                ),
                validator: (value)
                {
                  if(!_min8(value.toString()))
                  {
                    return 'Contraseña invalida. Verifique que tenga minimo 8 caracteres.';
                  }
                }
            ),
            SizedBox(height: 20),
            TextFormField(
                controller: password_repeat,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Repite la contraseña: '
                ),
                validator: (value)
                {
                  if(value.toString() != password.text)
                  {
                    return 'Las contraseñas no coinciden. Vuelve a intentarlo.';
                  }
                }
            ),
            SizedBox(height: 20),
            MaterialButton(
              minWidth: 800.0,
              height: 80.0,
              onPressed: () {
                if(_formkey.currentState!.validate())
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginApp()));
                }
              },
              color: Colors.green,
              child: Text('Registrarse', style: TextStyle(color: Colors.white)),
            ),
          ],
        )
    );
  }
}