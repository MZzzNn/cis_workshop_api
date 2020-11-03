import 'package:flutter/material.dart';
import './features/home/view.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatefulWidget {
  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}