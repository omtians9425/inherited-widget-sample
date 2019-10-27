import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(),
    );
  }
}

///Base Stateful Widget.
class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///This has the state(=changeable property) that passed into its child widget.
class _MyHomePageState extends State<_MyHomePage> {
  int _counter = 0;
  var _count = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String _createMessage() {
    final result = _count % 15 == 0 ? 'FizzBuzz' : (_count % 3 == 0 ? 'Fizz' : (_count % 5 == 0 ? 'Buzz' : _count));
    print("count: $_count, result: $result");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({Key key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

