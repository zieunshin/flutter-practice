import 'package:flutter/material.dart';
//카테고리가 정의되는 방법
class Category {
  const Category ({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
  
  final String id;
  final String title;
  final Color color; 
}