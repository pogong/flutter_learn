import 'package:flutter/material.dart';
import 'package:pg_flutter/page2.dart';
import 'package:pg_flutter/MyApp2.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'I am Flutter MaterialApp Enter Page1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _goFlutterPage2() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return new MyApp2();
    }));
  }

  static const platform = const MethodChannel('samples.flutter.dev/messageChannel');

  @override
  Widget build(BuildContext context) {

    Future<dynamic> _handler(MethodCall methodCall) {
        if ("passArgusToFlutter" == methodCall.method) {
          print('zc in flutter>methodCall-arguments:${methodCall.arguments}');
        }
        return Future.value(123);
    }
    platform..setMethodCallHandler(_handler);

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),

            FlatButton(
              child: Text("goFlutterPage2"),
              textColor: Colors.blue,
              onPressed: (){
                _goFlutterPage2();
              },
            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
