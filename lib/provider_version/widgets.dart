import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
///The provider version of inherited_standard_version/widgets.dart.
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    //default value of updateShouldNotify: (previous, current) => previous != current
    return Provider<String>.value(
      value: _createMessage(),
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

class _Message extends StatelessWidget {
  const _Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //observe parent state
    var messageFromParent = Provider.of<String>(context); //default true.
    print('_Message widget is built. message: $messageFromParent');

    return Text(
      'result: $messageFromParent',
      style: TextStyle(fontSize: 32),
    );
  }
}
