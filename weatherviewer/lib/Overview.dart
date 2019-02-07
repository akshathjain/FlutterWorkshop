/*
Name: Akshath Jain
Date: 1/31/18
Purpose: display a cities weatehr
*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'WeatherCard.dart';
import 'Utils.dart';
import 'WeatherView.dart';

class Overview extends StatefulWidget{
  Overview({Key key}) : super(key: key);

  @override
  _OverviewState createState() => new _OverviewState();
}

class _OverviewState extends State<Overview>{
  List _info;

  @override
  void initState() {
    super.initState();
    _fetchInfo().then((List l){
      if(mounted){
        setState(() {
          _info = l;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_info == null)
      return Center(child: CircularProgressIndicator(),);

    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(12.0),
      children: _createGridChildren(),
    );
  }

  List<Widget> _createGridChildren(){
    List<Widget> l = new List();
    for(int i = 0; i < _info.length; i++){
      l.add(WeatherCard(
        name: _info[i]["name"],
        temperature: Utils.KtoF(_info[i]["main"]["temp"]).toInt(),
        color: _getColor(_info[i]["name"]),
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) { return WeatherView(
            info: _info[i],
          );}
        )),
      ));
    }
    return l;
  }

  int _colorSeed = 0;
  Color _getColor(String seed){
    _colorSeed++;
    switch (_colorSeed % 7){
      case 0: 
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2: 
        return Colors.amberAccent;
      case 3:
        return Colors.green;
      case 4:
        return Colors.blue;
      case 5:
        return Colors.indigo;
      case 6:
        return Colors.purple;
    }
    
    return Colors.blue;
  }

  Future<List> _fetchInfo() async{
    var response = await http.get("https://raw.githubusercontent.com/akshathjain/FlutterWorkshop/master/json/weather_info.json");
    return jsonDecode(response.body);
  }
}
