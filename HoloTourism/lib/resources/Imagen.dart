import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled1/models/lugar_model.dart';
import 'dart:io';

class Imagen {
  Future<String> subir(String field, String filePath) async {
    var request = http.MultipartRequest("POST", Uri.parse('http://192.168.1.2:4000/api/images/saveimg/'));
    request.fields["file"] = field;
    request.files.add(await http.MultipartFile.fromPath("file", filePath));
    request.headers.addAll({
      "Content-type": "multipart/form-data"
    });
    var response = await request.send();
    if (response.statusCode == 200){
      return 'ok';
    } else {
      return 'a';
    }
  }

  Future<LugarModel> detectar(String fileName) async {
    var response = await http.post(
      Uri.parse('http://192.168.1.2:4000/api/detector/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'fileName': fileName,
      }),
    );

    if (response.statusCode == 200){
      return LugarModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post');
    }
  }

}

