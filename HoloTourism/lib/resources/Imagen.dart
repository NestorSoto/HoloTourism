import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/models/lugar_model.dart';
import 'dart:io';

class Imagen {
  Future<String> subir(String field, String filePath) async {
    var request = http.MultipartRequest("POST",
        Uri.parse('https://holotourism.herokuapp.com/api/images/saveimg/'));
    request.fields["file"] = field;
    request.files.add(await http.MultipartFile.fromPath("file", filePath));
    request.headers.addAll({"Content-type": "multipart/form-data"});
    var response = await request.send();
    if (response.statusCode == 200) {
      return 'ok';
    } else {
      return 'a';
    }
  }

  Future<LugarModel> detectar(String fileName) async {
    var response = await http.post(
      Uri.parse('https://holotourism.herokuapp.com/api/detector/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fileName': fileName,
      }),
    );
    String c = await Imagen.getDescriptions(jsonDecode(response.body));
    print("Descpcion del sistema" + c);
    if (response.statusCode == 200) {
      LugarModel lugar = LugarModel.fromJson(jsonDecode(response.body));
      lugar.descripcion = c;
      return lugar;
    } else {
      throw Exception('Failed to post');
    }
  }

  static Future<String> getDescriptions(Map<String, dynamic> json) async {
    String nombre = json['nombre'].toString();
    var url = Uri.parse(
        'https://holotourism.herokuapp.com/api/description/${nombre}');
    var response = await http.get(url);
    //print(json['nombre'].toString() + " nombre");
    //print('status: ${response.statusCode}');
    //print('body: ${response.body}');
    Map<String, dynamic> res = jsonDecode(response.body);
    if (res['desc'].length <= 0) {
      //print("no hay descripcion disponible");
      return "no hay descripcion disponible";
    } else {
      //print(" desc: " + res['desc'].toString());
      return res['desc'].toString();
    }
  }
}
