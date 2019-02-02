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
      children: _createGridChildren(),
    );
  }

  List<Widget> _createGridChildren(){
    List<Widget> l = new List();
    for(int i = 0; i < _info.length; i++){
      l.add(WeatherCard(
        name: _info[i]["name"],
        color: _getColor(_info[i]["name"]),
        onTap: () => print("tap"),
      ));
    }
    return l;
  }

  Color _getColor(String seed){
    int x = (seed.codeUnitAt(0) + seed.codeUnitAt(seed.length - 1)) % 7;
    switch (x){
      case 0: 
        return Colors.red;
      case 1:
        return Colors.orange;
      case 2: 
        return Colors.yellow;
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
    var response = await http.get("https://akshathjain.com/FlutterWorkshop/json/weather_info.json");
    return jsonDecode(response.body);
  }
}