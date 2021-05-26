import 'package:fellotask/ui/jumpGame.dart';
import 'package:fellotask/ui/newsPage.dart';
import 'package:flutter/material.dart';
import 'ui/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

