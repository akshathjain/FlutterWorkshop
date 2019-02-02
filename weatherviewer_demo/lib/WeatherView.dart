import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherView extends StatefulWidget{
  final String name;
  WeatherView({
    Key key,
    @required
    this.name,
  }) : super(key: key);

  @override
  _WeatherViewState createState() => new _WeatherViewState();

}

class _WeatherViewState extends State<WeatherView>{
  List _info;

  @override
  void initState() {
    super.initState();

    _fetchInfo().then((List l){
      setState(() {
        this._info = l;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: _createBody(),
    );
  }

  Widget _createBody(){
    if(_info == null)
      return Center(child: CircularProgressIndicator(),);

    return ListView.builder(
      itemCount: _info.length,
      itemBuilder: (BuildContext context, int index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(_info[index]["name"]),
            Text(_info[index]["main"]["temp"].toString()),
            Card(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(_info[index]["main"]["temp_max"].toString()),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<List> _fetchInfo() async{
    final response = await http.get("https://akshathjain.com/FlutterWorkshop/json/weather_info.json");
    return json.decode(response.body);
  }

}