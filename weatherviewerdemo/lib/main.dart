import 'package:flutter/material.dart';
import 'WeatherView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Viewer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather Viewer"),
        ),
        body: WeatherView()
      ),
    );
  }
}