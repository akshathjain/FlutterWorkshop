/*
display weather for pittsburgh
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherView extends StatefulWidget{

  WeatherView({Key key}) : super(key: key);

  @override
  _WeatherViewState createState() => new _WeatherViewState();

}

class _WeatherViewState extends State<WeatherView>{
  String apikey = "94bdcb8cddbc7967b287648b373af671";

  Map _info;

  @override
  void initState(){
    super.initState();

    _fetchInfo().then((Map m){
      setState(() {
        _info = m;
        print(m);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_info == null) return Center(child: CircularProgressIndicator(),);
  
    return ListView(
      children: <Widget>[
        Text(_info["name"]),
        Text(KtoF(_info["main"]["temp"]).round().toString()),
        Text(_info["main"]["temp_min"].toString()),
        Text(_info["main"]["temp_max"].toString()),
      ],
    );
  }

  Future<Map> _fetchInfo() async{
    final response = await http.get("http://api.openweathermap.org/data/2.5/weather?id=5206379&appid=$apikey");
    return json.decode(response.body);
  }

  double KtoF(double kelvin){
    return 9.0/5.0 * (kelvin - 273) + 32;
  }

}