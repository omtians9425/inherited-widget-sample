import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inherited_widget_sample/provider_valuenotifier_version/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  //change notifier version
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        builder: (context) => FizzBuzzStringNotifier(),
        child: const MyHomePage(),
      ),
    );
  }

  //inherited and simple provider version use this
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: const MyHomePage(),
//    );
//  }
}
