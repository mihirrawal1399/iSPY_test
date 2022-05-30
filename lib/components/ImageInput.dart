import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'ImageInputController.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({ Key? key }) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  final controller = ImageInputController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Exemple')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: controller.image != null
                    ? Image.file(controller.image!)
                    : const Center(
                  child: Text('No image...'),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text("Pick Image from Gallery"),
              onPressed: () async {
                await controller.pickImage();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text("Pick Image from Camera"),
              onPressed: () async {
                await controller.pickCamera();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageInputController {
  File? image;
  File? imageTemp;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}