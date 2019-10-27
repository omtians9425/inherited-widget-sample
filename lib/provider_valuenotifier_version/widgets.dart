import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
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

class _FizzBuzzNotifier extends ValueNotifier<int> {
  _FizzBuzzNotifier() : super(1);

  void increment() {
    value++;
  }

  String get createMessage {
    /*
    return same value if condition isn't satisfied so that its child is not notified
     */
    final result = value % 15 == 0
        ? 'FizzBuzz'
        : (value % 3 == 0 ? 'Fizz' : (value % 5 == 0 ? 'Buzz' : '-'));
    print("count: $value, result: $result");
    return result;
  }
}
