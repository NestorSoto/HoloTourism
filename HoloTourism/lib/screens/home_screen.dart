import 'dart:io';

import 'package:untitled1/httpResponses/Imagen.dart';
import 'package:untitled1/httpResponses/entities/Lugar.dart';
import 'package:untitled1/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/home.dart';
import 'image_view_screen.dart';

class HomeScreenDialogs extends StatefulWidget {
  late Lugar futureLugar;
  final imagen = Imagen();
  File? images2;
  final imagePicker = ImagePicker();
  String fileName = '';

  HomeScreenDialogs({Key? key}) : super(key: key);

  Future build(BuildContext context, {required Function(dynamic varImage, dynamic fileName) callbackFunction}) {
    return showDialog(
        context: context,

        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Subir imagen'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      await _openCamera();
                      callbackFunction(images2, fileName);
                    },
                    child: const Text('Cámara'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _openGallery();
                      callbackFunction(images2, fileName);
                    },
                    child: const Text('Galería'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _openCamera() async {
    XFile picture = (await imagePicker.pickImage(
      source: ImageSource.camera,
    )) as XFile;
    if (picture == null) return;
    if(await imagen.subir(picture.path.split("/").last, picture.path)=='ok'){
      debugPrint('funciono mi king');
      futureLugar = await imagen.detectar(picture.path.split("/").last);
      fileName = futureLugar.nombre;
    } else {
      debugPrint('no funciono mi king');
    }
    images2 = File(picture.path);
  }

  Future<void> _openGallery() async {
    XFile picture = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    )) as XFile;
    if (picture == null) return;
    if(await imagen.subir(picture.path.split("/").last, picture.path)=='ok'){
      futureLugar = await imagen.detectar(picture.path.split("/").last);
      fileName = futureLugar.nombre;
      debugPrint('funciono mi king');
    } else{
      debugPrint('no funciono mi king');
    }
    images2 = File(picture.path);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
