import 'package:calculator/SimpleCalculator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData(primaryColor: Colors.blue),
      home: SimpleCalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}



