import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
*
* CLASE PARA REGISTRO Y LOGIN CON EL BACK-END
*
* */

class Registro {

  Future<http.Response> registrar(String nombres, String apellidos, String numero_celular, String correo, String password) {
    return http.post(
      Uri.parse('https://holotourism.herokuapp.com/api/auth/new'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombres,
        'apellido': apellidos,
        'email': correo,
        'movil': numero_celular,
        'password': password
      }),
    );
  }

}



