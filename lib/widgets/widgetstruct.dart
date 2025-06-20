import 'package:flutter/material.dart';

class WidgetSlotContainer {
  WidgetSlotContainer(this.name, this.widget, this.isgrey,
      this.categories, this.color, this.key);

  final String name;
  final Widget widget;
  final bool isgrey;
  final String categories;
  final Color color;
  final Key? key;
}
