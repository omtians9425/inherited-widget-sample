import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const _MyHomePage(),
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
///This wraps Widget that extends InheritedWidget.
class _MyHomePageState extends State<_MyHomePage> {
  var _count = 1;

  String _createMessage() {
    /*
    return same value if condition isn't satisfied so that its child is not notified
     */
    final result = _count % 15 == 0
        ? 'FizzBuzz'
        : (_count % 3 == 0 ? 'Fizz' : (_count % 5 == 0 ? 'Buzz' : '-'));
    print("count: $_count, result: $result");
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return _Inherited(
      message: _createMessage(),
      child: Scaffold(
        body: Center(
          //This is rebuilt all time when setState() unless it is const.
          child: const _Message(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
        ),
      ),
    );
  }
}

///Child widget that is notified state.
class _Message extends StatelessWidget {
  const _Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //observe parent state
    var messageFromParent = _Inherited.of(context, listen: true).message;
    print('_Message widget is built. message: $messageFromParent');

    return Text(
      'result: $messageFromParent',
      style: TextStyle(fontSize: 32),
    );
  }
}

///This wraps Child widget
class _Inherited extends InheritedWidget {
  const _Inherited({
    Key key,
    @required this.message,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final String message;

  //Child calls this
  static _Inherited of(BuildContext context, {@required bool listen}) {
    return listen
        ? context.inheritFromWidgetOfExactType(_Inherited)
            as _Inherited //specify to notify when state changes (like register observer of LiveData)
        : context
            .ancestorInheritedElementForWidgetOfExactType(_Inherited)
            .widget as _Inherited; //only get widget of the state when called
  }

  @override
  bool updateShouldNotify(_Inherited old) {
    return old.message != message;
  }
}
