import 'package:flutter/material.dart';
import 'package:pg_flutter/page2.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'I am Flutter MaterialApp Enter Page2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),

            FlatButton(
              child: Text("goSettingViewController"),
              textColor: Colors.blue,
              onPressed: (){
                _goSettingViewController();
              },
            ),

          ],
        ),
      ),

    );
  }
}
