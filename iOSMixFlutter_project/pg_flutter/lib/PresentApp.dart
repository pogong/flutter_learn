import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PresentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'I am PresentApp'),
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

  Future<void> _dismiss() async {
    String resultString;
    try {
      final int result = await platform.invokeMethod('dismiss');
      resultString = 'dismiss at $result % .';
    } on PlatformException catch (e) {
      resultString = "Failed to dismiss: '${e.message}'.";
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
              'xxhh',
            ),

            FlatButton(
              child: Text("dismiss"),
              textColor: Colors.blue,
              onPressed: (){
                _dismiss();
              },
            ),

          ],
        ),
      ),

    );
  }
}
