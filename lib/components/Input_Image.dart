import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

// ignore: must_be_immutable
class InputImg extends StatefulWidget {
  Function imgselected;
  InputImg(this.imgselected);
  @override
  _InputImgState createState() => _InputImgState();
}

class _InputImgState extends State<InputImg> {

  var _imgTaken;
  Future<void> _takePhoto() async{
    // ignore: deprecated_member_use
    final File imagefile = (await ImagePicker().pickImage(source: ImageSource.camera,maxWidth: 600)) as File;
    if(imagefile == null)
    {
      return;
    }
    // setState(() {
    //   _imgTaken = imagefile;
    // });
    _imgTaken = imagefile;
    final appDir = await syspath.getApplicationSupportDirectory();
    final fileName = path.basename(imagefile.path);
    final savedImg = await imagefile.copy('${appDir.path}/$fileName');
    widget.imgselected(savedImg);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _imgTaken != null
              ? Image.file(
            _imgTaken,
            fit: BoxFit.cover,
            width: double.infinity,
          )
              : Text('No Image',style: TextStyle(color: Theme.of(context).primaryColor),textAlign: TextAlign.center,),
        ),
        SizedBox(width: 10,),
        Expanded(
            child: FlatButton.icon(
              icon: Icon(Icons.camera),
              label: Text('Take Photo'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _takePhoto,
            ))
      ],
    );
  }
}