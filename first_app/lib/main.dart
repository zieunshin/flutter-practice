import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.deepPurple,
        body: GradientContainer(
          Color.fromARGB(255, 85, 34, 173), 
          Color.fromARGB(255, 126, 84, 199)),
      ),
    ),
  );
  //플러터 앱 활성화나 인터페이스 그리는 함수, 화면에 보여주기 위한 함수
  //runApp은 인수로 widget이 필요하다
}