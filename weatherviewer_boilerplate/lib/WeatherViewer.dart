//fullpage, displays a detailed view of weather from each city

import 'package:flutter/material.dart';
import 'Utils.dart';

class WeatherView extends StatefulWidget{
  WeatherView({Key key, @required this.info}) : super(key: key);
  final Map info;

  @override 
  _WeatherViewState createState() => new _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>{
  @override
  Widget build(BuildContext context){
    return Container();
  }
}