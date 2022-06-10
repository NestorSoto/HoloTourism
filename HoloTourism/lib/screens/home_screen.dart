import 'dart:io';

import 'package:untitled1/screens/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_view_screen.dart';

class HomeScreenDialogs {
  List<PickedFile> images = [];
  final imagePicker = ImagePicker();
  Future<void> optionsDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: _openCamera,
                    child: const Text('image_picker: Cámara'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: _openGallery,
                    child: const Text('image_picker: Galería'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: const Text('camera: cámara'),
                    onTap: () async {
                      String picturePath = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const CameraScreen()),
                      );
                      images.add(PickedFile(picturePath));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _openCamera() async {
    PickedFile? picture = (await imagePicker.pickImage(
      source: ImageSource.camera,
    )) as PickedFile?;
    images.add(picture!);
  }

  void _openGallery() async {
    PickedFile picture = (await imagePicker.pickImage(
      source: ImageSource.gallery,
    )) as PickedFile;
    images.add(picture);
  }
}
