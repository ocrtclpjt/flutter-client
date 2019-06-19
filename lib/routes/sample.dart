import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// 아래는 참고용 코드로 실제로 사용하진 않음
class UserOptions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new UserOptionsState();
  }
}

class UserOptionsState extends State<UserOptions> {
//save the result of gallery file
  File galleryFile;

//save the result of camera file
  File cameraFile;

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery

    imageSelectorGallery() async {
      galleryFile = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        // maxHeight: 50.0,
        // maxWidth: 50.0,
      );
      print("You selected gallery image : " + galleryFile.path);
      setState(() {});
    }

    //display image selected from camera
    imageSelectorCamera() async {
      cameraFile = await ImagePicker.pickImage(
        source: ImageSource.camera,
        //maxHeight: 50.0,
        //maxWidth: 50.0,
      );
      print("You selected camera image : " + cameraFile.path);
      setState(() {});
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Image Picker'),
      ),
      body: new Builder(
        builder: (BuildContext context) {
          return new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                  child: Text('두 번째 화면으로 이동', style: TextStyle(fontSize: 21)),
                  color: Colors.blue,
                  onPressed: () {
                    // push에 전달되는 두 번째 매개변수는 Route<T> 클래스.
                    Navigator.push(context, MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                      return Second();
                    }));
                  }),
              /*
              new RaisedButton(
                child: new Text('Select Image from Gallery'),
                onPressed: imageSelectorGallery,
              ),
              new RaisedButton(
                child: new Text('Select Image from Camera'),
                onPressed: imageSelectorCamera,
              ),
              */
              displaySelectedFile(galleryFile),
              displaySelectedFile(cameraFile)
            ],
          );
        },
      ),
    );
  }

  Widget displaySelectedFile(File file) {
    return new SizedBox(
      height: 150.0,
      width: 300.0,
//child: new Card(child: new Text(''+galleryFile.toString())),
//child: new Image.file(galleryFile),
      child: file == null
          ? new Text('Sorry nothing selected!!')
          : new Image.file(file),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('두 번째')),
      body: Center(
        child: RaisedButton(
          child: Text('처음 화면으로 돌아가기', style: TextStyle(fontSize: 21)),
          color: Colors.green,
          onPressed: () {
            Navigator.pop(context);

            // 위와 같은 코드
            // Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
