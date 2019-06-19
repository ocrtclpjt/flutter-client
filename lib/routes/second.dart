import 'dart:io';

import 'package:flutter/material.dart';
import '../model/result_model.dart';
import 'dart:convert';

//////// 두 번째 화면 //////////////////
class Second extends StatelessWidget {
  String jsonData ='{"success": "true", "ocr_result": [{"text": "성폭력범죄자의", "probability": "0.80121547", "location": {"y": 147, "h": 18, "x": 173, "w": 109}}, {"text": "성충동", "probability": "0.8292876", "location": {"y": 147, "h": 18, "x": 285, "w": 50}}, {"text": "약물치료에", "probability": "0.7381217", "location": {"y": 147, "h": 18, "x": 338, "w": 79}}, {"text": "관한", "probability": "0.9861582", "location": {"y": 147, "h": 18, "x": 421, "w": 35}}, {"text": "법률", "probability": "0.95358443", "location": {"y": 147, "h": 18, "x": 458, "w": 35}}, {"text": "시행규칙", "probability": "0.814126", "location": {"y": 147, "h": 18, "x": 495, "w": 64}}, {"text": "[별지", "probability": "0.96871847", "location": {"y": 147, "h": 19, "x": 565, "w": 39}}, {"text": "제31호서식]", "probability": "0.6398482", "location": {"y": 147, "h": 19, "x": 608, "w": 88}}, {"text": "”", "probability": "0.8368464", "location": {"y": 148, "h": 17, "x": 152, "w": 19}}, {"text": "(앞", "probability": "0.4327676", "location": {"y": 174, "h": 17, "x": 955, "w": 25}}, {"text": "종)", "probability": "0.11995663", "location": {"y": 174, "h": 17, "x": 983, "w": 26}}, {"text": "결", "probability": "0.8579764", "location": {"y": 235, "h": 21, "x": 839, "w": 23}}, {"text": "성", "probability": "0.86568266", "location": {"y": 235, "h": 22, "x": 868, "w": 23}}, {"text": "기각", "probability": "0.3749727", "location": {"y": 268, "h": 19, "x": 745, "w": 41}}, {"text": "숭인", "probability": "0.28747883", "location": {"y": 268, "h": 19, "x": 835, "w": 38}}, {"text": "비고", "probability": "0.5506255", "location": {"y": 268, "h": 19, "x": 936, "w": 39}}, {"text": "치료비용", "probability": "0.3615937", "location": {"y": 289, "h": 33, "x": 239, "w": 131}}, {"text": "국가", "probability": "0.30091047", "location": {"y": 289, "h": 33, "x": 380, "w": 69}}, {"text": "부담", "probability": "0.15244591", "location": {"y": 289, "h": 33, "x": 458, "w": 69}}, {"text": "신청서", "probability": "0.52266544", "location": {"y": 289, "h": 33, "x": 536, "w": 99}}, {"text": "“…", "probability": "0.0", "location": {"y": 413, "h": 26, "x": 146, "w": 868}}, {"text": "치료명령을", "probability": "0.86941385", "location": {"y": 456, "h": 24, "x": 160, "w": 108}}, {"text": "주소", "probability": "0.89864224", "location": {"y": 484, "h": 20, "x": 277, "w": 41}}, {"text": "사람", "probability": "0.86874723", "location": {"y": 493, "h": 24, "x": 216, "w": 47}}, {"text": "받은", "probability": "0.7202465", "location": {"y": 494, "h": 22, "x": 166, "w": 44}}, {"text": "(전화번호:", "probability": "0.72745353", "location": {"y": 512, "h": 20, "x": 674, "w": 83}}, {"text": "(뒤 ", "probability": "4.8674465e-05", "location": {"y": 537, "h": 24, "x": 148, "w": 865}}, {"text": "치료비용", "probability": "0.9237791", "location": {"y": 577, "h": 24, "x": 726, "w": 87}}, {"text": "금액", "probability": "0.70260316", "location": {"y": 578, "h": 23, "x": 818, "w": 43}}, {"text": "치료비용", "probability": "0.93530196", "location": {"y": 580, "h": 24, "x": 171, "w": 87}}, {"text": "남부명령일", "probability": "0.49603167", "location": {"y": 610, "h": 24, "x": 159, "w": 106}}, {"text": "지범호함", "probability": "0.0048346184", "location": {"y": 655, "h": 24, "x": 725, "w": 88}}, {"text": "금액", "probability": "0.70260316", "location": {"y": 656, "h": 23, "x": 818, "w": 43}}, {"text": "분인", "probability": "0.32122624", "location": {"y": 658, "h": 23, "x": 164, "w": 44}}, {"text": "부담", "probability": "0.8654765", "location": {"y": 658, "h": 24, "x": 216, "w": 47}}, {"text": "가능", "probability": "0.8855101", "location": {"y": 688, "h": 24, "x": 165, "w": 45}}, {"text": "금액", "probability": "0.70260316", "location": {"y": 689, "h": 23, "x": 216, "w": 43}}, {"text": "신청사유", "probability": "0.76885957", "location": {"y": 869, "h": 24, "x": 170, "w": 88}}, {"text": "「성폭력범죄자의", "probability": "0.5277421", "location": {"y": 1049, "h": 22, "x": 182, "w": 149}}, {"text": "성충동", "probability": "0.44620395", "location": {"y": 1049, "h": 21, "x": 341, "w": 63}}]}';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('두 번째')),
      body: Center(
        child: new Container(
          constraints: new BoxConstraints.expand(
              // height: 200.0,
              ),
          alignment: Alignment.bottomLeft,
          padding: new EdgeInsets.only(left: 16.0, bottom: 8.0),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/FF4D00-0.8.png'),
              fit: BoxFit.fitHeight,
            ),
            border: Border.all(
                color: Colors.green, width: 5.0, style: BorderStyle.solid),
          ),
          child: Stack(
            children:
              (json.decode(jsonData)['ocr_result'] as List)
                      .map((row) => Positioned(
                left: Result.fromJson(row).location.x.toDouble()/2,
                top: Result.fromJson(row).location.y.toDouble()/2,
                child: Text(row['text'],
                style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8.0,
                    ))
              )).toList()
             /* <Widget>[
              new Positioned(
                left: 0.0,
                top: 0.0,
                child: Text(Result.fromJson(json.decode(jsonData)['ocr_result'][0]).text,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ),
              new Positioned(
                left: 0.0,
                top: 0.0,
                child: new Icon(Icons.star, color: Colors.blue,),
              ),
            ], */
          ),
        ),
      ),
    );
  }
}