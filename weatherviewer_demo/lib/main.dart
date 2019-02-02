import 'package:flutter/material.dart';
import 'WeatherView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Weather Viewer"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Click"),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return new WeatherView(
                name: "Pittsburgh",
              );
            }
          ));
        },
      ),
    );
  }
}