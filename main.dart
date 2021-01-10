import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GoogleMaps',
      theme: ThemeData(
       primaryColor: Colors.pink[900],
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),     
    );
  }
}
