import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class page2 extends StatelessWidget {

  static const platform = const MethodChannel('samples.flutter.dev/messageChannel');

  Future<void> _goSettingViewController() async {
    String resultString;
    try {
      final int result = await platform.invokeMethod('goSettingViewController');
      resultString = 'goSettingViewController at $result % .';
    } on PlatformException catch (e) {
      resultString = "Failed to goSettingViewController: '${e.message}'.";
    }
    print('调用了$resultString');
  }

  Future<void> _goSomePage() async {

  }

  @override
    Widget build(BuildContext context) {

      // Future<dynamic> _handler(MethodCall methodCall) {
      //   if ("passArgusToFlutter" == methodCall.method) {
      //     print('methodCall-arguments:${methodCall.arguments}');
      //   }
      //   return Future.value(123);
      // }
      // platform..setMethodCallHandler(_handler);

      return Scaffold(
      appBar: AppBar(
        title: Text('I am Flutter Nomal Page2'),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '自我介绍，I am Flutter Nomal Page2',
            ),

            FlatButton(
              child: Text("backLastPage"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pop(context);
              },
            ),

            FlatButton(
              child: Text("goiOSPage"),
              textColor: Colors.blue,
              onPressed: (){
                _goSettingViewController();
              },
            ),

            FlatButton(
              child: Text("backToSomePage"),
              textColor: Colors.blue,
              onPressed: (){
                _goSomePage();
              },
            ),

          ],
        ),
      ),
    );
  }
}