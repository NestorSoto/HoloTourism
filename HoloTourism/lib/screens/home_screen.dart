import 'dart:io';

import 'package:untitled1/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled1/home.dart';
import 'image_view_screen.dart';

class HomeScreenDialogs extends StatefulWidget {
  File? images2;
  final imagePicker = ImagePicker();
  HomeScreenDialogs({Key? key}) : super(key: key);

  Future build(BuildContext context, {required Function(dynamic varImage) callbackFunction}) {
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
                      callbackFunction(images2);
                    },
                    child: const Text('Cámara'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await _openGallery();
                      callbackFunction(images2);
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
    images2 = File(picture.path);
  }

  Future<void> _openGallery() async {
    XFile picture = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    )) as XFile;
    if (picture == null) return;
    images2 = File(picture.path);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
