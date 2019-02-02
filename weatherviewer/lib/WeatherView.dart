/*
Name: Akshath Jain
Date: 2/2/19
Purpose: full screen page with city's weather information
*/

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.info["name"]),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black54,
        ),
        itemCount: widget.info["forecast"]["list"].length + 1, //add one for the header
        itemBuilder: (BuildContext context, int i){
          
          //becuase of the way flutter handles nested widgets that have infinite vertical scroll, 
          //just put the special information up to
          if (i == 0)
            return _currentWeather(widget);
          
          Map m = widget.info["forecast"]["list"][i];
          return Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      Utils.getDate(m["dt_txt"]),
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Spacer(),
                    Text(Utils.KtoF(m["main"]["temp_max"]).toInt().toString() + "° F"),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    Text(
                      Utils.getHour(m["dt_txt"]),
                      style: TextStyle(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Spacer(),
                    Text(Utils.KtoF(m["main"]["temp_min"]).toInt().toString() + "° F")
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: <Widget>[
                    Text(
                      m["weather"][0]["main"],
                    ),
                    Spacer(),
                    Text(
                      m["wind"]["speed"].toString() + " MPH",
                    )
                  ],
                )
              ],
            )
          );
        },
      ),
  );
  }
}

Widget _currentWeather(var widget){
  return Container(
    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        //temperature information
        Container(
          padding: const EdgeInsets.all(30.0),
          margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
          child:  Row(
            children: <Widget>[
              //current weather
              Column(
                children: <Widget>[
                    Text(Utils.KtoF(widget.info["main"]["temp"]).toInt().toString() + "°",
                    style: TextStyle(
                      fontSize: 30.0
                    )
                  ),
                ],
              ),


              SizedBox(width: 40.0,),

              //high and low
              Column(
                children: <Widget>[
                  //high
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_drop_up
                      ),
                      Text(Utils.KtoF(widget.info["main"]["temp_max"]).toInt().toString() + "°"),
                    ],
                  ),


                  //low
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.arrow_drop_down
                      ),
                      Text(Utils.KtoF(widget.info["main"]["temp_min"]).toInt().toString() + "°"),
                    ],
                  )
                ],
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15.0,
              )
            ]
          ),
        ),
      
        SizedBox(width: 20.0,),
      ],
    )
  );
}



