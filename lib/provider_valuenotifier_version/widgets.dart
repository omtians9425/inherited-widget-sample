import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //This is rebuilt all time when setState() unless it is const.
        child: const _Message(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          Provider.of<FizzBuzzStringNotifier>(
            context,
            listen: true,
          ).increment();
        },
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //observe parent state
    var messageFromParent = Provider.of<FizzBuzzStringNotifier>(context)
        .message; //listen property is true by default.
    print('_Message widget is built. message: $messageFromParent');

    return Text(
      'result: $messageFromParent',
      style: TextStyle(fontSize: 32),
    );
  }
}

//This is an integer change notifier, so it is always rebuilt as opposed to other versions.
class FizzBuzzNotifier extends ValueNotifier<int> {
  FizzBuzzNotifier() : super(1);

  void increment() {
    value++;
  }

  String get message {
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

class FizzBuzzStringNotifier extends ValueNotifier<String> {
  FizzBuzzStringNotifier() : super('-');
  var _count = 1;

  void increment() {
    _count++;

    ///assigning a value to ValueNotifier#value will trigger notification.
    ///1. assign a value
    ///2. ChangeNotifier#notifyListeners() will be called.
    ///3. ChangeNotifierProvider detects that
    ///4. setState() will be called and rebuild occur.
    value = message;
  }

  String get message {
    /*
    return same value if condition isn't satisfied so that its child is not notified
     */
    final result = _count % 15 == 0
        ? 'FizzBuzz'
        : (_count % 3 == 0 ? 'Fizz' : (_count % 5 == 0 ? 'Buzz' : '-'));
    print("count: $_count, result: $result");
    return result;
  }
}
