import 'package:flutter/material.dart';
import 'package:pg_flutter/MyApp.dart';
import 'package:pg_flutter/MyApp2.dart';
import 'package:pg_flutter/PresentApp.dart';

import 'dart:ui' as ui;

void main() => runApp(_widgetForRoute(ui.window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'myApp':
      return MyApp();
    case 'myApp2':
      return MyApp2();
    case 'presentApp':
      return PresentApp();
    default:
      return MaterialApp(
        home: Center(
          child: Text('没找到指定页面'),
        ),
      );
  }
}

