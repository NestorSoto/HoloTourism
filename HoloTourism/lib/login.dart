import 'package:flutter/material.dart';


class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login de acceso ',
      theme: ThemeData(
          primaryColor: Colors.blue
      ),
      home:Scaffold(
          backgroundColor: Colors.greenAccent,

          body: Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
              child: MyHomeLoginApp()
          )
      ),
    );
  }
}
class MyHomeLoginApp extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<MyHomeLoginApp> {

  final _formkey = GlobalKey<FormState>();


  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();


  static final RegExp _emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9\-\_]+(\.[a-zA-Z]+)*$");

  bool _esEmail(String str)
  {
    return _emailRegExp.hasMatch(str.toLowerCase());
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
        child: SingleChildScrollView(
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
      )
    ;
  }

  Widget CampoText1() {
    return TextFormField(
            controller: email,
      obscureText: false,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          border: OutlineInputBorder(),
          hintText: "Escriba su correo electrónico"),
        validator:(value)
        { if(!_esEmail(value.toString()))
          {
            return "Ingrese el Email correcto !!! ";
          }
        }
    );
  }

  Widget CampoText2(){
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.security),
          border: OutlineInputBorder(),
          hintText: "Escriba su contraseña"),
        validator:(value)
        { if(value!.isEmpty)
          {
          return "Ingrese la contraseña";
          }
        }
    );
  }


  Widget Boton(){
    return TextButton(
      child: Text(
        'Iniciar Sesión',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: ()
      {
        if (_formkey.currentState!.validate())
        {
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text("procesando datos...!!")));
        }
      },
    );
  }
}