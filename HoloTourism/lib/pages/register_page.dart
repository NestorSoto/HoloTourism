import 'package:untitled1/utils/responsive.dart';
import 'package:untitled1/widgets/avatar_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/widgets/circle.dart';
import 'package:untitled1/widgets/register_form.dart';

class RegisterPage extends StatefulWidget{
  static const routeName = "register";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State <RegisterPage>{
  @override
  Widget build (BuildContext context){
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(87);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -(pinkSize)*0.3,
                  right: -(pinkSize)*0.2,
                  child:Circle (
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                  ),
                ),
                Positioned(
                  top: -(orangeSize)*0.45,
                  left: -(orangeSize)*0.15,
                  child:Circle (
                    size: orangeSize,
                    colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                  ),
                ),

                Positioned(
                  top: pinkSize * 0.05,
                  child: Column(
                    children:<Widget>[
                      Text(
                        "Hola!\nRegístrate para empezar.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: responsive.dp(1.6), color: Colors.white),
                      ),
                      SizedBox(height: responsive.dp(4.5),),
                      AvatarButton(
                        imageSize: responsive.wp(25),
                      ),
                    ],
                  ),
                ),

                RegisterForm(),
                Positioned(
                  top: 15,
                  left: 15,
                  child: SafeArea(
                    child:CupertinoButton(
                      color: Colors.black26,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
