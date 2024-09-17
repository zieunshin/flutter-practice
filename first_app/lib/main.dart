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
  //�÷��� �� Ȱ��ȭ�� �������̽� �׸��� �Լ�, ȭ�鿡 �����ֱ� ���� �Լ�
  //runApp�� �μ��� widget�� �ʿ��ϴ�
}