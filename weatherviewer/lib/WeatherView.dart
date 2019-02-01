/*
Name: Akshath Jain
Date: 1/31/18
Purpose: display a cities weatehr
*/

import 'package:flutter/material.dart';
import 'APIKey.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherView extends StatefulWidget{
  WeatherView({Key key, this.cityId}) : super(key: key);
  final cityId;

  @override
  _WeatherViewState createState() => new _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView>{
  Map _info;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  }

  Future<Map> _fetchInfo() async{
    var response = await http.get("api.openweathermap.org/data/2.5/weather?id=5206379&appid=" + apikey);
    return jsonDecode(response.body);
  }
}