import 'package:flutter/material.dart';

class Overview extends StatefulWidget{
  @override
  _OverviewState createState() => new _OverviewState();
}

class _OverviewState extends State<Overview>{
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Container();
  }

  Future<List> _fetchInfo() async{
    //"https://raw.githubusercontent.com/akshathjain/FlutterWorkshop/master/json/weather_info.json"
    return null;
  }
}
