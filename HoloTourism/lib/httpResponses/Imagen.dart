import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/httpResponses/entities/Lugar.dart';

/*
*
* CLASE PARA MANEJO DE IMAGENES
*
* */

class Imagen {
  Future<String> subir(String field, String filePath) async {
    var request = http.MultipartRequest("POST", Uri.parse('https://holotourism.herokuapp.com/api/images/saveimg/'));
    request.files.add(await http.MultipartFile.fromPath(field, filePath));
    var response = await request.send();
    if (response.statusCode == 200){
      return 'ok';
    } else {
      return 'a';
    }
  }

  Future<Lugar> detectar(String fileName) async {
    var response = await http.post(
      Uri.parse('https://holotourism.herokuapp.com/api/detector/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fileName': fileName,
      }),
    );

    if (response.statusCode == 200){
      return Lugar.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

}

