import 'package:flutter/material.dart';
import 'package:marvel_comics/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel Comics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home("Marvel Comics"),
    );
  }
}
