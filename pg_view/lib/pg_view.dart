import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PgView {
  static const MethodChannel _channel = const MethodChannel('pg_view');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}





class UIPgView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _UIPgViewState();
  }
}

class _UIPgViewState extends State<UIPgView>{
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.iOS){
      return UiKitView(
        viewType: "plugins/pg_view",
      );
    }
    return Text('pg_view$defaultTargetPlatform');
  }
}
