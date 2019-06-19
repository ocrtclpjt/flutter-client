import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'routes/second.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: _ImagePickerDemo(),
    );
  }
}

class _ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerDemoState createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<_ImagePickerDemo> {
  File _imageFile;
  String responseText = "";
  String responseKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TCL OCR')),
        body: Builder(
            builder: (context) => ListView(
                  children: <Widget>[
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.photo_camera),
                          onPressed: () {
                            _pickImageFrom(ImageSource.camera);
                          },
                          tooltip: 'Shoot picture',
                        ),
                        IconButton(
                          icon: Icon(Icons.photo),
                          onPressed: () async =>
                              await _pickImageFrom(ImageSource.gallery),
                          tooltip: 'Pick from gallery',
                        ),
                      ],
                    ),
                    this._imageFile == null
                        ? Placeholder(
                            fallbackHeight: 300.0,
                            strokeWidth: 5.0,
                            color: Colors.grey,
                          )
                        : Image.file(
                            this._imageFile,
                            height: 300.0,
                          ),
                    Image.asset(
                      "assets/loading.gif",
                      height: 100.0,
                      width: 100.0,
                    ),
                    Text(
                      this.responseText,
                      style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.fade,
                    ),
                    RaisedButton(
                        child: Text('두 번째 화면으로 이동',
                            style: TextStyle(fontSize: 21)),
                        color: Colors.blue,
                        onPressed: () {
                          // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
                          Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                            return Second();
                          }));
                        }),
                  ],
                )));
  }

  Future<Null> _pickImageFrom(ImageSource _source) async {
    final File imageFile = await ImagePicker.pickImage(source: _source);
    upload(imageFile);
    setState(() => this._imageFile = imageFile);
  }

  // 파일 업로드 함수
  upload(File _image) async {
    if (_image == null) return;

    Dio dio = new Dio();
    FormData formdata = new FormData(); // just like JS
    formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));

    try {
      Response response = await dio.post(
        "https://enj6v0b19jtyq.x.pipedream.net",
        data: formdata,
        onSendProgress: (received, total) {
          if (total != -1) {
            setState(() =>
                this.responseText = "|" * (received / total * 100).toInt());
            print((received / total * 100).toStringAsFixed(0) + "%");
          }
        },
      );
      setState(() => this.responseText = response.data.toString());

      // sleep(const Duration(seconds: 1));

      response = await dio.get("https://httpbin.org/uuid");
      setState(() => this.responseText = response.data['uuid']);
    } catch (e) {
      setState(() => this.responseText = e.toString());
    }
  }
}
