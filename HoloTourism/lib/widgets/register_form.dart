import 'package:untitled1/utils/responsive.dart';
import 'package:flutter/material.dart';
import '../httpResponses/Registro.dart';
import 'input_text.dart';
import 'login_form.dart';

class RegisterForm extends StatefulWidget{
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>{
  final registro = Registro();
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = "", _password = "", _username = "";
  String _alertaText = '';
  _submit(){
    final isOk = _formkey.currentState?.validate();
    print("form isOk $isOk");

  }

  @override
  Widget build (BuildContext context){
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet?430 : 360,
        ),
        child: Form(
          key: _formkey,
          child: Column (
            children: <Widget>[

              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Nombre de usuario",
                fondSize: responsive.dp(responsive.isTablet?1.3 : 1.5),
                onChanged: (text){
                  _username = text;
                },
                validator: (text){
                  if(text != null && text.trim().length<5){
                    return "Nombre de usurio inválido";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(1.2),),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Dirección de Email",
                fondSize: responsive.dp(responsive.isTablet?1.3 : 1.5),
                onChanged: (text){
                  _email = text;
                },
                validator: (text){
                  if(text != null && !text.contains("@")){
                    return "invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(1.2),),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Contraseña",
                fondSize: responsive.dp(responsive.isTablet?1.3 : 1.5),
                onChanged: (text){
                  _password = text;
                },
                validator: (text){
                  if(text != null && text.trim().length<8){
                    return "Contraseña inválida";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(1.5),),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        if (await registro.registrar(
                            _username, 'Hakurei', '1', _email, _password) == 'ok') {
                          Navigator.pop(context);
                        } else {
                          setState((){
                            _alertaText = 'Ocurrio un error al conectarse al servicio';
                          });
                        }
                      } else {

                      }
                      registro.registrar(_username, '', '', _email, _password);
                  },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.pinkAccent,
                      primary: Colors.black,
                    ),
                  )
              ),
              SizedBox(height: responsive.dp(2),),
              Text(
                _alertaText,
                style: TextStyle(color: Colors.redAccent),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "¿Tienes una cuenta?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.55),
                    ),
                  ),
                  TextButton(
                    child: Text("Ingresa aquí",),
                    style: TextButton.styleFrom(
                      primary: Colors.pinkAccent,
                      textStyle: TextStyle(fontSize: responsive.dp(1.55),),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: responsive.dp(5.5),)
            ],
          ),
        ),
      ),
    );
  }
}