import 'package:flutter/material.dart';

abstract class LessonContent{
  
  final Widget link;
  final PageController controller;
  final bool isLastChild;
  
  LessonContent({this.link, this.controller, this.isLastChild});

}
