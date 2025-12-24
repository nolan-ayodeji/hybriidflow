import 'package:flutter/material.dart';

class WidgetEntry {
  final String type;
  final Map<String, dynamic> content;

  WidgetEntry(this.type, this.content);

  Map<String, dynamic> toJson(){
    return {
      "type": type,
      "content": content,

    };


  }
}